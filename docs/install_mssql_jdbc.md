###  feature install 

```
feature:install transaction jdbc
install -s mvn:com.microsoft.sqlserver/mssql-jdbc/7.4.1.jre8 
feature:install pax-jdbc-mssql
```

### maven dependency
 
```
    <dependency>    
            <groupId>com.microsoft.sqlserver</groupId>
            <artifactId>mssql-jdbc</artifactId>
            <version>7.4.1.jre8</version>
    </dependency>
```

###  datasource config file

```
osgi.jdbc.driver.class = com.microsoft.sqlserver.jdbc.SQLServerDriver (yes, we use Microsoft's driver)
osgi.jdbc.driver.name = mssql (points to the OPS4J DataSourceFactory)
url = jdbc:sqlserver://sql01.app.acme.com;databaseName=OS_ACME_APPS
user = OS_ACME_APP
password = e2JnNwT4qdÄhaföM

```

### change persistentEntity class
> mssql not support sequence

```
public abstract class PersistentEntity implements Serializable {
    @Id
//    @SequenceGenerator(name = "kalix_id_seq", sequenceName = "kalix_id_seq", initialValue = 1000000, allocationSize = 1)
//    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "kalix_id_seq")
    @GeneratedValue(strategy = GenerationType.AUTO)
//    @Column(name = "id", unique = true, nullable = false, columnDefinition = "integer DEFAULT  nextval('kalix_id_seq')")
//   @Column(name = "id", unique = true, nullable = false, columnDefinition = "serial") // 独立sequence----> serial
```