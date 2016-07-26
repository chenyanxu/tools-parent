package cn.com.rexen.tools.impl;

import java.io.File;
import java.util.Map;

/**
 * Created by sunlf on 2015/9/18.
 * rest服务代码生成实现类
 */
public class RestGenerateImpl extends AbstractGenernateImpl {

    //需要替换名字的java类名
    String xmlFileName = "%s-rest.xml";
    String activatorFileName = "InitActivator.java";

    public RestGenerateImpl(Map<String, String> attributes, File inputDir, File outputDir) {
        super(attributes, inputDir, outputDir, "rest");
        fileMap.put("InitActivator", "//" + moduleName + "//internal//" + activatorFileName);
        fileMap.put("rest.xml", "//OSGI-INF//blueprint//" + String.format(xmlFileName, pomName));
    }

    @Override
    public void genResources() {

    }

    @Override
    public void beforeGenJavaSource(){

    }
}
