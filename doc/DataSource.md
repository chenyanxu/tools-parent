feature:install transaction jndi pax-jdbc-config pax-jdbc-pool-dbcp2 jdbc
bundle:install -s mvn:org.postgresql/postgresql/42.2.5

config:edit org.ops4j.datasource-TestDS
config:property-set osgi.jdbc.driver.class org.postgresql.Driver
config:property-set pool dbcp2
config:property-set xa true
config:property-set serverName localhost
config:property-set databaseName test
config:property-set portNumber 5432
config:property-set user test
config:property-set password test
config:property-set dataSourceName TestDS
config:property-set jdbc.pool.maxTotal 16
config:update

### use c3p0 connection pool
```
feature:install pax-jdbc-pool-c3p0
```

```
osgi.jdbc.driver.name=PostgreSQL JDBC Driver
serverName=${openshift.postgresql.svcname}
databaseName=kalix
portNumber=5432
user=postgres
password=1234
dataSourceName=jdbc/ds
pool=c3p0
xa=false

c3p0.minPoolSize=5
c3p0.maxPoolSize=30
c3p0.initialPoolSize=10
c3p0.maxIdleTime=60

```