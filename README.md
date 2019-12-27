# tools-parent
工具包
## build.bat
用于自动化build整个工程，copy到project目录中，执行即可。
## tools-karaf-assembly
整个建立karaf部署文件
## tools-karaf-branding
kalix brand
## tools-karaf-command
karaf自定义命令,refer to its readme
## tools-karaf-features
kalix项目的feature文件，tools-karaf-assembly使用该文件build karaf。
## osgi demo
https://github.com/juezhan/osgidemo

### upgrade log
http://karaf.922171.n3.nabble.com/OpenJPA-with-AriesJPA-Java-peristence-td4053032.html

### need todo 
* https://github.com/jbonofre/karaf-vineyard
* https://github.com/jbonofre/karaf-hadoop
* https://github.com/jbonofre/karaf-boot

### keycloak
https://github.com/keycloak/keycloak/tree/1.2.0.Beta1/examples/fuse
http://www.voidcn.com/article/p-perkrkba-bqt.html
* https://github.com/ops4j/org.ops4j.pax.keycloak

### also need to do
``` 
Developer commands
karaf@root()> bundle:diag
karaf@root()> bundle:load-test
karaf@root()> bundle:tree-show
karaf@root()> system:framework -debug
...
● Artifacts watcher (automatically update SNAPSHOT)
karaf@root()> bundle:watch *
```
### 
https://github.com/jonashackt/spring-boot-vuejs

### shiro
https://github.com/apache/aries/tree/trunk/blueprint/blueprint-authz
https://github.com/apache/aries-jax-rs-whiteboard/tree/master/integrations/shiro

https://github.com/apache/aries-rsa

### pax-web https support
refer to http://blog.nanthrax.net/?p=316
#### create key 
```java
keytool -genkey -keyalg RSA -validity 365 -alias serverkey -keypass password -storepass password -keystore keystore.jks
```
#### changed etc/org.ops4j.pax.web.cfg
```java
org.osgi.service.http.secure.enabled=true
org.ops4j.pax.web.ssl.keystore=D:\\java-develop\\keystore.jks
org.ops4j.pax.web.ssl.password=password
org.ops4j.pax.web.ssl.keypassword=password
org.osgi.service.http.port.secure=8443
```
#### restart webconsole  
```java
19:51:19.785 INFO [paxweb-config-1-thread-2] Started default@4c245f39{HTTP/1.1,[http/1.1]}{0.0.0.0:8181}
19:51:19.796 INFO [activator-1-thread-4] Http plugin activated
19:51:19.806 INFO [paxweb-config-1-thread-2] x509=X509@726c703b(serverkey,h=[],w=[]) for SslContextFactory@23de3a88[provider=null,keyStore=file:///D:/java-develop/keystore.jks,trustStore=null]
19:51:19.880 INFO [paxweb-config-1-thread-2] Started secureDefault@2a3d21fb{SSL,[ssl, http/1.1]}{0.0.0.0:8443}
19:51:19.881 INFO [paxweb-config-1-thread-2] Started @308568ms
```
#### check in webconsole
you can access webconsole in https://localhost:8443/system/console/bundles

### web

#### swagger
http://localhost:8181/swagger
src: framework-parent/framework-webapp-swagger

#### oauth2 
http://localhost:8181/oauth2/index.jsp
用户名:admin 密码：1234
src: middleware-parent/oauth-parent

#### websocket 
http://localhost:8181/websocket-chat
src: middleware-parent/websocket-parent

#### jdbc
https://access.redhat.com/documentation/en-us/red_hat_fuse/7.1/html/transaction_guide/using-jdbc-data-sources#canonical-pax-jdbc-config-example

#### 数据库纠错 pg
SELECT * FROM pg_stat_activity;
可以查询当前执行的sql语句

### add couchdb https
#### download openssl from https://tecadmin.net/install-openssl-on-windows/ 
#### create privkey.pem and couchdb.pem
```
openssl genrsa > privkey.pem
openssl req -new -x509 -key privkey.pem -out couchdb.pem -days 1095
```
#### change configuration
Now, you need to edit CouchDB’s configuration, by editing your local.ini file. Here is what you need to do.
Under the [ssl] section, enable HTTPS and set up the newly generated certificates:

```
[ssl]
enable = true
cert_file = /etc/couchdb/cert/couchdb.pem
key_file = /etc/couchdb/cert/privkey.pem
```
####  restart couchdb service 
you can access web https://localhost:6984/