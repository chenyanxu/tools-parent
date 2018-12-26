package com.kalix.tools.kibana.internal;

import com.kalix.framework.core.util.SystemUtil;
import com.kalix.tools.kibana.KibanaController;
import org.apache.karaf.features.FeatureEvent;
import org.apache.karaf.features.FeaturesListener;
import org.apache.karaf.features.RepositoryEvent;
import org.eclipse.jetty.proxy.ProxyServlet;
import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import org.osgi.framework.ServiceReference;
import org.osgi.service.http.HttpService;
import org.osgi.util.tracker.ServiceTracker;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.Dictionary;
import java.util.Hashtable;


/**
 * Created by sunlf on 18-12-16.
 */
public class InitActivator implements BundleActivator {
    private final static Logger LOGGER = LoggerFactory.getLogger(InitActivator.class);
    private KibanaController kibanaController;
//    private ServiceTracker httpTracker;

    @Override
    public void start(BundleContext bundleContext) throws Exception {
        SystemUtil.startBundlePrintln(bundleContext);
        kibanaController = new KibanaController(new File(new File(System.getProperty("karaf.data"), "decanter"), "kibana"));
        LOGGER.info("Downloading Kibana ...");
//        kibanaController.download();
        LOGGER.info("Starting Kibana ...");
        kibanaController.start();

//        注册kibana的代理
//        httpTracker = new ServiceTracker(bundleContext, HttpService.class.getName(), null) {
//            @Override
//            public Object addingService(ServiceReference ref) {
//                HttpService httpService = (HttpService) bundleContext.getService(ref);
//                try {
//                    Dictionary<String, String> kibanaParams = new Hashtable<>();
//                    kibanaParams.put("proxyTo", "http://localhost:5601/");
//                    kibanaParams.put("prefix", "/kibana");
//                    System.out.println("Starting Kibana proxy");
//                    LOGGER.info("Starting Kibana proxy ...");
//                    httpService.registerServlet("/kibana", new ProxyServlet.Transparent(), kibanaParams, null);
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//                return httpService;
//            }
//
//            public void removedService(ServiceReference ref, Object service) {
//                try {
//                    LOGGER.info("Stopping Kibana proxy ...");
//                    ((HttpService) service).unregister("/kibana");
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            }
//        };
//        httpTracker.open();

        int httpPort = 5601;
        String hostname = "http://localhost:";
        CollectorListener listener = new CollectorListener(hostname,httpPort);
        bundleContext.registerService(FeaturesListener.class, listener, null);

    }

    @Override
    public void stop(BundleContext bundleContext) throws Exception {
//        httpTracker.close();
        SystemUtil.stopBundlePrintln(bundleContext);
//        kibanaController.stop();
    }

    class CollectorListener implements FeaturesListener {

        private int httpPort;
        private String hostname;

        public CollectorListener(String hostname,int httpPort) {
            this.httpPort = httpPort;
            this.hostname=hostname;
        }

        @Override
        public void featureEvent(FeatureEvent event) {
            if (event.getType().equals(FeatureEvent.EventType.FeatureInstalled)) {
                if (event.getFeature().getName().equalsIgnoreCase("decanter-collector-log")) {
                    LOGGER.debug("Decanter Kibana detected installation of the decanter-collector-log feature");
                    try {
                        kibanaController.createDashboardLog(hostname,httpPort);
                    } catch (Exception e) {
                        LOGGER.warn("Can't create Kibana Log dashboard", e);
                    }
                }
                if (event.getFeature().getName().equalsIgnoreCase("decanter-collector-jmx-core")) {
                  LOGGER.debug("Decanter Kibana detected installation of the decanter-collector-jmx-core feature");
                    try {
                        kibanaController.createDashboardJmx(hostname,httpPort);
                    } catch (Exception e) {
                        LOGGER.warn("Can't create Kibana JMX dashboard", e);
                    }
                }
            }
        }

        @Override
        public void repositoryEvent(RepositoryEvent repositoryEvent) {
            // nothing to do
        }

    }
}
