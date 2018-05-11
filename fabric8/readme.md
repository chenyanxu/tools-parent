## fabric8 feature
### karaf archetype
```batch
org.apache.karaf.archetypes	karaf-blueprint-archetype	4.2.0  
org.apache.karaf.archetypes	karaf-bundle-archetype	4.2.0  
org.apache.karaf.archetypes	karaf-kar-archetype	4.2.0  
org.apache.karaf.archetypes	karaf-feature-archetype	4.2.0  
org.apache.karaf.archetypes	karaf-command-archetype	4.2.0  
org.apache.karaf.archetypes	karaf-assembly-archetype	4.2.0  
```
### add fabric8 feature
feature:repo-add mvn:io.fabric8/fabric8-karaf-features/3.0.11/xml/features
### add fabric8 dependency
```batch
    <fabric8.version>3.0.11</fabric8.version>
    <dependency>
      <groupId>io.fabric8</groupId>
      <artifactId>fabric8-karaf-features</artifactId>
      <version>${fabric8.version}</version>
      <classifier>features</classifier>
      <type>xml</type>
    </dependency>
```
### feature file content
```batch
<features xmlns="http://karaf.apache.org/xmlns/features/v1.2.0" name="fabric8-karaf-features-3.0.11">

  <repository>mvn:io.fabric8.kubernetes/kubernetes-karaf/3.0.3/xml/features</repository>

  <feature name="fabric8-karaf-core" description="Fabric8 Karaf Core" version="3.0.11">
    <feature>scr</feature>
    <feature>aries-blueprint</feature>
    <feature>kubernetes-client</feature>
    <bundle dependency="true">mvn:commons-codec/commons-codec/1.10</bundle>
    <bundle dependency="true">mvn:org.apache.commons/commons-lang3/3.7</bundle>
    <bundle start-level="60">mvn:io.fabric8/fabric8-karaf-core/3.0.11</bundle>
  </feature>

  <feature name="fabric8-karaf-blueprint" description="Fabric8 Karaf Blueprint" version="3.0.11">
    <feature>fabric8-karaf-core</feature>
    <bundle start-level="65">mvn:io.fabric8/fabric8-karaf-blueprint/3.0.11</bundle>
  </feature>

  <feature name="fabric8-karaf-cm" description="Fabric8 Karaf ConfigAdmin Bridge" version="3.0.11">
    <feature>fabric8-karaf-core</feature>
    <bundle start-level="65">mvn:io.fabric8/fabric8-karaf-cm/3.0.11</bundle>
  </feature>

  <feature name="fabric8-karaf-checks" description="Fabric8 Karaf Checks" version="3.0.11">
    <feature>scr</feature>
    <feature>http</feature>
    <bundle start-level="65">mvn:io.fabric8/fabric8-karaf-checks/3.0.11</bundle>
  </feature>

</features>
```
### add fabric8-maven-plugin
```batch
    <fabric8.maven.plugin.version>3.5.38</fabric8.maven.plugin.version>
    <plugin>
        <groupId>io.fabric8</groupId>
        <artifactId>fabric8-maven-plugin</artifactId>
        <version>${fabric8.maven.plugin.version}</version>
        <executions>
          <execution>
            <id>generate-resource</id>
            <phase>generate-resources</phase>
            <goals>
              <goal>resource</goal>
            </goals>
          </execution>
          <execution>
            <id>build-image</id>
            <phase>install</phase>
            <goals>
              <goal>build</goal>
            </goals>
          </execution>
        </executions>
      </plugin>
```