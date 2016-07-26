package cn.com.rexen.kalix.tools.webconsole.servlet;

import org.codehaus.jackson.map.ObjectMapper;
import org.osgi.framework.Bundle;
import org.osgi.framework.BundleContext;
import org.osgi.framework.Constants;
import org.osgi.framework.ServiceReference;
import org.osgi.service.log.LogEntry;
import org.osgi.service.log.LogReaderService;
import org.osgi.service.log.LogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@SuppressWarnings("serial")
public class LogServlet extends HttpServlet {

    private BundleContext bundleContext;

    public LogServlet(BundleContext bundleContext) {
        this.bundleContext = bundleContext;
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        LogReaderService logReader = getLogReaderService();
        if (logReader != null) {
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            @SuppressWarnings("unchecked")
            Enumeration<LogEntry> logEntries = logReader.getLog();
            List<JsonLogEntry> jsonLogEntries = new ArrayList<JsonLogEntry>();
            while (logEntries.hasMoreElements()) {
                jsonLogEntries.add(new JsonLogEntry(logEntries.nextElement()));
            }
            ObjectMapper om = new ObjectMapper();
            om.writeValue(resp.getWriter(), jsonLogEntries);
        } else {
            resp.sendError(HttpServletResponse.SC_SERVICE_UNAVAILABLE,
                    "LogReaderService not available"); // TODO MORE DESCRIPTIVE
            // MESSAGE
        }
    }

    LogReaderService getLogReaderService() {
        ServiceReference ref = bundleContext
                .getServiceReference(LogReaderService.class.getName());
        return (LogReaderService) (ref != null ? bundleContext.getService(ref)
                : null);
    }

    class JsonLogEntry {
        LogEntry logEntry;

        public JsonLogEntry(LogEntry logEntry) {
            this.logEntry = logEntry;
        }

        public Date getTime() {
            return new Date(logEntry.getTime());
        }

        public String getMessage() {
            return logEntry.getMessage();
        }

        public String getLevel() {
            switch (logEntry.getLevel()) {
                case LogService.LOG_DEBUG:
                    return "DEBUG";
                case LogService.LOG_INFO:
                    return "INFO";
                case LogService.LOG_WARNING:
                    return "WARNING";
                case LogService.LOG_ERROR:
                    return "ERROR";
                default:
                    return String.valueOf(logEntry.getLevel());
            }
        }

        public JsonException getException() {
            Throwable exception = logEntry.getException();
            if (exception != null) {
                return new JsonException(exception);
            } else {
                return null;
            }
        }

        public JsonBundle getBundle() {
            Bundle bundle = logEntry.getBundle();
            return bundle != null ? new JsonBundle(bundle) : null;
        }

        public JsonService getService() {
            ServiceReference ref = logEntry.getServiceReference();
            return ref != null ? new JsonService(ref) : null;
        }

    }

    class JsonBundle {
        Bundle bundle;

        JsonBundle(Bundle bundle) {
            this.bundle = bundle;
        }

        public Long getId() {
            return bundle.getBundleId();
        }

        public String getSymbolicName() {
            return bundle.getSymbolicName();
        }
    }

    class JsonService {
        ServiceReference ref;

        JsonService(ServiceReference ref) {
            this.ref = ref;
        }

        public Long getId() {
            return (Long) ref.getProperty(Constants.SERVICE_ID);
        }

        public String getTypes() {
            return Arrays.toString((String[]) ref.getProperty(Constants.OBJECTCLASS));
        }

    }

    class JsonException {
        Throwable throwable;

        public JsonException(Throwable throwable) {
            this.throwable = throwable;
        }

        public String getMessage() {
            return throwable.getMessage();
        }

        public Collection<JsonStackTraceElement> getStackTrace() {
            StackTraceElement[] elements = throwable.getStackTrace();
            if (elements != null) {
                List<JsonStackTraceElement> jsonElements = new ArrayList<JsonStackTraceElement>();
                for (StackTraceElement e : elements) {
                    jsonElements.add(new JsonStackTraceElement(e));
                }
                return jsonElements;
            } else {
                return Collections.emptyList();
            }
        }
    }

    class JsonStackTraceElement {
        StackTraceElement element;

        JsonStackTraceElement(StackTraceElement element) {
            this.element = element;
        }

        public String getClassName() {
            return element.getClassName();
        }

        public String getMethodName() {
            return element.getMethodName();
        }

        public String getFileName() {
            return element.getFileName();
        }

        public int getLineNumber() {
            return element.getLineNumber();
        }
    }

}
