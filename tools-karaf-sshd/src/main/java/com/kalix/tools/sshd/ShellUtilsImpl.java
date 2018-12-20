package com.kalix.tools.sshd;

import com.jcraft.jsch.*;
import com.kalix.framework.core.util.SystemUtil;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * ssh功能类，远程登录karaf，并发送命令
 */
public class ShellUtilsImpl implements IShellUtils {
    private ChannelExec channelExec;
    private Session session = null;
    private int timeout = 60000;

    /**
     * ssh init
     *
     * @param conf
     * @throws JSchException
     */
    private void initSsh(SshConfiguration conf) throws JSchException {
        SystemUtil.infoPrintln("try connect to  " + conf.getHost() + ",username: " + conf.getUserName() + ",password: " + conf.getPassword() + ",port: " + conf.getPort());
        JSch jSch = new JSch(); //创建JSch对象
        session = jSch.getSession(conf.getUserName(), conf.getHost(), conf.getPort());//根据用户名，主机ip和端口获取一个Session对象
        session.setPassword(conf.getPassword()); //设置密码
        Properties config = new Properties();
        config.put("StrictHostKeyChecking", "no");
        session.setConfig(config);//为Session对象设置properties
        session.setTimeout(timeout);//设置超时
        session.connect();//通过Session建立连接
    }

    /**
     * 带配置的发送命令
     *
     * @param commandList
     * @throws JSchException
     * @throws IOException
     */
    @Override
    public void sendCommand(SshConfiguration conf, List<String> commandList) throws JSchException, IOException {
        initSsh(conf);
        sendCommand(commandList);
    }

    /**
     * 发送命令
     *
     * @param commandList
     * @throws JSchException
     * @throws IOException
     */
    @Override
    public void sendCommand(List<String> commandList) throws JSchException, IOException {
        initSsh(new SshConfiguration());
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
        this.close();
    }

    /**
     * 显示服务器端的返回信息
     *
     * @param in
     * @param channel
     * @throws IOException
     */
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
                SystemUtil.infoPrintln(line);

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

    private void close() {
        session.disconnect();
    }

    /**
     * demo sshd
     *
     * @param args
     */
    public static void main(String[] args) {
        try {
            IShellUtils sshUtil = new ShellUtilsImpl();
            List<String> command = new ArrayList();
            String firstCmd = "feature:install -v jdbc";
            String secondCmd = "feature:install -v openjpa";
            command.add(firstCmd);
            command.add(secondCmd);
            sshUtil.sendCommand(command);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
