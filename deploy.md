## 校园信息化安装步骤
### 更新操作系统
```batch
yum update
```
### 安装jdk
```batch
yum install java-1.8.0-openjdk*
```
#### 设置环境变量
```batch
vim /etc/profile
```
```batch
#set java environment  
JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.el7_5.x86_64
JRE_HOME=$JAVA_HOME/jre  
CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib 
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin 
export JAVA_HOME JRE_HOME CLASS_PATH PATH 
```
```batch
source /etc/profile
```
### 创建工程目录
```batch
 mkdir -p /java-develop/project
```
### 安装git
```batch
yum install git
```
###  安装maven
```batch
wget http://mirror.bit.edu.cn/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
Downlaod the file at /opt/Maven/apache-maven-3.0.5-bin.tar.gz
Extract the file in same location "tar xvf apache-maven-3.0.5-bin.tar.gz" and Run.
Open "vi /etc/profile"
Paste these line:
export M2_HOME=/root/java-develop/tools/apache-maven-3.5.3
export PATH=$PATH:$M2_HOME/bin
Save the file.
Run "source /etc/profile" 使环境变量生效
Finally Run "mvn -version " and you will get the maven version
```
#### install openjpa
```batch
mvn install:install-file -Dfile=./openjpa-2.4.0.Release.jar -DgroupId=org.apache.openjpa -DartifactId=openjpa -Dversion=2.4.0.Release -Dpackaging=jar

mvn install:install-file -Dfile=./openjpa-2.4.0.Release.pom -DgroupId=org.apache.openjpa -DartifactId=openjpa -Dversion=2.4.0.Release -Dpackaging=pom
```
### 安装karaf
```batch
wget  http://archive.apache.org/dist/karaf/4.1.2/apache-karaf-4.1.2.tar.gz
mkdir /java-develop/tools
tar xvf apache-karaf-4.1.2.tar.gz
karaf@root()> feature:install service-wrapper
wrapper:install
```
### remove connect karaf
```batch
ssh -p 8101 karaf@localhost
```
### 安装redis
#### epel
```batch
 wget  http://mirrors.kernel.org/fedora-epel/epel-release-latest-7.noarch.rpm
 rpm -Uvh epel-release-latest-7.noarch.rpm
```
#### redis
```batch
yum install redis
service redis start
chkconfig redis on
```
### 安装 postgresql
refer https://www.jianshu.com/p/7e95fd0bc91a
```batch
 wget https://download.postgresql.org/pub/repos/yum/9.5/redhat/rhel-7-x86_64/pgdg-centos95-9.5-2.noarch.rpm
 rpm -ivh pgdg-centos95-9.5-2.noarch.rpm
 yum install postgresql95-server postgresql95-contrib
 /usr/pgsql-9.5/bin/postgresql95-setup initdb
 systemctl enable postgresql-9.5.service
```
#### 配置远程访问
```batch
     vim /var/lib/pgsql/9.5/data/postgresql.conf
      修改#listen_addresses = 'localhost'  为  listen_addresses='*'
     *表示所有地址，也可以是指定的单个IP
     vim /var/lib/pgsql/9.5/data/pg_hba.conf
     修改如下内容，加入一行：
     # IPv4 local connections:
     host    all             all         0.0.0.0/0               trust
     修改配置后需要重启：
     systemctl restart postgresql-9.5.service
```
pg_hba.conf should be :
```batch
# "local" is for Unix domain socket connections only
local   all              postgres                               trust
# IPv4 local connections:
host    all             all             127.0.0.1/32            trust
host    all             all         0.0.0.0/0               trust
```

### 安装couchdb
https://www.howtoforge.com/tutorial/how-to-install-apache-couchdb-on-centos-7/
#### Enabling the Apache CouchDB package repository
Place the following text into /etc/yum.repos.d/bintray-apache-couchdb-rpm.repo:
```batch
[bintray--apache-couchdb-rpm]
name=bintray--apache-couchdb-rpm
baseurl=http://apache.bintray.com/couchdb-rpm/el$releasever/$basearch/
gpgcheck=0
repo_gpgcheck=0
enabled=1
```

```
vim /opt/couchdb/etc/local.ini
[chttpd]
port = 5984
bind_address = 192.168.10.30

```

### install
```batch
yum -y install epel-release && yum install couchdb
```
http://blog.csdn.net/wh211212/article/details/74359497

### 安装项目工程
```batch
git clone https://github.com/chenyanxu/kalix-parent.git
git clone https://github.com/chenyanxu/framework-parent.git
git clone https://github.com/chenyanxu/admin-parent.git
git clone https://github.com/chenyanxu/middleware-parent.git
git clone https://github.com/chenyanxu/oa-parent.git
git clone https://github.com/chenyanxu/common-parent.git
git clone https://github.com/chenyanxu/tools-parent.git

```

###  添加防火墙规则
    firewall-cmd --zone=public --add-port=80/tcp --permanent
    
    命令含义：
    --zone #作用域
    --add-port=80/tcp 添加端口，格式为：端口/通讯协议
    --permanent 永久生效，没有此参数重启后失效
        systemctl restart firewalld 

###  install nodejs

```batch
curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
yum -y install nodejs
```

```batch
给你一个更好的安装办法，哈哈（版本号自己看看https://npm.taobao.org/mirrors/node）：

curl -O http://cdn.npm.taobao.org/dist/node/v6.9.1/node-v6.9.1-linux-x64.tar.gz && \
  tar --strip-components 1 -xzvf node-v* -C /usr/local && \
  node --version
```
###  install yarn 
```batch
 wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
 yum install yarn 
 yarn config set registry https://registry.npm.taobao.org
 yarn config set sass-binary-site= http://npm.taobao.org/mirrors/node-sass
```

### modify config to start nodejs
```batch
vim config/index.js
```
change host: 'localhost', to host: '192.168.88.235'

```batch
vim src/config/global.toml
```

change baseURL = "http://localhost:8181"

### setup nginx
refer to http://blog.csdn.net/wild46cat/article/details/78025042
```batch

```

#### vue打包项目后刷新404的问题Nginx配置
```batch
server {  
    listen      80;  
    server_name  localhost;  
    index index.html;  
    root /root/dist;  
    location / {  
        root /root/dist;  
        try_files $uri $uri/ /index.html =404;  
    }  
}  
```

### install jenkins
refer to https://pkg.jenkins.io/redhat-stable/
http://blog.csdn.net/kefengwang/article/details/54233584