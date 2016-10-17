package com.kalix.tools.flyway;

import org.flywaydb.core.Flyway;

import javax.sql.DataSource;

public class DbMigrationService {

    private DataSource datasource;
    private Flyway flyway;

    public void doMigration() {
        ClassLoader thisClassLoader = this.getClass().getClassLoader();
        getFlyway().setDataSource(datasource);
        getFlyway().setClassLoader(thisClassLoader);
        flyway.setBaselineOnMigrate(true);
//        flyway.setBaselineVersionAsString("0");
        getFlyway().migrate();
    }

    public DataSource getDatasource() {
        return datasource;
    }

    public void setDatasource(DataSource datasource) {
        this.datasource = datasource;
    }

    public Flyway getFlyway() {
        return flyway;
    }

    public void setFlyway(Flyway flyway) {
        this.flyway = flyway;
    }


}
