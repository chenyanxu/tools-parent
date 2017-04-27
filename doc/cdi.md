# kalix CDI 技术文档
> refer doc: https://access.redhat.com/documentation/en-us/red_hat_jboss_fuse/6.3/html/deploying_into_apache_karaf/paxcdi

## pom文件中增加对pax-cdi的依赖

```batch
<dependency>
    <groupId>javax.enterprise</groupId>
    <artifactId>cdi-api</artifactId>
</dependency>
<dependency>
    <groupId>org.ops4j.pax.cdi</groupId>
    <artifactId>pax-cdi-api</artifactId>
</dependency>
```

# karaf 增加pax-cdi feature

```batch
karaf@root()> feature:install pax-cdi  pax-cdi-weld  
```

##  osgi.bnd 文件中增加如下内容：

```
Require-Capability : osgi.extender; filter:="(osgi.extender=pax.cdi)",\
                     org.ops4j.pax.cdi.extension; filter:="(extension=pax-cdi-extension)"
```

##  增加测试代码

```java
import javax.inject.Inject;

import com.kalix.middleware.oauth.api.biz.IClientBeanService;
import com.kalix.middleware.oauth.entities.ClientBean;
import org.ops4j.pax.cdi.api.OsgiService;
import org.ops4j.pax.cdi.api.OsgiServiceProvider;

/**
 * Created by admin on 2017/4/26.
 */
@OsgiServiceProvider
public class Hello implements IWorld{
    @Inject
    @OsgiService
    private IClientBeanService clientBeanService;

    @Override
    public String say() {
        ClientBean client=new ClientBean();
        client.setClientName("fdfd");
        clientBeanService.saveEntity(client);
        return "this";
    }

    public void test(){
        ClientBean client=new ClientBean();
        client.setClientName("fdfd");
        clientBeanService.saveEntity(client);
    }
}
```

## 在webconsole中可以看到如下，证明cdi安装成功
```bash
Service ID 594	Types: org.osgi.service.blueprint.container.BlueprintContainer
Service ID 595	Types: java.lang.Object
Component Name: d65cff34-cd83-481e-975f-bdc91f953114
Component ID: 1
Service ID 596	Types: com.kalix.framework.core.api.biz.IBizService, com.kalix.middleware.oauth.api.biz.IClientBeanService, com.kalix.framework.core.api.IService
Service ID 597	Types: com.kalix.framework.core.api.biz.IBizService, com.kalix.framework.core.api.IService, com.kalix.middleware.oauth.api.biz.IUserBeanService
Service ID 598	Types: com.kalix.middleware.oauth.api.biz.IOauthService
Service ID 599	Types: com.kalix.middleware.oauth.biz.World
Service ID 600	Types: org.ops4j.pax.cdi.spi.CdiContainer
Service ID 601	Types: javax.enterprise.inject.spi.BeanManager
```