# postgresql and elasticsearch integration
## install zombodb to postgresql
> zombodb can only installed in linux version of postgresql

```
//在数据库中创建ZomboDB扩展：  
CREATE EXTENSION zombodb;  
//创建对应函数，指定为中文分词和分词类型：  
SELECT zdb.define_analyzer('kalix_analyzer', '{"tokenizer": "ik_max_word"}');  
//将函数指定为表的数据类型：  
CREATE DOMAIN kalix_analyzer AS text;

```
## install ik to elasticsearch
## create entity bean
```
@Entity
@Table(name = "trying_news")
public class NewsBean extends PersistentEntity {
    @Column(name = "content", columnDefinition = "kalix_analyzer")
    @Lob
    private String content; //内容
}
```
## change following files 
### persistence-jpa.xml

```
<?xml version="1.0" encoding="UTF-8"?>
<persistence xmlns="http://java.sun.com/xml/ns/persistence" version="1.0">
    <persistence-unit transaction-type="JTA" name="news-cm">
        <provider>org.apache.openjpa.persistence.PersistenceProviderImpl</provider>
        <jta-data-source>osgi:service/javax.sql.DataSource/(osgi.jndi.service.name=jdbc/ds)
        </jta-data-source>
        <class>com.kalix.framework.core.api.persistence.PersistentEntity</class>

        <properties>
            <property name="openjpa.BrokerImpl" value="non-finalizing"/>
            <property name="openjpa.Sequence" value="table(Table=OPENJPASEQ, Increment=100)"/>
            <property name="openjpa.jdbc.UpdateManager"
                      value="org.apache.openjpa.jdbc.kernel.BatchingConstraintUpdateManager"/>
            <!-- These properties are creating the database on the fly. We are using them to avoid users having
            to create a database to run the sample. This is not something that should be used in production.
            See also the create=true line in the ariestrader-derby-ds blueprint meta data -->
            <property name="javax.persistence.schema-generation.database.action"
                      value="drop-and-create" />
            <!--<property name="javax.persistence.schema-generation.create-database-schemas"-->
                    <!--value="true" />-->
            <property name="javax.persistence.schema-generation.create-source"
                      value="metadata-then-script"/>
            <property name="javax.persistence.schema-generation.create-script-source"
                      value="META-INF/sql/create.sql" />
            <property name="javax.persistence.schema-generation.drop-source"
                      value="script" />
            <property name="javax.persistence.schema-generation.drop-script-source"
                      value="META-INF/sql/drop.sql" />
            <property name="javax.persistence.sql-load-script-source" value="META-INF/sql/data.sql" />
            <property name="openjpa.jdbc.SynchronizeMappings" value="buildSchema"/>
            <property name="openjpa.Log" value="SQL=Info"/>
            <property name="openjpa.ConnectionFactoryProperties" value="PrintParameters=true"/>
            <property name="openjpa.RuntimeUnenhancedClasses" value="supported"/>
        </properties>
    </persistence-unit>
</persistence>
```
### create.sql
```
CREATE INDEX idx_trying_news ON trying_news USING zombodb ((trying_news.*)) WITH (url='http://106.12.199.69:9200/');
```

## drop.sql
```
DROP INDEX IF EXISTS  idx_trying_news;
```

## full test search example
### NewsBeanServiceImpl
```
    @Override
    public void full_text(String str) {
        String str="SELECT * FROM trying_news WHERE trying_news ==> 'content:" + str + "'";
        List<NewsBean> beans=dao.findByNativeSql(str,NewsBean.class);
        System.out.println(beans);
    }
```