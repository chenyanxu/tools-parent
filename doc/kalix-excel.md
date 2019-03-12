# kalix excel 开发excel导入导出功能说明

## 后台说明

> 开发需要增加excel的模板及对应的DTO模型，位于[xxx]-parent/[app]-[xxx]-dto下，参考如enrolment-parent/question-parent/enrolment-question-dto
> 建立包com.kalix.middleware.excel.api.model.[app].[xxx]，包下建立DTO模型，模型内属性需要相应标签设置
> osgi.bnd需要修改(export自己建立的包名)
~~~
    Import-Package:*
    Export-Package: com.kalix.middleware.excel.api.model.[app].[xxx],com.kalix.[app].[xxx].dto.model
~~~
> pom文件需要引用
~~~
    <dependencies>
        <dependency>
            <groupId>com.kalix.middleware.excel</groupId>
            <artifactId>middleware-excel-api</artifactId>
        </dependency>
    </dependencies>
~~~
> rest发布服务地址及基类实现，位置middleware-parent/excel-parent
> excel导入rest地址见middleware-excel-rest/excel-upload.xml(/camel/rest/excel/upload)
> excel导入实现，位置com.kalix.middleware.excel.rest.ExcelProcessor/com.kalix.middleware.excel.biz.ExcelServiceImpl
> excel导出rest地址见middleware-excel-biz/excel-download.xml(/camel/servlet/exportExcel)
> excel导出实现，位置com.kalix.middleware.excel.biz.ExportExcelServlet/com.kalix.middleware.excel.biz.ExportExcelServiceImpl

## 前台说明

### 基础组件封装

> excel导入路径kalix-vue-lib/src/components/common/baseImportExcel.vue
> 配置文件kalix-vue-frame/src/config/global.toml 访问服务地址importExcelURL = "/camel/rest/excel/upload"

### 具体使用，参考如下

> kalix-vue-enrolment/src/lib/questioninput/choice/choice.vue,
> kalix-vue-enrolment/src/lib/questioninput/choice/choiceImport.vue
