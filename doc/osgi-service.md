# OSGI 系统服务

> 本文对kalix中使用到的OSGI的系统服务，进行了说明，并具体举例如何在kalix中使用这些服务。
开发人员可以参考本文。

- [Apache Felix Configuration Admin Service](#apache-felix-configuration-admin-service)
- [Apache Felix Preferences Service](#apache-felix-preferences-service)
- [Apache Felix Event Admin](#apache-felix-event-admin)
- [Pax Logging Service](#pax-logging-service)
- [Pax Web Service](#pax-web-service)
- [Pax jdbc](#pax-jdbc)
- [Felix Web Console](#felix-web-console)
- [JNDI Service](#jndi-service)
- [karaf 参考资料](#karaf-参考资料)

## [Apache Felix Configuration Admin Service](http://felix.apache.org/documentation/subprojects/apache-felix-config-admin.html)

> OSGi的配置管理：简称ConfigAdmin

### 利用blueprint来实现ConfigAdmin

## [Apache Felix Preferences Service](http://felix.apache.org/documentation/subprojects/apache-felix-preferences-service.html)

## [Apache Felix Event Admin](http://felix.apache.org/documentation/subprojects/apache-felix-event-admin.html)

## [Pax Logging Service](https://ops4j1.jira.com/wiki/display/paxlogging/Pax+Logging)
> 特点：
* Log4J driving the backend implementation.
* Log4J API supported.
* Jakarta Commons Logging API supported.
* Pax Logging Service implements the standard OSGi Log Service API.
* JDK Logging API support.
* Avalon Logger API support.
* SLF4J API support.
* Knopflerfish Log service support.
* Tomcat Juli API support.

## [Pax Web Service](https://ops4j1.jira.com/wiki/display/paxweb/Pax+Web)
> pax 4.0 支持
* Servlet 3.0
* JSP 2.0
* JSF 2.1
* Jetty 9.0.x
* Tomcat 7.x (still experimental, but better supported)
* support of CDI (through Pax-CDI)
* support of only Servlet 3.0 annotated Servlets in JAR
* Web-Fragments

## [Pax jdbc](https://ops4j1.jira.com/wiki/display/PAXJDBC)
### install

```bash
    karaf@root()> feature:repo-add mvn:org.ops4j.pax.jdbc/pax-jdbc-features/0.9.0/xml/features
    karaf@root()> feature:install pax-jdbc-postgresql pax-jdbc-config
```

### postgresql datasource
> 数据源配置文件：org.ops4j.datasource-kalix.cfg,文件位于：
D:\java-develop\project\tools-parent\tools-karaf-features\src\main\resources\org.ops4j.datasource-kalix.cfg，
配置文件命名必须以org.ops4j.datasource-XXX.cfg格式。

```bash
    osgi.jdbc.driver.name=PostgreSQL JDBC Driver-pool-xa
    serverName=postgresql-db.database.svc.cluster.local
    databaseName=kalix
    portNumber=5432
    user=postgres
    password=1234
    dataSourceName=jdbc/ds
```

### 查看datasource安装是否成功
```bash
    karaf@root()> service:list javax.sql.DataSource
    [javax.sql.DataSource]
    ----------------------
    databaseName = kalix
    dataSourceName = jdbc/ds
    felix.fileinstall.filename = file:/D:/java-develop/tools/apache-karaf-4.0.7/etc/org.ops4j.datasource-kalix.cfg
    osgi.jdbc.driver.name = PostgreSQL JDBC Driver-pool-xa
    osgi.jndi.service.name = jdbc/ds
    password = 1234
    portNumber = 5432
    serverName = localhost
    service.bundleid = 193
    service.factoryPid = org.ops4j.datasource
    service.id = 246
    service.pid = org.ops4j.datasource.efc786fc-361e-4184-ad98-cb4e7a3960bf
    service.scope = singleton
    user = postgres
    Provided by :
    OPS4J Pax JDBC Config (193)
    Used by:
    Apache Aries JPA container (95)
    Kalix Middleware Workflow Engine (249)
```

## [Felix Web Console](http://felix.apache.org/documentation/subprojects/apache-felix-web-console.html)

### install

```bash
    karaf@root()> feature:install webconsole
```

## [JNDI Service](http://aries.apache.org/modules/jndiproject.html)
### install

```bash
    karaf@root()> feature:install jndi
```

### 说明
>  在osgi注册的每个osgi service都会自动注册一个jndi名字，这样就可以通过jndi获得osgi service。

> The osgi:service lookup scheme is defined by the JNDI Service Specification and follows the scheme:

```
    osgi:service/<interface>[/<filter>]
```

### Kalix 示例
> framework-core-util中JNDIHelper类封装了利用jndi服务使用osgi service的方法
```java
public static final <T> T getJNDIServiceForName(String serviceName) throws IOException
public static final <T> T getJNDIServiceForName(String serviceName, String filter) throws IOException
```

## karaf 参考资料
* [Karaf Tutorials](http://liquid-reality.de/display/liquid/Karaf+Tutorials)
* [blueprint reference](http://www.ibm.com/developerworks/cn/opensource/os-osgiblueprint/)