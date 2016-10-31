# 数据持久化（JPA）
## transaction 事务控制
> method 
```java
<blueprint xmlns:jpa="http://aries.apache.org/xmlns/jpa/v2.0.0"
           xmlns:tx="http://aries.apache.org/xmlns/transactions/v1.2.0"
           default-activation="eager"
           xmlns="http://www.osgi.org/xmlns/blueprint/v1.0.0">
    <jpa:enable/>
    <tx:enable-annotations/>
</blueprint>
```

```java
@Override
    @Transactional
    public void doDelete(long entityId, JsonStatus jsonStatus) {
        dao.remove(entityId);
        jsonStatus.setSuccess(true);
        jsonStatus.setMsg("删除成功！");
    }
```

> 事务的控制必须抛出异常，否则无法生效。

>事务无效的写法
```java
@Override
    @Transactional
    public JsonStatus deleteEntity(long entityId) {
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

> 事务生效的写法
```java
@Override
    @Transactional
    public JsonStatus deleteEntity(long entityId) {
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