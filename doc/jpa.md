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

> 方法加入```@Transactional```即可
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

## 异常控制

> 在 framework-parent\core-parent\framework-core-impl 的 KalixCamelHttpTransportServlet 中实现了对异常返回的封装
```java
        if (exchange.getException() == null) {
            consumer.getBinding().writeResponse(exchange, response);
        } else {
            response.setHeader("Content-Type", " text/html;charset=utf-8");
            response.getWriter().write("{success:false,msg:'" + exchange.getException().getMessage() + "'}");
        }
```        