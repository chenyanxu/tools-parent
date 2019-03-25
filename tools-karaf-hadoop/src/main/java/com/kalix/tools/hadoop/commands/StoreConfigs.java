package com.kalix.tools.hadoop.commands;


import com.kalix.tools.hadoop.api.HdfsConfigService;
import org.apache.karaf.shell.api.action.Action;
import org.apache.karaf.shell.api.action.Command;
import org.apache.karaf.shell.api.action.Completion;
import org.apache.karaf.shell.api.action.lifecycle.Reference;
import org.apache.karaf.shell.api.action.lifecycle.Service;

/**
 * Displays the last log entries
 */
@Service
@Command(scope = "kalix", name = "storeconfigs", description = "store configurations in hdfs")
public class StoreConfigs implements Action {
    @Completion(MyCompleter.class)
    String arg = null;
    @Reference
    HdfsConfigService hdfsConfigService;

    @Override
    public Object execute() throws Exception  {
        String KARAF_etc = System.getProperty("karaf.home") + "/etc";
        System.out.println("Copying files from " + KARAF_etc + " to " + HdfsConfigService.HDFS_LOCATION);
        hdfsConfigService.storeConfigs();

        return null;
    }

    public void setHdfsConfigService(HdfsConfigService hdfsConfigService) {
        this.hdfsConfigService = hdfsConfigService;
    }
}
