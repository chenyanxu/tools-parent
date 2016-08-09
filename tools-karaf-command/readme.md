# 自定义karaf command
  需要注意osgi.bnd文件中的 Karaf-Commands: *，只有加入这行，command才可以起作用。

# 本模块用于扩展karaf的命令
  目前实现了数据库的初始化功能。

# debug maven plugin
  http://blog.csdn.net/mn960mn/article/details/48417207
# 实现逻辑
* sql语句通过ide的Database工具倒出
* 在resources下建立对应app名字的.list文件，在文件中加入需要初始化的sql语句

# target karaf 4.0.5