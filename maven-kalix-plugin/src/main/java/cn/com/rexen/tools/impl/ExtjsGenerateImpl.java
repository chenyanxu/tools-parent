package cn.com.rexen.tools.impl;

import com.thoughtworks.qdox.model.DocletTag;
import com.thoughtworks.qdox.model.JavaField;
import org.apache.maven.plugin.MojoExecutionException;

import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * Created by sunlf on 2015/9/18.
 * 前台extjs代码生成实现类
 */
public class ExtjsGenerateImpl extends AbstractGenernateImpl {

    //需要替换名字的java类名
    String activatorFileName = "InitActivator.java";

    //需要替换名字的js文件名
//    String searchFormControllerFileName = "%sSearchFormController.js";
//    String formControllerFileName = "%sFormController.js";
    String gridControllerFileName = "%sGridController.js";

    String modelFileName = "%sModel.js";
    String storeFileName = "%sStore.js";
    String viewModelFileName = "%sViewModel.js";

    String mainFileName = "Main.js";
    String windowFileName = "%sWindow.js";
    String viewWindowFileName = "%sViewWindow.js";
    String searchFormFileName = "%sSearchForm.js";
    String gridFileName = "%sGrid.js";

    String addFileName = "%s_add.png";
    String deleteFileName = "%s_delete.png";
    String editFileName = "%s_edit.png";
    String viewFileName = "%s_view.png";

    public ExtjsGenerateImpl(Map<String, String> attributes, File inputDir, File outputDir) {
        super(attributes, inputDir, outputDir, "extjs");
        fileMap.put("InitActivator", "//" + moduleName + "//internal//" + activatorFileName);
        //js process
//        fileMap.put("SearchFormController", "//controller//" + String.format(searchFormControllerFileName, beanName));
//        fileMap.put("FormController", "//controller//" + String.format(formControllerFileName,beanName));
        fileMap.put("GridController", "//controller//" + String.format(gridControllerFileName, beanName));

        fileMap.put("Model", "//model//" + String.format(modelFileName, beanName));
        fileMap.put("Store", "//store//" + String.format(storeFileName, beanName));
        fileMap.put("ViewModel", "//viewModel//" + String.format(viewModelFileName, beanName));

        fileMap.put("Main", "//" + mainFileName);
        fileMap.put("Window", "//view//" + String.format(windowFileName, beanName));
        fileMap.put("ViewWindow", "//view//" + String.format(viewWindowFileName, beanName));
        fileMap.put("SearchForm", "//view//" + String.format(searchFormFileName, beanName));
        fileMap.put("Grid", "//view//" + String.format(gridFileName, beanName));

        // 图片资源
        fileMap.put("_add", "//images//" + String.format(addFileName, pomName));
        fileMap.put("_delete", "//images//" + String.format(deleteFileName, pomName));
        fileMap.put("_edit", "//images//" + String.format(editFileName, pomName));
        fileMap.put("_view", "//images//" + String.format(viewFileName, pomName));
    }

    @Override
    public void genResources() {

    }

    @Override
    public void setAttributes(Map<String, String> attributes) {
        this.attributes = attributes;
    }


    @Override
    public void beforeGenJavaSource() throws MojoExecutionException {
        String result = getModelFields();
        attributes.put("ModelFields", result);
        result = getValidators();
        attributes.put("Validators", result);
        result = getGridItems();
        attributes.put("GridItems", result);
        result = getSearchFormItems();
        attributes.put("SearchFormItems", result);
        result = getViewWindowItems();
        attributes.put("ViewWindowItems", result);
        result = getWindowItems();
        attributes.put("WindowItems", result);
    }

