# tools-karaf-command

## 自定义karaf command

  需要注意osgi.bnd文件中的 Karaf-Commands: *，只有加入这行，command才可以起作用。

## 本模块用于扩展karaf的命令
  目前实现了数据库的初始化功能。

## debug maven plugin
  http://blog.csdn.net/mn960mn/article/details/48417207

## 实现逻辑
* sql语句通过ide的Database工具倒出
* 在resources下建立对应app名字的.list文件，在文件中加入需要初始化的sql语句
  * 例如对应admin应用建立admin.list文件
  * 如果想初始化组织结构，在admin.list文件中加入kalix_public_sys_organization.sql

## 实现的karaf命令

* kalix:list
  * 列出当前目录下全部的sql文件
* kalix:run
  * 运行特定的sql文件，注意需要去掉.sql后缀
* kalix:init-db
  * 根据.list文件，执行相应的sql文件
* kalix:permit
  * 实现了admin的初始化
    * 插入admin用户
    * 插入"超级管理员"角色
    * 授权admin用户"超级管理员"角色
    * 初始化组织结构表
    * 初始化职务表duty
    * 分配admin用户组织结构id为1