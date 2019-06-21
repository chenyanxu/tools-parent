# publish a class as osgi service
## Hello class
```
public class Hello {
    public void say(){
        System.out.println("hello");
    }
}
```
## blueprint file
```
<blueprint xmlns="http://www.osgi.org/xmlns/blueprint/v1.0.0" default-activation="lazy">

    <bean id="helloBean" class="com.kalix.testing.Hello"/>
    <!--    <service ref="helloBean" auto-export="all-classes"/>-->
    <service ref="helloBean" interface="com.kalix.testing.Hello"/>
```
## client to use Hello class
```
<blueprint xmlns="http://www.osgi.org/xmlns/blueprint/v1.0.0">

    <bean id="serviceBean" class="com.kalix.client.MyServiceImpl" init-method="init">
        <property name="hello" ref="myhello"/>
    </bean>

<!--    <service ref="serviceBean" interface="com.kalix.client.MyService"/>-->

    <reference xmlns:ext="http://aries.apache.org/blueprint/xmlns/blueprint-ext/v1.0.0" id="myhello"
               interface="com.kalix.testing.Hello" ext:proxy-method="classes"/>

</blueprint>
```

> warning: using class should set interface to class ,also add 
```
ext:proxy-method="classes"
```