    private String getModelFields() throws MojoExecutionException {
        StringBuffer resultBuffer = new StringBuffer("");
        List<JavaField> fields = getClassFields();
        String fieldName;
        String fieldType;//获取字段类型
        for (JavaField field : fields) {
            fieldName = field.getName();
            fieldType = field.getType().getValue();

            resultBuffer.append("\t{\r\n");
            resultBuffer.append("\tname: '" + fieldName + "',\r\n");
            if (fieldType.equals("String")) {
                resultBuffer.append("\ttype: 'string'\r\n");
            } else if (fieldType.equals("Date")) {
                resultBuffer.append("\ttype: 'date',\r\n");
                resultBuffer.append("\tdateFormat: 'Y-m-d H:i:s'");
            } else if (fieldType.equals("List")) {
                resultBuffer.append("\ttype: 'list'\r\n");
            } else if (fieldType.equals("Integer") || fieldType.equals("int")) {
                resultBuffer.append("\ttype: 'int',\r\n");
                resultBuffer.append("\tdefaultValue: 0\r\n");
            } else if (fieldType.equals("Boolean") || fieldType.equals("boolean")) {
                resultBuffer.append("\ttype: 'boolean'\r\n");
            } else {
                resultBuffer.delete(resultBuffer.length() - 3, resultBuffer.length());
            }

            resultBuffer.append("\t},");
        }
        resultBuffer.delete(resultBuffer.length() - 1, resultBuffer.length());
        return resultBuffer.toString();
    }

    private String getValidators() throws MojoExecutionException {
        StringBuffer resultBuffer = new StringBuffer("\tvalidators: {\r\n");
        List<JavaField> fields = getClassFields();
        String fieldName;
        DocletTag fieldTag, fieldValidatorTag;//@describe,@validator
        for (JavaField field : fields) {
            fieldName = field.getName();
            fieldTag = field.getTagByName("describe"); // @describe
            fieldValidatorTag = field.getTagByName("validator"); // @validator
            if (fieldValidatorTag != null) {
                resultBuffer.append("\t\t" + fieldName);
                resultBuffer.append(":[{\r\n");
                resultBuffer.append("\t\t\ttype: '" + "presence" + "',\r\n");
                resultBuffer.append("\t\t\tmessage: '" + fieldTag.getValue() + fieldValidatorTag.getValue() + "'\r\n");
                resultBuffer.append("\t\t}],\r\n");
            }
        }
        resultBuffer.delete(resultBuffer.length() - 3, resultBuffer.length());
        resultBuffer.append("\r\n\t}");
        return resultBuffer.toString();
    }

    private String getGridItems() throws MojoExecutionException {
        StringBuffer resultBuffer = new StringBuffer("");
        List<JavaField> fields = getClassFields();
        String fieldName;
        DocletTag fieldTag, fieldValidatorTag;//@describe,@validator
        for (JavaField field : fields) {
            fieldName = field.getName();
            fieldTag = field.getTagByName("describe"); // @describe
            resultBuffer.append("\t{\r\n");
            resultBuffer.append("\t\ttext: '" + fieldTag.getValue() + "',\r\n");
            resultBuffer.append("\t\tdataIndex: '" + fieldName + "'");
            if (field.getType().getValue().equals("Date")) {
                resultBuffer.append(",\r\n");
                resultBuffer.append("\t\txtype: 'datecolumn',\r\n");
                resultBuffer.append("\t\tformat: 'Y-m-d',");
                resultBuffer.append("\t\trenderer:null");
            }
            resultBuffer.append("\r\n\t},\r\n");
        }
        return resultBuffer.toString();
    }

