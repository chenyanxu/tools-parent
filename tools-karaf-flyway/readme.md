# tools-karaf-flyway
本模块用于数据库的版本升级以及维护
## 默认设置baseline为1，执行成功后，数据库schema_version表的数据为：

```
1	1	<< Flyway Baseline >>	BASELINE	<< Flyway Baseline >>		postgres	2016-10-17 21:28:37.512	0	t
2	2	init	SQL	V2__init.sql	-963441802	postgres	2016-10-17 21:28:37.604	19	t
3	2.1	add person	SQL	V2_1__add_person.sql	1218304230	postgres	2016-10-17 21:28:37.639	5	t
```

## 手工安装flyway

install mvn:org.flywaydb/flyway-core/4.0.3

## 版本号规则

SQL 脚本文件及Java 代码类名必须遵循以下命名规则：V<version>[_<SEQ>][__description] 。版本号的数字间以小数点（. ）或下划线（_ ）分隔开，版本号与描述间以连续的两个下划线（__ ）分隔开。如V1_1_0__Update.sql 。Java 类名规约不允许存在小数点，所以Java 类名中版本号的数字间只能以下划线进行分隔。

## 测试代码

* V2__init.sql
* V2_1__add_person.sql

## flyway的坑
### 执行sql语句
> 因为类路径的问题，必须把bundle设置为fragment方式，才可以运行db.migration下的sql文件，需要设置
> osgi.bnd
```bash
#Bundle-Activator: ${bundle.namespace}.internal.InitActivator
Bundle-Category: Kalix Karaf Tools
Fragment-Host: org.flywaydb.core
Import-Package:*
```
>需要使用blueprint方式初始化flyway。
>但是该方法会导致karaf下全部的bundle重启，调试非常麻烦。

### 执行java代码方式
>注释掉blueprint，该方式无法执行sql脚本。
> osgi.bnd
```bash
Bundle-Activator: ${bundle.namespace}.internal.InitActivator
Bundle-Category: Kalix Karaf Tools
#Fragment-Host: org.flywaydb.core
Import-Package:*
```




