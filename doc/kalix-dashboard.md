# kalix dashboard 开发应用仪表盘说明

## 后台说明

> 开发位于需要增加dashboard的[app]-parent/core-parent下，参考如admin-parent/core-parent
> 需要module[xxx]-core-etc/[xxx]-core-biz/[xxx]-core-rest
> etc配置文件 config.[app].dashboard.cfg，详细说明见config.admin.dashboard.cfg
> biz服务 extends BaseDashboardServiceImpl implements IDashboardService
  接口位于com.kalix.framework.core.api.biz.IDashboardService，基类实现位于com.kalix.framework.core.impl.biz.BaseDashboardServiceImpl
> rest发布服务 参考见admin-dashboard-rest.xml

## 前台说明

### 基础组件封装

> 路径kalix-vue-lib/src/components/common/dashboard，
> 图标库kalix-vue-frame/src/icons/svg

### 具体使用

> kalix-vue-frame/src/components/welcome/welcome.vue
