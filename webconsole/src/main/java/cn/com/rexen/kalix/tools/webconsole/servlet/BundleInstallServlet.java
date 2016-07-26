package cn.com.rexen.kalix.tools.webconsole.servlet;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.osgi.framework.BundleContext;
import org.osgi.framework.BundleException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

public class BundleInstallServlet extends HttpServlet {

    private BundleContext bundleContext;

    public BundleInstallServlet(BundleContext bundleContext) {
        this.bundleContext = bundleContext;
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html");

        PrintWriter out = resp.getWriter();
        if (ServletFileUpload.isMultipartContent(req)) {

            ServletFileUpload uploadHandler = new ServletFileUpload();
            try {
                FileItemIterator iterator = uploadHandler.getItemIterator(req);
                while (iterator.hasNext()) {
                    FileItemStream fis = iterator.next();
                    if (!fis.isFormField()) {
                        InputStream is = fis.openStream();
                        bundleContext.installBundle("file:upload/" + fis.getName(), is);
                        break; // stop iterating
                    }
                }
                out.println("{success: true}");
            } catch (FileUploadException e) {
                e.printStackTrace();
                out.println("{success: false}");
                // jsonResponse.put("success", false);
            } catch (BundleException e) {
                e.printStackTrace();
                out.println("{success: false");
            }
        } else {
            out.println("{success: false}");
            // jsonResponse.put("success", false);
        }
    }

}
