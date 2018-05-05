# kalix在openshift环境下，建立测试工程
## 建立karaf的s2i镜像
```batch
git clone https://github.com/minikiller/s2i
cd  s2i/karaf/images/jboss
./build.sh
```
## build hello world
```
 oc new-app --strategy=source kalix-s2i~git://github.com/minikiller/camel-hello-world \
 -e MAVEN_ARGS="install -P karaf-assemble"
 oc set env bc/camel-hello-world MAVEN_ARGS="install -P karaf-assemble"
 oc logs -f  bc/camel-hello-world
 oc expose svc/camel-hello-world
```
## add health check
add java library
```batch
    <dependency>
      <groupId>io.fabric8</groupId>
      <artifactId>fabric8-karaf-features</artifactId>
      <version>${fabric8.version}</version>
      <classifier>features</classifier>
      <type>xml</type>
      <scope>runtime</scope>
    </dependency>
```
add assembly
```batch
<plugin>
          <groupId>org.apache.karaf.tooling</groupId>
          <artifactId>karaf-maven-plugin</artifactId>
          <version>${karaf.plugin.version}</version>
          <extensions>true</extensions>
          <configuration>
            <!-- do not include build output directory -->
            <includeBuildOutputDirectory>false</includeBuildOutputDirectory>
            <!-- no startupFeatures -->
            <bootFeatures>

              <feature>wrap</feature>
              <feature>shell</feature>
              <feature>shell-compat</feature>
              <feature>feature</feature>
              <feature>ssh</feature>
              <feature>bundle</feature>
              <feature>config</feature>
              <feature>deployer</feature>
              <feature>diagnostic</feature>
              <feature>feature</feature>
              <feature>instance</feature>
              <feature>kar</feature>
              <feature>package</feature>
              <feature>service</feature>
              <feature>jaas</feature>
              <feature>management</feature>
              <feature>log</feature>
              <feature>system</feature>
              <feature>aries-blueprint</feature>
              <feature>webconsole</feature>
              <feature>fabric8-karaf-blueprint</feature>
              <feature>fabric8-karaf-checks</feature>
              <feature>camel-core</feature>
              <feature>camel-blueprint</feature>
            </bootFeatures>
            <bootBundles>
              <bootBundle>mvn:org.apache.camel/camel-core/${camel.version}</bootBundle>
              <bootBundle>mvn:org.apache.camel/camel-catalog/${camel.version}</bootBundle>
              <bootBundle>mvn:org.apache.camel/camel-blueprint/${camel.version}</bootBundle>
              <!--<bundle>mvn:${project.groupId}/${project.artifactId}/${project.version}</bundle>-->
            </bootBundles>
          </configuration>
        </plugin>
```
add health check
```batch
oc set probe dc/camel-hello-world --readiness --get-url=http://:8181/readiness-check
oc set probe dc/camel-hello-world --liveness --get-url=http://:8181/health-check
```