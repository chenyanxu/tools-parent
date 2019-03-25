package com.kalix.tools.hadoop.internal;

//import com.kalix.framework.core.util.SystemUtil;
import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;

/**
 * Created by sunlf on 14-3-23.
 */
public class InitActivator implements BundleActivator {

    private static BundleContext context;
    @Override
    public void start(BundleContext bundleContext) throws Exception {
//        SystemUtil.startBundlePrintln(bundleContext);
        System.out.println("started");
        context=bundleContext;
    }

    @Override
    public void stop(BundleContext bundleContext) throws Exception {
//        SystemUtil.stopBundlePrintln(bundleContext);
        System.out.println("stopped");
        context=null;
    }

    public static BundleContext getBundleContext(){
        return context;
    }
}
