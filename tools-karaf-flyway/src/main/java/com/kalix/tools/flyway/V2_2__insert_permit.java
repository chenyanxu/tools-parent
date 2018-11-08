package com.kalix.tools.flyway;

import org.flywaydb.core.api.migration.jdbc.JdbcMigration;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Created by admin on 2016/11/4.
 */
public class V2_2__insert_permit implements JdbcMigration {
    public void migrate(Connection connection) throws Exception {
        PreparedStatement statement = connection.prepareStatement("insert into PERSON (ID, NAME) values ('9', 'Ms. Bar 123');");
        try {
            statement.execute();
        } finally {
            statement.close();
        }
    }
}