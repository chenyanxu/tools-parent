package com.kalix.tools.command;

import com.kalix.framework.core.util.ScriptRunner;
import org.apache.karaf.shell.api.action.Action;
import org.apache.karaf.shell.api.action.Argument;
import org.apache.karaf.shell.api.action.Command;
import org.apache.karaf.shell.api.action.Completion;
import org.apache.karaf.shell.api.action.lifecycle.Service;

import javax.sql.DataSource;
import java.io.*;
import java.sql.SQLException;

/**
 * Created by sunlf on 2015/12/4.
 * 根据当前的应用，加载测试数据到初始化kalix数据库
 */
@Command(scope = "kalix", name = "test-db", description = "init kalix testing database")
@Service
public class TestKalixDbCommand implements Action {
    @Argument(index = 0, name = "arg", description = "The command argument", required = false, multiValued = false)
    @Completion(MyCompleter.class)
    String listSql = "test.list";

    @Override
    public Object execute() throws Exception {
        init();
        return null;
    }

    private void init(){
        DataSource dataSource = Util.getKalixDataSource();
        ScriptRunner scriptRunner = new ScriptRunner(dataSource, false, true);
        InputStream stream = this.getClass().getClassLoader().getResourceAsStream(listSql);
        try {
            BufferedReader  br = new BufferedReader(new InputStreamReader(stream, "UTF-8"));
            String sql="";
            while((sql = br.readLine())!= null)
            {
                InputStream sqlStream = this.getClass().getClassLoader().getResourceAsStream(sql);
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(sqlStream, "UTF-8"));
                scriptRunner.runScript(bufferedReader);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
