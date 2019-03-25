# tools-karaf-backup
*　本模块用于数据库的备份
## postgresql backup
https://github.com/apache/karaf/blob/master/examples/karaf-scheduler-example/karaf-scheduler-example-features/src/main/feature/feature.xml
参考：https://github.com/jgilsonsi/backup-postgresql
＊　使用karaf的feature服务scheduler
```
>karaf feature:install scheduler

```
* change postgresql config file
```
# IPv4 local connections:
host    all             all             127.0.0.1/32            trust
host    all             all             192.168.1.1/24            md5
# IPv6 local connections:
```
* add pg_dump to system path 
在windows下需要增加postgresql的bin目录到path环境变量中。

## couchdb backup
1. 内部复制
2. 命令复制
https://github.com/danielebailo/couchdb-dump.git
3. 外部复制





