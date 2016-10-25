# kalix 基础服务
> kalix封装的一些基础服务，用于支持应用开发。

- [IService](#IService)
- [cache service](#cache-service)
- [stack service](#stack-service)
- [shiro service](#shiro-service)
- [system service](#system-service)

# IService
> kalix 服务的所有根接口

```java
    package com.kalix.framework.core.api;

    public interface IService {
    }
```

## cache service
> 缓存服务接口类

```java
package com.kalix.framework.core.api.cache;

import com.kalix.framework.core.api.IService;
import java.util.Set;

public interface ICacheManager extends IService {

    /**
     * 保存对象
     *
     * @param key   key
     * @param value value
     */
    <T> void save(String key, T value);

    /**
     * 保存对象（带失效时间）
     *
     * @param key
     * @param value
     * @param sec   单位（秒）
     * @param <T>
     */
    <T> void save(String key, T value, int sec);

    /**
     * 是否存在KEY
     *
     * @param key
     * @return
     */
    Boolean exists(String key);

    /**
     * 获取对象
     *
     * @param key
     * @return
     */
    String get(String key);

    byte[] getObj(String key);

    /**
     * 删除对象
     *
     * @param key
     */
    void del(String key);

    /**
     * 删除被匹配到了的key
     *
     * @param keysPattern
     */
    void deleteByKeysPattern(String keysPattern);


    /**
     * 获取匹配到了的key
     *
     * @param keysPattern
     * @return
     */
    Set<byte[]> getKeysByKeysPattern(String keysPattern);
}
```

## stack service
> 堆栈服务接口类

```java
package com.kalix.framework.core.api.system;

import com.kalix.framework.core.api.IService;

/**
 * 堆栈服务接口类
 */
public interface IStackService extends IService {
    /**
     * 发布消息到队列
     *
     * @param topic   topic
     * @param msgJson JSON 格式的消息
     * @param seconds 超时时间,传0为一直有效
     */
    void publish(String topic, String msgJson, int seconds);
    /**
     * 读取消息队列
     * @param topic   topic
     * @return JSON String
     * */
    String consume(String topic);
}
```

## shiro service
> 包括当前登录用户的服务接口类

```java
package com.kalix.framework.core.api.security;

import com.kalix.framework.core.api.persistence.JsonStatus;
import com.kalix.framework.core.api.IService;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

public interface IShiroService  extends IService {
    /**
     * 获得当前登录用户 登录名
     *
     * @return 登录名
     */
    String getCurrentUserLoginName();

    /**
     * 获得当前登录用户 真实姓名
     *
     * @return 真实姓名
     */
    String getCurrentUserRealName();

    /**
     * 获得当前登录用户 用户ID
     *
     * @return 用户ID
     */
    Long getCurrentUserId();

    /**
     * 返回当前登录用户
     * @return
     */
    Subject getSubject();

    /**
     * 获得shiro的session
     *
     * @return
     */

    Session getSession();

    /**
     * sessionid校验用户是否登录
     *
     * @return
     */
    JsonStatus validSession(String sessionId);

    /**
     * 根据sessionId校验该用户是否具有权限
     *
     * @param sessionId  session id
     * @param permission 功能id
     * @return
     */
    JsonStatus validPermission(String sessionId, String permission);
}
```

## system service
> 系统菜单服务实现类

```java
package com.kalix.framework.core.api.web;

import com.kalix.framework.core.api.persistence.JsonStatus;
import com.kalix.framework.core.api.web.model.*;
import com.kalix.framework.core.api.IService;

import java.util.List;
import java.util.Map;

public interface ISystemService  extends IService {
    /**
     * 返回所有应用
     * @return
     */
    List<WebApplicationBean> getApplicationList();

    /**
     * 返回指定应用下模块列表
     * @param applicationId
     * @return
     */
    List<ModuleBean> getModuleByApplication(String applicationId);

    /**
     * 返回指定模块下菜单
     * @param moduleId
     * @return
     */
    MenuBean getMenuByModule(String moduleId);

    /**
     * 判断按钮权限
     * 生成JSON如下:
     *    [{
     *        permission:"admin:sysModule:permissionControl:userMenu:add",
     *        status:true
     *    }]
     * @param permission
     * @return
     */
    Map getButtonsByPermission(String permission);

    /**
     * 获得登录组件信息
     * @return
     */
    LoginBean getLogin();

    /**
     * 获取用户偏好
     */
    Map getUserPreferences();
    /**
     * 设置用户偏好
     */
    JsonStatus setUserPreferences(String key, String value);
}

```

## bundle service
> 控制app启动和停止的服务

```java
package com.kalix.framework.osgi.api;

import java.util.Map;

public interface IBundleService  extends IService {
    /**
     * 启动一个app
     * @param id appId
     * @return 返回信息
     */
    Map startApp(String id);

    /**
     * 停止一个app
     * @param id appId
     * @return 返回信息
     */
    Map stopApp(String id);

    /**
     * 获得一个app的当前状态
     * @param appIds appIds以 _ 分隔
     * @return 返回信息
     */
    Map getAppStatus(String appIds);//connect by '_'
}

```
