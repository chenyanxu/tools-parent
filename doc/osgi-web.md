# osgi web

## servlet  
```xml
<?xml version="1.0" encoding="UTF-8"?>
<blueprint xmlns="http://www.osgi.org/xmlns/blueprint/v1.0.0"
           xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    
    <bean id="camelServlet" class="org.apache.camel.component.servlet.CamelHttpTransportServlet"/>
    
    <!-- 
        Enlist it in OSGi service registry 
        This will cause two things:
        1) As the pax web whiteboard extender is running the CamelServlet will
           be registered with the OSGi HTTP Service
        2) It will trigger the HttpRegistry in other bundles so the servlet is
           made known there too
    -->
    <service ref="camelServlet">
        <interfaces>
            <value>javax.servlet.Servlet</value>
            <value>org.apache.camel.component.http.CamelServlet</value>
        </interfaces>
        <service-properties>
            <entry key="alias" value="/camel/services" />
            <entry key="matchOnUriPrefix" value="true" />
            <entry key="servlet-name" value="CamelServlet"/>
        </service-properties>
    </service>

</blueprint>
```

## filter
```xml
    <service id="servletFilterService" interface="javax.servlet.Filter">
		<service-properties>
			<entry key="urlPatterns" value="/filtered/*"/>
		</service-properties>
		<bean class="org.ops4j.pax.web.extender.samples.whiteboard.internal.WhiteboardFilter"/>
	</service>
```
