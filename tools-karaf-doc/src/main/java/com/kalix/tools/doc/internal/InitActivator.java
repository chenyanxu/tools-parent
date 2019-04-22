package com.kalix.tools.doc.internal;

import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;


/**
 * Created by sunlf on 18-12-16.
 */
public class InitActivator implements BundleActivator {

    @Override
    public void start(BundleContext bundleContext) throws Exception {
        System.out.println("start tools doc!");
    }

    @Override
    public void stop(BundleContext bundleContext) throws Exception {
        System.out.println("stop tools doc!");
    }


}
