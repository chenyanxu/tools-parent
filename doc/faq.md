# faq

- [如何获得 osgi service](#如何获得-osgi-service)
- [如何获得 bundleContext](#如何获得-bundleContext)
- [debug karaf](#debug-karaf)
- [减少redis占用空间](#减少redis占用空间)
- [修改karaf默认端口](#修改karaf默认端口)

## 如何获得 osgi service

### blueprint 方式

```xml
<blueprint xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
           xmlns="http://www.osgi.org/xmlns/blueprint/v1.0.0"
           xmlns:tx="http://aries.apache.org/xmlns/transactions/v1.2.0"
           xsi:schemaLocation="http://www.osgi.org/xmlns/blueprint/v1.0.0 http://www.osgi.org/xmlns/blueprint/v1.0.0/blueprint.xsd
">
    <tx:enable-annotations/>
    <reference id="shiroService" interface="com.kalix.framework.core.api.security.IShiroService"/>
    <reference id="auditService" interface="com.kalix.admin.audit.api.biz.IAuditBeanService"/>
    <reference id="newsBeanDao" interface="com.kalix.common.news.api.dao.INewsBeanDao"/>

    <service id="newsBeanService" interface="com.kalix.common.news.api.biz.INewsBeanService"
             ref="beanServiceImpl"/>

    <bean id="beanServiceImpl" class="com.kalix.common.news.biz.NewsBeanServiceImpl">
        <tx:transaction method="*" value="Required"/>
        <property name="shiroService" ref="shiroService"/>
        <property name="auditBeanService" ref="auditService"/>
        <property name="dao" ref="newsBeanDao"/>
    </bean>

</blueprint>
```

### jndi 方式

```java
    try {
            this.eventAdmin = JNDIHelper.getJNDIServiceForName(EventAdmin.class.getName());
        } catch (IOException e) {
            e.printStackTrace();
        }
```

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

## debug karaf
> 设置环境变量 ```set KARAF_DEBUG=true```
>运行karaf，显示：
```bash
karaf.bat: Enabling Java debug options: -agentlib:jdwp=transport=dt_socket,serve
r=y,suspend=n,address=5005
Listening for transport dt_socket at address: 5005
```

## 减少redis占用空间

> 默认情况下，redis会占用c盘大量的物理空间，通过以下方式可以减少占用；

> 删除```C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Redis```

> 修改文件：```redis.windows-service.conf```

```bash
maxheap 1024000000

# The heap memory mapped file must reside on a local path for heap sharing
# between processes to work. A UNC path will not suffice here. For maximum
# performance this should be located on the fastest local drive available.
# This value defaults to the local application data folder(e.g.,
# "%USERPROFILE%\AppData\Local"). Since this file can be very large, you
# may wish to place this on a drive other than the one the operating system
# is installed on.
#
# Note that you must specify a directory here, not a file name
heapdir D:\tools\redis-data
```

## 修改karaf默认端口
> 配置文件位于```D:\java-develop\tools\apache-karaf-4.0.7\etc\org.ops4j.pax.web.cfg```
```xml
    javax.servlet.context.tempdir = D:\\java-develop\\tools\\apache-karaf-4.0.7\\data/pax-web-jsp
    org.ops4j.pax.web.config.file = D:\\java-develop\\tools\\apache-karaf-4.0.7/etc/jetty.xml
    org.osgi.service.http.port = 8181
```

## 启动karaf多实例
```bash
    karaf@root()> instance:create second
    karaf@root()> instance:start second
```

