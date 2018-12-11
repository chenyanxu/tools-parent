package com.kalix.tools.command;

import org.apache.karaf.shell.api.action.Action;
import org.apache.karaf.shell.api.action.Command;
import org.apache.karaf.shell.api.action.Completion;
import org.apache.karaf.shell.api.action.lifecycle.Service;

/**
 * Created by sunlf on 2015/12/4.
 * 数据库同步权限数据
 */
@Command(scope = "kalix", name = "permit-sync", description = "sync permit sql script")
@Service
public class PermissionSyncCommand implements Action
{
    @Completion(MyCompleter.class)
    String arg = null;

    @Override
    public Object execute() throws Exception {
        try {
            PermissionSync permissionSync=new PermissionSync();
            permissionSync.init();

        } catch (Exception e) {
            System.out.println("sync permit sql script");
            e.printStackTrace();
        }

        return null;
    }
}
