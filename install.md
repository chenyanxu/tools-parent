# kalix 安装文档

## 说明
本文详细的描述了kalix项目的安装使用过程，如果在安装过程中出现任何问题，请联系QQ：1907310
目标使用环境：windows。

## 安装前提条件

## 文件目录

1. 新建工程目录
创建 D:\java-develop\project ，用于存储项目工程的根目录。

2. 新建osgi运行目录
创建 D:\java-develop\tools ，用于存储karaf根目录。

## 提前预装软件

1. **jdk**
  版本：jdk-8u66-windows-x64
  备注：需要配置JAVA_HOME环境变量。
2. **Karaf**
  版本： [apache-karaf-4.0.7](http://karaf.apache.org)
  说明：Karaf是一个基于OSGi的运行环境，Karaf提供了一个轻量级的OSGi容器，可以用于部署各种组件，应用程序。
3. **PostgreSQL**
  版本：postgresql-9.4.4-3-windows-x64
  说明：对象关系型数据库管理系统（ORDBMS）,用于数据库存储。
4. **Redis**
  版本：Redis-x64-2.8.21
  说明：Redis是一个开源的、支持网络、可基于内存亦可持久化的日志型、Key-Value数据库，并提供多种语言的API。用于cache。
5. **Git**
  版本：git-1.9.2
  说明：Git是一个开源的分布式版本控制系统，用以有效、高速的处理从很小到非常大的项目版本管理。
6. **CouchDB**
  版本： [couchdb-1.6.1_R16B02](http://couchdb.apache.org)
  说明：CouchDB是一个面向文档的数据库，在它里面所有文档域（Field）都是以键值对的形式存储的。用于存储附件、图片等。
