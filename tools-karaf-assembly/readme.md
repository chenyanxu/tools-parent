# 用于定制发布karaf
## karaf-maven-plugin 说明
* startupFeatures
All the bundles from your feature will appear in the startup.properties, copied to system/ and started with the Karaf.

* bootFeature
All the bundles from your feature will be copied to system/. The features you listed will appear in org.apache.karaf.features.cfg and installed when starting Karaf. The path to your feature.xml will be added to org.apache.karaf.features.cfg as feature repository.

* installFeatures
All the bundles from your feature will be copied to system/. The path to your feature.xml will be added to org.apache.karaf.features.cfg as feature repository.

参考[Assemble Your Custom Apache Karaf with the Karaf-Maven-Plugin](https://dzone.com/articles/assemble-your-custom-apache)
## 备注
**关于config文件的创建**
在assembly的时候，config文件并不会第一时间在etc目录创建，当karaf启动的时候，才会在etc目录生成。

## 客户化
[Custom distribution with custom startup script](http://karaf.922171.n3.nabble.com/Custom-distribution-with-custom-startup-script-td4038689.html)

## reference

https://github.com/juttayaya/karaf

https://github.com/apache/karaf/blob/karaf-4.0.x/assemblies/apache-karaf/pom.xml

