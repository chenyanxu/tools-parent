feature:install transaction jndi pax-jdbc-config pax-jdbc-pool-dbcp2 jdbc
bundle:install -s mvn:org.postgresql/postgresql/9.4-1202-jdbc41

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