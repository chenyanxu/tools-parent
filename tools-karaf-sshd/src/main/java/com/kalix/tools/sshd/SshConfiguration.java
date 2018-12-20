package com.kalix.tools.sshd;

/**
 *
 */
public class SshConfiguration {
    private String host;
    private int    port;
    private String userName;
    private String password;

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public SshConfiguration(String host, int port, String userName, String password) {
        this.host = host;
        this.port = port;
        this.userName = userName;
        this.password = password;
    }

    /**
     * 默认设置
     */
    public SshConfiguration(){
        this.setHost("localhost");
        this.setUserName("karaf");
        this.setPassword("karaf");
        this.setPort(8101);
    }
}
