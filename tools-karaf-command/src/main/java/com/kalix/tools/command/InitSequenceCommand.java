package com.kalix.tools.command;

import org.apache.karaf.shell.api.action.Action;
import org.apache.karaf.shell.api.action.Command;
import org.apache.karaf.shell.api.action.lifecycle.Service;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;

/**
 * Created by sunlf on 2015/12/4.
 * 通过查找初始化的表的最大id设置openjpaseq表的最大id值
 */
@Command(scope = "kalix", name = "init-sequence", description = "init openjpaseq table")
@Service
public class InitSequenceCommand implements Action {
    @Override
    public Object execute() throws Exception {
        DataSource dataSource = Util.getKalixDataSource();
        Connection conn = dataSource.getConnection();
        DatabaseMetaData dbMetaData = conn.getMetaData();
        String[] types = {"TABLE"};
        ResultSet tabs = dbMetaData.getTables(null, null, null, types);
        ArrayList<String> tableNames=new ArrayList<>();
        ArrayList<String> targetTableNames=new ArrayList<>();
        ArrayList<Integer> ids=new ArrayList<>();

        //get all table name
        while (tabs.next()) {
            tableNames.add(tabs.getString("TABLE_NAME"));
        }

        tabs.close();

        ResultSet columns=null;

        //get the table that contains the 'id' column
        for (String tableName:tableNames) {
            columns = dbMetaData.getColumns(null, "%", tableName, "id");

            while (columns.next()) {
                targetTableNames.add(tableName);
            }

            columns.close();
        }

        Statement statement = conn.createStatement();
        ResultSet rs=null;
        //get the max id for each table
        for (String tableName:targetTableNames) {
            rs=statement.executeQuery("SELECT MAX(id) FROM "+tableName);
            rs.next();
            ids.add(rs.getInt(1));
            rs.close();
        }

        if (ids != null) {
            Object[] idsSort = ids.toArray();
            //sort the id list,the last one will at the end.
            Arrays.sort(idsSort);
            //update the sequence table
            // 由于空数据时update失效，先删除openjpaseq表数据，然后插入保证openjpaseq表数据正确
            statement.execute("DELETE from openjpaseq ");
            statement.execute("INSERT INTO openjpaseq values('0','" + idsSort[ids.size() - 1].toString() + "')");
            Util.outPrint("succeed to set openjpa sequence value to " + idsSort[ids.size() - 1].toString());
        }
        return null;
    }


}
