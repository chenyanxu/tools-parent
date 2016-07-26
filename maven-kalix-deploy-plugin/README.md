## kalix deploy maven plugin
### 概述
a maven plugin for easy deployment of an artifact on a Apache Karaf server via REST call.
### 详细说明
1. 在kalix中执行feature:install jolokia;
2. 在需要部署的工程里面加入下面的maven plugin
```xml
                <plugin>
 				<groupId>cn.com.rexen.tools</groupId>
 				<artifactId>maven-kalix-deploy-plugin</artifactId>
 				<version>1.0.0-SNAPSHOT</version>
 				<configuration>
 					<url>http://localhost:8181/jolokia/</url>
 					<jsonInstall>
 						{
 						"type":"EXEC",
 						"mbean":"org.apache.karaf:type=bundle,name=root",
 						"operation":"install(java.lang.String,boolean)",
 						"arguments":["mvn:${project.groupId}/${project.artifactId}/${project.version}",
 						true]
 						}
 					</jsonInstall>
 					<user>karaf</user>
 					<password>karaf</password>
 					<skip>false</skip>
 				</configuration>
 			</plugin>
```
3.  在工程的pluin里面找到maven-kalix-deploy-plugin，执行deploy，此时当前的bundle就会被发布到karaf中，
    如果karaf已经存在该bundle，将会被更新。

