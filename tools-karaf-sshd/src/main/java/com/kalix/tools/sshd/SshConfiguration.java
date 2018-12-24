package com.kalix.tools.sshd;

import org.osgi.service.component.ComponentContext;
import org.osgi.service.component.annotations.Activate;
import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Deactivate;

import java.util.Dictionary;

/**
 *
 */
@Component(
        name = "com.kalix.tools.sshd.sshconfiguration",
        immediate = true
)
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
     * 该方法会自动被容器调用
     * @param context
     */
    @Activate
    public void activate(ComponentContext context) {
        open(context.getProperties());
    }

    @Deactivate
    public void deactivate() {

    }

    public void open(Dictionary<String, Object> config) {
        this.setHost(getValue(config, "host","localhost"));
        this.setUserName(getValue(config, "username","karaf"));
        this.setPassword(getValue(config, "password","karaf"));
        this.setPort(Integer.parseInt((getValue(config, "port","8101"))));
    }

    private String getValue(Dictionary<String, Object> config, String key, String defaultValue) {
        String value = (String)config.get(key);
        return (value != null) ? value :  defaultValue;
    }
    /**
     * 默认设置
     */
    public SshConfiguration(){
//        this.setHost("localhost");
//        this.setUserName("karaf");
//        this.setPassword("karaf");
//        this.setPort(8101);
    }
}
