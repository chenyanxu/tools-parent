package com.kalix.tools.command;

import com.kalix.framework.core.api.web.IApplication;
import com.kalix.framework.core.util.ScriptRunner;
import com.kalix.framework.core.web.manager.ApplicationManager;
import org.apache.karaf.shell.api.action.Action;
import org.apache.karaf.shell.api.action.Argument;
import org.apache.karaf.shell.api.action.Command;
import org.apache.karaf.shell.api.action.Completion;
import org.apache.karaf.shell.api.action.lifecycle.Service;
import org.osgi.framework.Bundle;
import org.osgi.framework.FrameworkUtil;
import org.osgi.framework.wiring.BundleWiring;

import javax.sql.DataSource;
import java.io.*;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by sunlf on 2015/12/4.
 * 根据当前的应用，动态加载初始化kalix数据库
 */
@Command(scope = "kalix", name = "init-db", description = "init kalix database")
@Service
public class InitKalixDbCommand implements Action {
    @Argument(index = 0, name = "arg", description = "The command argument", required = false, multiValued = false)
    @Completion(MyCompleter.class)
    String application_suffix = ".list";

    @Override
    public Object execute() throws Exception {
        init();
        return null;
    }

    private void init() {
        DataSource dataSource = Util.getKalixDataSource();
        ScriptRunner scriptRunner = new ScriptRunner(dataSource, false, true);
        //获得全部app列表
        List<IApplication> applicationList = ApplicationManager.getInstall().getApplicationList();
        if (applicationList != null && !applicationList.isEmpty()) {
            for (IApplication application : applicationList) {
                ClassLoader loader = getApplicationBundle(application.getId());
                String listName = application.getId() + application_suffix;
                Util.outPrint("begin init " + application.getId() + " database...");
                InputStream inputStream = loader.getResourceAsStream(listName);
                if (inputStream == null) {
                    Util.outPrint("There is no " + application.getId() + " database need to init...");
                    continue;
                }
                BufferedReader br = null;
                try {
                    br = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                String sql = null;
                try {
                    while ((sql = br.readLine()) != null) {
                        InputStream stream = loader.getResourceAsStream(sql);
                        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(stream, "UTF-8"));
                        scriptRunner.runScript(bufferedReader);
                    }
                } catch (IOException | SQLException e) {
                    e.printStackTrace();
                    Util.outPrint("脚本执行错误，运行中断！");
                    return;
                }
                Util.outPrint("finished init " + application.getId() + " database...");
            }
        } else {
            Util.outPrint("error,there is no a running application！");
        }
        Util.outPrint("脚本执行成功！");
    }

    /**
     * 通过类名获得相应的bundle的类加载器
     *
     * @param applicationId
     * @return
     */
    private ClassLoader getApplicationBundle(String applicationId) {
        String clsName = "com.kalix.%s.core.etc.internal.InitActivator";
        Class my = null;
        try {
            my = Class.forName(String.format(clsName, applicationId));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Bundle bundle = FrameworkUtil.getBundle(my);
        System.out.println("now we get bundle " + bundle.getLocation());
        BundleWiring w = bundle.adapt(org.osgi.framework.wiring.BundleWiring.class);
        ClassLoader loader = w.getClassLoader();
        return loader;
    }


}

