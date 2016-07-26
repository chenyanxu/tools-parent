package cn.com.rexen.tools.impl;

import com.thoughtworks.qdox.model.DocletTag;
import com.thoughtworks.qdox.model.JavaField;
import com.thoughtworks.qdox.model.JavaType;
import org.apache.maven.plugin.MojoExecutionException;

import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * Created by sunlf on 2015/9/18.
 * 实体代码生成实现类
 */
public class EntitiesGenerateImpl extends AbstractGenernateImpl {

    //需要替换名字的java类名
    String beanFileName = "%sBean.java";
    String xmlFileName = "persistence.xml";
    String activatorFileName = "InitActivator.java";

    public EntitiesGenerateImpl(Map<String, String> attributes, File inputDir, File outputDir) {
        super(attributes, inputDir, outputDir, "entities");
        fileMap.put("Bean", "//" + moduleName + "//" + String.format(beanFileName, beanName));
        fileMap.put("InitActivator", "//" + moduleName + "//internal//" + activatorFileName);
        fileMap.put("persistence.xml", "//META-INF//" + xmlFileName);
    }

    @Override
    public void genResources() {

    }

    @Override
    public void setAttributes(Map<String, String> attributes){this.attributes = attributes;}

    @Override
    public void beforeGenJavaSource() throws MojoExecutionException{
        String result = getSetCreate();
        attributes.put("classBody",result);
    }

    private String getSetCreate() throws MojoExecutionException {
        StringBuffer resultBuffer = new StringBuffer("");
        List<JavaField> fields = getClassFields();
        String fieldName;
        JavaType fieldType;//获取字段类型
        DocletTag fieldTag;//describe
        for (JavaField field : fields){
            fieldName = field.getName();
            fieldType = field.getType();
            fieldTag = field.getTagByName("describe"); // @describe


            resultBuffer.append("\t/**\r\n\t*@describe " + fieldTag.getValue() + "\r\n\t*/\r\n");
            if (fieldType.getValue().equals("Date")) {
                resultBuffer.append("@JsonFormat(pattern = \"yyyy-MM-dd HH:mm:ss\",timezone =\"GMT+8\")\r\n");
            }
            resultBuffer.append("\tprivate " + fieldType.getValue() + " " + fieldName + ";\r\n");
        }
        for (JavaField field : fields) {
            fieldName = field.getName();
            fieldType = field.getType();
            //getter
            if (fieldType.getValue().equals("boolean")) {
                resultBuffer.append("\tpublic " + fieldType.getValue() + " is" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1));
            } else {
                resultBuffer.append("\tpublic " + fieldType.getValue() + " get" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1));
            }
            resultBuffer.append("(){\r\n");
            resultBuffer.append("\t\treturn this." + fieldName + ";\r\n");
            resultBuffer.append("\t}\r\n\r\n");

            //setter
            resultBuffer.append("\tpublic void set" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1));
            resultBuffer.append("(" + fieldType.getValue() + " " + fieldName + ") {\r\n");
            resultBuffer.append("\t\tthis." + fieldName + " = " + fieldName + ";\r\n");
            resultBuffer.append("\t}\r\n\r\n");
        }
        return resultBuffer.toString();
    }
}
