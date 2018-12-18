package com.kalix.tools.backup;

public class RunnableService implements Runnable{

    @Override
    public void run() {
        PgBackupController backup = new PgBackupController();
//      默认的数据库kalix和密码password，目前只支持karaf和postgresql运行在同一台机器上
        backup.executeCommand("kalix", "1234", "backup");
    }
}
