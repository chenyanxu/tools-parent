package com.kalix.tools.command;

import org.apache.karaf.shell.api.action.Action;
import org.apache.karaf.shell.api.action.Command;
import org.apache.karaf.shell.api.action.Completion;
import org.apache.karaf.shell.api.action.lifecycle.Service;

/**
 * Created by sunlf on 2015/12/4.
 * 初始化数据库权限数据
 */
@Command(scope = "kalix", name = "permit", description = "init permit sql script")
@Service
public class PermissionScriptCommand implements Action
{
    @Completion(MyCompleter.class)
    String arg = null;

    @Override
    public Object execute() throws Exception {
        try {
            PermissionInit permissionInit=new PermissionInit();
            permissionInit.init();

        } catch (Exception e) {
            System.out.println("init permit sql script");
            e.printStackTrace();
        }

        return null;
    }
}
