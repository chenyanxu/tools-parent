
```
feature:install transaction jdbc
install -s mvn:com.microsoft.sqlserver/mssql-jdbc/7.4.1.jre8
feature:install pax-jdbc-mssql
```

datasource config file

```
osgi.jdbc.driver.class = com.microsoft.sqlserver.jdbc.SQLServerDriver (yes, we use Microsoft's driver)
osgi.jdbc.driver.name = mssql (points to the OPS4J DataSourceFactory)
url = jdbc:sqlserver://sql01.app.acme.com;databaseName=OS_ACME_APPS
user = OS_ACME_APP
password = e2JnNwT4qdÄhaföM

```