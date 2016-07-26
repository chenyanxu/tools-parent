package cn.com.rexen.tools.impl;

import java.io.File;
import java.util.Map;

/**
 * Created by sunlf on 2015/9/18.
 * Dao代码生成实现类
 */
public class DaoGenerateImpl extends AbstractGenernateImpl {

    //需要替换名字的java类名
    String beanFileName = "%sBeanDaoImpl.java";
    String xmlFileName = "blueprint.xml";
    String activatorFileName = "InitActivator.java";

    public DaoGenerateImpl(Map<String, String> attributes, File inputDir, File outputDir) {
        super(attributes, inputDir, outputDir, "dao");
        fileMap.put("BeanDaoImpl",  "//" + moduleName +"//"+String.format(beanFileName, beanName));
        fileMap.put("InitActivator", "//" + moduleName + "//internal//" + activatorFileName);
        fileMap.put("blueprint.xml", "//OSGI-INF//blueprint//" + xmlFileName);
    }

    @Override
    public void genResources() {

    }

    @Override
    public void beforeGenJavaSource(){

    }
}
