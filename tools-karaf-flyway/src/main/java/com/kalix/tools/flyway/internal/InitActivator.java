package com.kalix.tools.flyway.internal;

import com.kalix.framework.core.util.JNDIHelper;
import com.kalix.framework.core.util.SystemUtil;
import org.flywaydb.core.Flyway;
import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;

import javax.sql.DataSource;

/**
 * Created by sunlf on 14-3-23.
 */
public class InitActivator implements BundleActivator {

    private static BundleContext context;
    private DataSource datasource;

    @Override
    public void start(BundleContext bundleContext) throws Exception {

        SystemUtil.startBundlePrintln(bundleContext);
        startFlyway();
        context = bundleContext;
    }

    private void startFlyway() {
        try {
            datasource = JNDIHelper.getJNDIServiceForName(DataSource.class.getName(), "(osgi.jndi.service.name=jdbc/ds)");
            Flyway flyway = new Flyway();
            ClassLoader thisClassLoader = this.getClass().getClassLoader();
            flyway.setDataSource(datasource);
            flyway.setClassLoader(thisClassLoader);
            flyway.setBaselineOnMigrate(true);
            flyway.setLocations("db.migration", "com.kalix.tools.flyway");
            flyway.migrate();

            System.out.println("New schema version: " + flyway.info().current().getVersion());

//            System.exit(0);
        } catch (Throwable t) {
            t.printStackTrace();
            // System.exit(0);
        }
    }

    @Override
    public void stop(BundleContext bundleContext) throws Exception {
        SystemUtil.stopBundlePrintln(bundleContext);
        context = null;
    }

    public static BundleContext getBundleContext() {
        return context;
    }
}
