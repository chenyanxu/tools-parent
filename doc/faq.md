# faq

- [如何获得 osgi service](#如何获得-osgi-service)
- [如何获得 bundleContext](如何获得-bundleContext)

## 如何获得 osgi service

### blueprint 方式 

### jndi 方式

## 如何获得 bundleContext

### blueprint 方式 

> 在blueprint里面增加一行  
``` <property name="bundleContext" ref="blueprintBundleContext"/> ```

```xml
     <?xml version="1.0" encoding="UTF-8"?>
     <blueprint xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns="http://www.osgi.org/xmlns/blueprint/v1.0.0"
                xsi:schemaLocation="http://www.osgi.org/xmlns/blueprint/v1.0.0
                http://www.osgi.org/xmlns/blueprint/v1.0.0/blueprint.xsd">
         <bean id="bundleServiceImpl" class="com.kalix.framework.osgi.core.BundleServiceImpl">
             <property name="bundleContext" ref="blueprintBundleContext"/>
         </bean>
         <service id="bundleService" interface="com.kalix.framework.osgi.api.IBundleService"
                  ref="bundleServiceImpl">
         </service>
     </blueprint>
```

### activator 方式 

```java
public class InitActivator implements BundleActivator {
    private static BundleContext context;

    @Override
    public void start(BundleContext bundleContext) throws Exception {
        SystemUtil.startBundlePrintln(bundleContext);
        context = bundleContext;
    }

    @Override
    public void stop(BundleContext bundleContext) throws Exception {
        SystemUtil.stopBundlePrintln(bundleContext);
        this.context = null;
    }

    public static BundleContext getBundleContext() {
        return context;
    }
}
```