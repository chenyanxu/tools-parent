package cn.com.rexen.kalix.tools.webconsole.servlet;

import org.codehaus.jackson.map.ObjectMapper;
import org.osgi.framework.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@SuppressWarnings("serial")
public class ServicesServlet extends HttpServlet {

    private BundleContext bundleContext;

    public ServicesServlet(BundleContext bundleContext) {
        this.bundleContext = bundleContext;
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        try {
            ServiceReference[] serviceReferences = bundleContext.getAllServiceReferences(null, null);
            JsonServices jsonServices = new JsonServices(serviceReferences);
            ObjectMapper om = new ObjectMapper();
            om.writeValue(resp.getWriter(), jsonServices);
        } catch (InvalidSyntaxException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    ;

    class JsonServices {
        List<JsonService> services;

        JsonServices(ServiceReference[] serviceReferences) {
            if (serviceReferences != null) {
                services = new ArrayList<JsonService>(serviceReferences.length);
                for (ServiceReference ref : serviceReferences) {
                    services.add(new JsonService(ref));
                }
            }
        }

        public List<JsonService> getServices() {
            return services;
        }
    }

    class JsonService {
        ServiceReference serviceReference;

        JsonService(ServiceReference serviceReference) {
            this.serviceReference = serviceReference;
        }

        public Long getId() {
            return (Long) serviceReference.getProperty(Constants.SERVICE_ID);
        }

        public String getTypes() {
            return getPropertyAsString(serviceReference.getProperty(Constants.OBJECTCLASS));
        }

        public String getPid() {
            return String.valueOf(serviceReference.getProperty(Constants.SERVICE_PID));
        }

        public JsonBundle getBundle() {
            return new JsonBundle(serviceReference.getBundle());
        }

        public List<JsonProperty> getProperties() {
            List<JsonProperty> properties = new ArrayList<JsonProperty>();
            String[] keys = serviceReference.getPropertyKeys();
            for (String key : keys) {
                if (!key.equals(Constants.SERVICE_ID) && !key.equals(Constants.OBJECTCLASS)) {
                    properties.add(new JsonProperty(key, getPropertyAsString(serviceReference.getProperty(key))));
                }
            }
            return properties;
        }

        public List<JsonBundle> getUsingBundles() {
            Bundle[] bundles = serviceReference.getUsingBundles();
            if (bundles != null) {
                List<JsonBundle> jsonBundles = new ArrayList<JsonBundle>();
                for (Bundle bundle : bundles) {
                    jsonBundles.add(new JsonBundle(bundle));
                }
                return jsonBundles;
            } else {
                return Collections.emptyList();
            }
        }

		/*public List<JsonMethod> getPublicMethods() {
            Object service = bundleContext.getService(serviceReference);
			Class<?> serviceClass = service.getClass();
			Method[] declaredMethods = serviceClass.getDeclaredMethods();
			if (declaredMethods != null) {
				List<JsonMethod> methods = new ArrayList<JsonMethod>(declaredMethods.length);
				for (Method m : declaredMethods) {
					methods.add(new JsonMethod(m));
				}
				return methods;
			} else {
				return Collections.emptyList();
			}
		}*/
    }

    class JsonProperty {
        String key;
        String value;

        JsonProperty(String key, String value) {
            this.key = key;
            this.value = value;
        }

        public String getKey() {
            return key;
        }

        public String getValue() {
            return value;
        }
    }

    class JsonMethod {
        Method method;

        JsonMethod(Method method) {
            this.method = method;
        }

        public String getName() {
            return method.getName();
        }

        public String getSignature() {
            StringBuilder sb = new StringBuilder();
            sb.append(method.getName());
            sb.append("(");
            Class<?>[] parameterTypes = method.getParameterTypes();
            if (parameterTypes != null) {
                for (int i = 0; i < parameterTypes.length; i++) {
                    sb.append(parameterTypes[i].getName());
                    if (i < parameterTypes.length - 1) {
                        sb.append(", ");
                    }
                }
            }
            sb.append(")");
            return sb.toString();
        }

        public List<String> getParameters() {
            Class<?>[] parameterTypes = method.getParameterTypes();
            List<String> params = new ArrayList<String>();
            for (Class<?> type : parameterTypes) {
                params.add(type.getName());
            }
            return params;
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

    String getPropertyAsString(Object value) {
        if (value == null) {
            return "N/A";
        } else if (value.getClass().isArray()) {
            return Arrays.deepToString((Object[]) value);
        } else {
            return String.valueOf(value);
        }
    }


}
