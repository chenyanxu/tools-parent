# 数据持久化（JPA）
## transaction 事务控制
> blueprint 配置
```java
    <blueprint xmlns:jpa="http://aries.apache.org/xmlns/jpa/v2.0.0"
               xmlns:tx="http://aries.apache.org/xmlns/transactions/v1.2.0"
               default-activation="eager"
               xmlns="http://www.osgi.org/xmlns/blueprint/v1.0.0">
        <jpa:enable/>
        <tx:enable-annotations/>
    </blueprint>
```

> 在需要添加事务处理的方法中加入```@Transactional```即可
```java
    @Override
    @Transactional
    public void doDelete(Long entityId, JsonStatus jsonStatus) {
        dao.remove(entityId);
        jsonStatus.setSuccess(true);
        jsonStatus.setMsg("删除成功！");
    }
```

> **事务的控制必须抛出异常，否则无法生效。**

> **示例：**事务处理的错误写法，异常被捕获，事务无法回滚。
```java
@Override
    @Transactional
    public JsonStatus deleteEntity(Long entityId) {
        JsonStatus jsonStatus = new JsonStatus();
        try {
            if (isDelete(entityId, jsonStatus)) {
                beforeDeleteEntity(entityId, jsonStatus);
                doDelete(entityId, jsonStatus);
                afterDeleteEntity(entityId, jsonStatus);
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonStatus.setFailure(true);
            jsonStatus.setMsg("删除失败！");
        }
        return jsonStatus;
    }
```

> **示例：**事务生效的正确写法
```java
    @Override
    @Transactional
    public JsonStatus deleteEntity(Long entityId) {
        JsonStatus jsonStatus = new JsonStatus();
        try {
            if (isDelete(entityId, jsonStatus)) {
                beforeDeleteEntity(entityId, jsonStatus);
                doDelete(entityId, jsonStatus);
                afterDeleteEntity(entityId, jsonStatus);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throws new RuntimeException("删除失败！");
        }
        return jsonStatus;
    }
```

