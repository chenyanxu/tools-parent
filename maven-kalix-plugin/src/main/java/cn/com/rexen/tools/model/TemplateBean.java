package cn.com.rexen.tools.model;

/**
 * Created by sunlf on 2015/9/18.
 */
public class TemplateBean {
    private String pomName;
    private String beanName;
    private String packageName;

    public TemplateBean(String packageName, String beanName, String pomName) {
        this.beanName = beanName;
        this.packageName = packageName;
        this.pomName = pomName;
    }

    public String getBeanName() {
        return beanName;
    }

    public void setBeanName(String beanName) {
        this.beanName = beanName;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getPomName() {
        return pomName;
    }

    public void setPomName(String pomName) {
        this.pomName = pomName;
    }
}