    private String getSearchFormItems() throws MojoExecutionException {
        StringBuffer resultBuffer = new StringBuffer("");
        List<JavaField> fields = getClassFields();
        String fieldName;
        DocletTag fieldTag;//@describe
        for (JavaField field : fields) {
            fieldName = field.getName();
            fieldTag = field.getTagByName("describe"); // @describe
            if (field.getType().getValue().equals("Date")) {
                resultBuffer.append("\t{\r\n");
                resultBuffer.append("\t\txtype: 'datefield',\r\n");
                resultBuffer.append("\t\tformat: 'Y-m-d',\r\n");
                resultBuffer.append("\t\tfieldLabel: '" + fieldTag.getValue() + ":',\r\n");
                resultBuffer.append("\t\tlabelAlign: 'right',\r\n");
                resultBuffer.append("\t\tlabelWidth: 120,\r\n");
                resultBuffer.append("\t\twidth: 260,\r\n");
                resultBuffer.append("\t\tname: '" + fieldName + ":begin:gt'\r\n");
                resultBuffer.append("\t},\r\n");

                resultBuffer.append("\t{\r\n");
                resultBuffer.append("\t\txtype: 'displayfield',\r\n");
                resultBuffer.append("\t\thideLabel: true,\r\n");
                resultBuffer.append("\t\tvalue: '-',\r\n");
                resultBuffer.append("\t\tmargin:'0 5 0 5'\r\n");
                resultBuffer.append("\t},\r\n");

                resultBuffer.append("\t{\r\n");
                resultBuffer.append("\t\txtype: 'datefield',\r\n");
                resultBuffer.append("\t\tformat: 'Y-m-d',\r\n");
                resultBuffer.append("\t\theadLabel: true,\r\n");
                resultBuffer.append("\t\tlabelAlign: 'right',\r\n");
                resultBuffer.append("\t\twidth: 140,\r\n");
                resultBuffer.append("\t\tname: '" + fieldName + ":end:lt'\r\n");
                resultBuffer.append("\t},\r\n");
            } else if (field.getType().getValue().equals("int") || field.getType().getValue().equals("Integer")) {
                resultBuffer.append("\t{\r\n");
                resultBuffer.append("\t\txtype: 'numberfield',\r\n");
                //resultBuffer.append("\t\tvalue: '0',\r\n");
                resultBuffer.append("\t\tfieldLabel: '" + fieldTag.getValue() + "',\r\n");
                resultBuffer.append("\t\tlabelAlign: 'right',\r\n");
                resultBuffer.append("\t\tlabelWidth: 60,\r\n");
                resultBuffer.append("\t\twidth: 200,\r\n");
                resultBuffer.append("\t\tname: '" + fieldName + "'\r\n");
                resultBuffer.append("\t},\r\n");
            } else {
                resultBuffer.append("\t{\r\n");
                resultBuffer.append("\t\txtype: '" + "textfield" + "',\r\n");
                resultBuffer.append("\t\tfieldLabel: '" + fieldTag.getValue() + "',\r\n");
                resultBuffer.append("\t\tlabelAlign: 'right',\r\n");
                resultBuffer.append("\t\tlabelWidth: 60,\r\n");
                resultBuffer.append("\t\twidth: 200,\r\n");
                resultBuffer.append("\t\tname: '" + fieldName + "'\r\n");
                resultBuffer.append("\t},\r\n");
            }

        }

        resultBuffer.delete(resultBuffer.length() - 3, resultBuffer.length());
        return resultBuffer.toString();
    }

    private String getViewWindowItems() throws MojoExecutionException {
        StringBuffer resultBuffer = new StringBuffer("");
        List<JavaField> fields = getClassFields();
        String fieldName;
        DocletTag fieldTag;//@describe
        for (JavaField field : fields) {
            resultBuffer.append("\t{\n");
            fieldName = field.getName();
            fieldTag = field.getTagByName("describe"); // @describe
            resultBuffer.append("\t\tfieldLabel: '" + fieldTag.getValue() + "',\r\n");
            resultBuffer.append("\t\tallowBlank: false,\r\n");
            if (field.getType().getValue().equals("Date")) {
                resultBuffer.append("\t\txtype: 'datefield',\r\n");
                resultBuffer.append("\t\tformat: 'Y-m-d',\r\n");
            }
            if (field.getType().getValue().equals("int") || field.getType().getValue().equals("Integer")) {
                resultBuffer.append("\t\txtype: 'numberfield',\r\n");
            }
            resultBuffer.append("\t\tbind: {\r\n");
            resultBuffer.append("\t\t\tvalue: '{rec." + fieldName + "}'\r\n");
            resultBuffer.append("\t\t}\r\n\t},\r\n");
        }
        resultBuffer.delete(resultBuffer.length() - 3, resultBuffer.length());
        return resultBuffer.toString();
    }

    private String getWindowItems() throws MojoExecutionException {
        return getViewWindowItems();
    }
}
