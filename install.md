# kalix 安装文档

- [说明](##说明)
- [安装前提条件](#安装前提条件)
    - [新建工程目录](##新建工程目录)
    - [新建osgi运行目录](##新建osgi运行目录) 
- [提前预装软件](#提前预装软件)
    - [jdk](##jdk)
    - [Maven](##Maven)
    - [Karaf](##Karaf)
    - [PostgreSQL](##PostgreSQL)
    - [Redis](##Redis)
    - [Git](##Git)
    - [CouchDB](##CouchDB)
- [安装过程](#安装过程)
    - [下载工程文件](##下载工程文件)
    - [运行karaf](##运行karaf)
    - [安装karaf feature](##安装karaf-feature)
    - [发布工程文件到karaf](##发布工程文件到karaf)
    - [初始化数据](##初始化数据)
    - [访问kalix网站](##访问kalix网站)   


## 说明

本文详细的描述了kalix项目的开发环境的搭建过程，如果在安装过程中出现任何问题，请联系QQ：1907310。

目标使用环境：windows。

## 安装前提条件

### 新建工程目录

创建 D:\java-develop\project ，用于存储项目工程的根目录。

### 新建osgi运行目录

创建 D:\java-develop\tools ，用于存储karaf根目录。

## 提前预装软件

### jdk

版本：jdk-8u66-windows-x64
  
备注：需要配置JAVA_HOME环境变量。
  
### Maven

版本：apache-maven-3.3.9
  
说明：简化和标准化项目建设过程。处理编译，分配，文档，团队协作和其他任务的无缝连接。
  
备注：需要配置M2_HOME环境变量，并需要配置svn.exe文件到系统path环境变量中。
  
### Karaf

版本： [apache-karaf-4.0.7](http://karaf.apache.org)
  
说明：Karaf是一个基于OSGi的运行环境，Karaf提供了一个轻量级的OSGi容器，可以用于部署各种组件，应用程序。
  
备注：需要解包到D:\java-develop\tools\apache-karaf-4.0.7。
  
### PostgreSQL

版本：postgresql-9.4.4-3-windows-x64
  
说明：对象关系型数据库管理系统（ORDBMS）,用于数据库存储。
  
备注：需要新建数据库kalix，默认用户名：postgres，密码：1234。
  
### Redis

版本：Redis-x64-2.8.21
  
说明：Redis是一个开源的、支持网络、可基于内存亦可持久化的日志型、Key-Value数据库，并提供多种语言的API。用于cache。
  
### Git

版本：git-1.9.2
  
说明：Git是一个开源的分布式版本控制系统，用以有效、高速的处理从很小到非常大的项目版本管理。
  
备注：需要配置git.exe文件到系统path环境变量中。
  
### CouchDB

版本： [couchdb-1.6.1_R16B02](http://couchdb.apache.org)
  
说明：CouchDB是一个面向文档的数据库，在它里面所有文档域（Field）都是以键值对的形式存储的。用于存储附件、图片等。
  
备注：默认用户名：admin，密码：123456，可以访问 http://localhost:5984/_utils 地址新建数据库kalix。

## 安装过程

### 下载工程文件

```bash
   git clone https://github.com/chenyanxu/tools-parent.git
   cd tools-parent.git
   cp install.bat D:\java-develop\project
   cp build.bat D:\java-develop\project
   cd D:\java-develop\project
   install.bat
```

此时单独将会自动下载工程文件，并进行构建。

### 运行karaf

删除D:\java-develop\tools\apache-karaf-4.0.7\data目录

删除D:\java-develop\tools\apache-karaf-4.0.7\deploy下所有的文件

执行D:\java-develop\tools\apache-karaf-4.0.7\bin\karaf.bat。显示如下：

```bash
        __ __                  ____      
       / //_/____ __________ _/ __/      
      / ,<  / __ `/ ___/ __ `/ /_        
     / /| |/ /_/ / /  / /_/ / __/        
    /_/ |_|\__,_/_/   \__,_/_/         

  Apache Karaf (4.0.7)

Hit '<tab>' for a list of available commands
and '[cmd] --help' for help on a specific command.
Hit '<ctrl-d>' or type 'system:shutdown' or 'logout' to shutdown Karaf.

karaf@root()>
```

### 安装karaf feature

karaf命令提示符下，输入 feature:repo-add mvn:com.kalix.tools/tools-karaf-features/1.0.0-SNAPSHOT/xml/features

```bash
karaf@root()> feature:repo-add mvn:com.kalix.tools/tools-karaf-features/1.0.0-SNAPSHOT/xml/features
Adding feature url mvn:com.kalix.tools/tools-karaf-features/1.0.0-SNAPSHOT/xml/features
```

karaf命令提示符下，输入 feature:install -v kalix-base activiti couchdb 

安装完成后，输入 la

```bash
204 | Active   |  30 | 4.3.0                 | OPS4J Pax Web - Service SPI
205 | Active   |  80 | 1.0.0.201505202023    | org.osgi:org.osgi.service.jdbc
206 | Active   |  80 | 1.0.0.201505202024    | org.osgi:org.osgi.service.jpa
207 | Active   |  80 | 9.4.0.build-1202      | PostgreSQL JDBC Driver JDBC41
208 | Active   |  50 | 1.17.0                | SnakeYAML
209 | Active   |  10 | 3.1.4                 | Stax2 API
210 | Active   |  10 | 4.4.1                 | Woodstox XML-processor
211 | Active   |  80 | 0                     | wrap_file__C__Users_admin_.m2_repository_de_danielbechler_java-object-diff_0.92.1_java-object-diff-0.92.1.jar
212 | Active   |  50 | 0                     | wrap_file__C__Users_admin_.m2_repository_io_swagger_swagger-parser_1.0.22_swagger-parser-1.0.22.jar
karaf@root()>
```

此时karaf的运行环境已经安装成功了。

### 发布工程文件到karaf

```bash
   cd D:\java-develop\project
   build.bat
```

### 初始化数据

* karaf命令提示符下，输入 kalix:init-db

* 安装权限初始化数据,karaf命令提示符下，输入 kalix:permit

### 访问kalix网站

访问 http://localhost:8181 