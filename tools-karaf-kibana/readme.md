# tools-karaf-kibana
* 本模块用于定制kibana，自动增加log和jmx的dashboard

参考：https://github.com/apache/karaf-decanter/backend/kibana-6.x

## 依赖
```
install -s mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.jsch/0.1.55_1
```

## logstash-kalix.conf
导入外部log文件到es中，新建一个文件，此时logstash监控该文件，然后复制log内容给这个文件，就会进行正常解析了。

