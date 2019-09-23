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