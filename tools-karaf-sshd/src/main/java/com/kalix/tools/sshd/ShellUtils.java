package com.kalix.tools.sshd;

import com.jcraft.jsch.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 *
 */
public class ShellUtils {
    private ChannelExec channelExec;
    private Session session = null;
    private int timeout = 60000;

    public ShellUtils(SshConfiguration conf) throws JSchException {
        System.out.println("try connect to  " + conf.getHost() + ",username: " + conf.getUserName() + ",password: " + conf.getPassword() + ",port: " + conf.getPort());
        JSch jSch = new JSch(); //创建JSch对象
        session = jSch.getSession(conf.getUserName(), conf.getHost(), conf.getPort());//根据用户名，主机ip和端口获取一个Session对象
        session.setPassword(conf.getPassword()); //设置密码
        Properties config = new Properties();
        config.put("StrictHostKeyChecking", "no");
        session.setConfig(config);//为Session对象设置properties
        session.setTimeout(timeout);//设置超时
        session.connect();//通过Session建立连接
    }

    public void sendCommand(List<String> commandList) throws JSchException, IOException {
        channelExec = (ChannelExec) session.openChannel("exec");
        String command = "";
        //组成以分号分隔的命令
        for (String cmd : commandList) {
            command = command + cmd + ";";
        }

        InputStream in = channelExec.getInputStream();
        channelExec.setInputStream(null);
        channelExec.setErrStream(System.err);
        channelExec.setCommand(command);
        channelExec.connect();
        getLastCmdStatus(in, channelExec);
        channelExec.disconnect();
    }


    private void getLastCmdStatus(InputStream in, ChannelExec channel) throws IOException {
        //byte[] b = new byte[10];
        while (true) {
            while (in.available() > 0) {
                byte[] tmp = new byte[1024];
                int i = in.read(tmp, 0, 1024);
	            /*
	              Number of bytes actually read is returned as an integer.
	             */
                if (i < 0) {
                    break;
                }
                String line = new String(tmp, 0, i);
                System.out.println(line);

            }
            if (channel.isClosed()) {
                break;
            }
            try {
                Thread.sleep(1000);
            } catch (Exception ee) {
                //ignore
            }
        }
    }

    public void close() {
        session.disconnect();
    }

    public static void main(String[] args) {
        SshConfiguration configuration = new SshConfiguration();
        configuration.setHost("localhost");
        configuration.setUserName("karaf");
        configuration.setPassword("karaf");
        configuration.setPort(8101);
        try {
            ShellUtils sshUtil = new ShellUtils(configuration);
            List<String> command = new ArrayList();
            String one = "feature:install -v jdbc";
            String wto = "feature:install -v openjpa";
            command.add(one);
            command.add(wto);
            sshUtil.sendCommand(command);
            sshUtil.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
