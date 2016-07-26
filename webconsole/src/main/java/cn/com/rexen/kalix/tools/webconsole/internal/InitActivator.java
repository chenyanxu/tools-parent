package cn.com.rexen.kalix.tools.webconsole.internal;

import cn.com.rexen.core.util.SystemUtil;
import cn.com.rexen.kalix.tools.webconsole.servlet.*;
import org.apache.log4j.Logger;
import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import org.osgi.framework.ServiceReference;
import org.osgi.service.http.HttpService;

/**
 * Created by sunlf on 14-3-23.
 */
public class InitActivator implements BundleActivator {

    private static final String BUNDLE_NAME = " Kalix Tools WebConsole ";
    private static BundleContext bundleContext;
    private static Logger logger = Logger.getLogger(InitActivator.class);
    private HttpService httpService;

    @Override
    public void start(BundleContext bundleContext) throws Exception {
        SystemUtil.succeedPrintln(String.format("Start-up %s bundle!!", BUNDLE_NAME) + bundleContext.getBundle());
        InitActivator.bundleContext = bundleContext;
//        String httpServiceFilter = String.format("(objectClass=%s)", HttpService.class.getName());
        ServiceReference<HttpService> httpServiceRefs = bundleContext.getServiceReference(HttpService.class);
        httpService = bundleContext.getService(httpServiceRefs);
        if (httpServiceRefs != null) {
            registerServletsAndResources();
        } /*else {
            bundleContext.addServiceListener(this, httpServiceFilter);
        }*/
    }

    @Override
    public void stop(BundleContext bundleContext) throws Exception {
        SystemUtil.succeedPrintln(String.format("Stop %s bundle!!", BUNDLE_NAME) + bundleContext.getBundle());
        InitActivator.bundleContext = null;
        if (httpService != null) {
            httpService.unregister("/webconsole");
        }
    }

    void registerServletsAndResources() {
        try {
//            httpService = (HttpService) bundleContext.getService(httpServiceRef);
//            httpService.registerResources("/webconsole", "/web", null);

            SystemInfoServlet systemInfoServlet = new SystemInfoServlet();
            BundlesServlet bundleServlet = new BundlesServlet(bundleContext);
            BundleInstallServlet bundleInstallServlet = new BundleInstallServlet(bundleContext);
            ServicesServlet servicesServlet = new ServicesServlet(bundleContext);
            LogServlet logServlet = new LogServlet(bundleContext);

            httpService.registerServlet("/webconsole/service/system", systemInfoServlet, null, null);
            httpService.registerServlet("/webconsole/service/bundles", bundleServlet, null, null);
            httpService.registerServlet("/webconsole/service/bundles/install", bundleInstallServlet, null, null);
            httpService.registerServlet("/webconsole/service/services", servicesServlet, null, null);
            httpService.registerServlet("/webconsole/service/log", logServlet, null, null);

        } catch (Exception e) {
            System.err.println("Error while registering resources and servlets: " + e);
        }

    }
}
