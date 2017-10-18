# kalix data auth 数据权限实现说明

## 数据权限规定

> 数据权限分为四种，目前存在admin_dict字典中
> 0 仅本人数据
> 1 所有数据
> 2 所在组织机构数据
> 3 所在组织机构及以下数据

## 数据权限业务逻辑

### 总体规定

> 根据应用与菜单查找sys_function表设置，判断是否开启功能数据权限，默认未开启，按查询1所有数据处理；
  如果开启，查找sys_data_auth与sys_data_auth_user表设置，查找当前用户设置的数据权限，0根据业务数据createById查找，
  1不需要处理，2和3根据业务数据orgId查找（注：数据权限设置2和3时要求业务数据必须存在orgId字段，目前工作流符合要求）；
  如果未设置即未查到数据，默认按0处理（本人数据）

### 具体操作

> 1、执行kalix:permit授权操作，sys_function表会初始化数据
     其中表datapermissionkey字段代表rest请求bean名称（要求全部小写）
     表datapermission字段代表是否开启功能数据权限，t开启/f未开启
     该设置可通过前台Admin应用-系统功能-修改来实现配置
> 2、使用Admin应用-数据权限管理功能来实现管理配置数据权限（即操作sys_data_auth表）
     及为用户配置自己的数据权限（即操作sys_data_auth_user表）
