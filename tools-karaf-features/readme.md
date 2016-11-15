1.本模块主要功能是用于发布karaf的feature
2.在karaf 4.0.5版本中执行如下命令
feature:repo-add mvn:cn.com.rexen.core/karaf-features/1.0/xml/features
feature:repo-add mvn:org.apache.cxf.karaf/apache-cxf/2.7.10/xml/features
feature:repo-add mvn:org.apache.shiro/shiro-features/1.2.3/xml/features
部署全部：
feature:install iris-all
部署运行环境：
feature:install webconsole openjpa pax-wicket couchdb
install wrap:mvn:org.wicketstuff/wicketstuff-shiro/6.14.0
install wrap:mvn:org.apache.velocity/velocity/1.6.3
install wrap:mvn:org.freemarker/freemarker/2.3.19
install wrap:mvn:org.antlr/stringtemplate/4.0.2

karaf@root()> feature:repo-add mvn:org.apache.karaf.cellar/apache-karaf-cellar/3.0.0/xml/features
karaf@root()> feature:install -v cellar

karaf@root()> feature:repo-add mvn:org.apache.karaf.cave/apache-karaf-cave/3.0.0/xml/features
karaf@root()> feature:install cave-server

安装ace客户端
install mvn:org.apache.ace/org.apache.ace.managementagent/0.8.1-incubator

Activemq setup:
feature:repo-add mvn:org.apache.cxf.karaf/apache-cxf/2.7.13/xml/features
feature:repo-add mvn:org.apache.activemq/activemq-karaf/5.10.0/xml/features
feature:repo-add mvn:org.apache.camel.karaf/apache-camel/2.14.0/xml/features

Drools feature install

add following maven:

        <dependency>
            <groupId>org.drools</groupId>
            <artifactId>drools-karaf-features</artifactId>
            <version>6.1.0.Final</version>
        </dependency>

      then feature:repo-add  mvn:org.drools/drools-karaf-features/6.1.0.Final/xml/features


安装开发环境
1.删除karaf目录下的data目录,然后删除deploy目录下的全部jar包
2.重启karaf后，命令行输入 feature:repo-add mvn:com.kalix.tools/tools-karaf-features/1.0.1-SNAPSHOT/xml/features
3.输入 feature:install -v kalix-base activiti couchdb，此时开发环境以及安装成功
4.在idea环境下运行install，如果看到下面的画面，就说明安装成功！

    ********************************************************************
    *** WARNING: Wicket is running in DEVELOPMENT mode.              ***
    ***                               ^^^^^^^^^^^                    ***
    *** Do NOT deploy to your live server(s) without changing this.  ***
    *** See Application#getConfigurationType() for more information. ***
    ********************************************************************
5.先install core，然后是install Component,然后install admin,再然后install Enterprise,最后install 一遍所有的。
