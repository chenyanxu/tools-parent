package com.kalix.tools.command;

import com.kalix.framework.core.api.web.IApplication;
import com.kalix.framework.core.util.JNDIHelper;
import com.kalix.framework.core.util.ScriptRunner;
import com.kalix.framework.core.web.manager.ApplicationManager;
import org.apache.karaf.shell.api.action.Action;
import org.apache.karaf.shell.api.action.Argument;
import org.apache.karaf.shell.api.action.Command;
import org.apache.karaf.shell.api.action.Completion;
import org.apache.karaf.shell.api.action.lifecycle.Service;

import javax.sql.DataSource;
import java.io.*;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by sunlf on 2015/12/4.
 * 根据当前的应用，动态加载初始化kalix数据库
 */
@Command(scope = "kalix", name = "init-db", description = "init kalix database")
@Service
public class InitKalixDbCommand implements Action {
    @Argument(index = 0, name = "arg", description = "The command argument", required = false, multiValued = false)
    @Completion(MyCompleter.class)
    String suffix = ".list";

    @Override
    public Object execute() throws Exception {
        init();
        return null;
    }

    private void init(){
        DataSource dataSource = Util.getKalixDataSource();
        ScriptRunner scriptRunner = new ScriptRunner(dataSource, false, false);
        List<IApplication> applicationList = ApplicationManager.getInstall().getApplicationList();
        if (applicationList != null && !applicationList.isEmpty()) {
            for (IApplication application : applicationList) {
                String listName=application.getId()+suffix;
                System.out.println("begin init "+application.getId()+" database...");
                InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream(listName);
                BufferedReader br = null;
                try {
                    br = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                String sql = null;
                try {
                    while((sql = br.readLine())!= null)
                    {
                        InputStream stream = this.getClass().getClassLoader().getResourceAsStream(sql);
                        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(stream, "UTF-8"));
                        scriptRunner.runScript(bufferedReader);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                System.out.println("finished init "+application.getId()+" database...");
            }

        }
        else {
            System.out.println("错误，未发现已经启动的应用！");
        }
    }

}
