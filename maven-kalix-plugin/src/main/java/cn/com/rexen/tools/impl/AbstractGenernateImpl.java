package cn.com.rexen.tools.impl;

import cn.com.rexen.core.util.Assert;
import cn.com.rexen.tools.Util;
import cn.com.rexen.tools.api.IGenerate;
import com.thoughtworks.qdox.JavaProjectBuilder;
import com.thoughtworks.qdox.model.DocletTag;
import com.thoughtworks.qdox.model.JavaClass;
import com.thoughtworks.qdox.model.JavaField;
import com.thoughtworks.qdox.model.JavaType;
import org.apache.maven.plugin.MojoExecutionException;
import org.stringtemplate.v4.ST;
import org.stringtemplate.v4.compiler.STException;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by sunlf on 2015/9/18.
 */
public abstract class AbstractGenernateImpl implements IGenerate {
    public final static String encoding = "UTF-8";
    public final static String JAVA_SOURCE_PATH = "\\src\\main\\java\\";
    public final static String RESOURCES_SOURCE_PATH = "src\\main\\resources";
    public final static String JS_SOURCE_PATH = "src\\main\\";
    //处理java类的map
    public Map<String, String> fileMap = new HashMap<>();
    //包名称
    protected String packageName;
    //bean名称，要求首字母大写
    protected String beanName;
    //bean小写名称
    protected String pomName;
    //项目名称
    protected String projectName;
    //父模块名称
    protected String parentName;
    //目标版本名称
    protected String versionName;

    protected String parentPackageName;

    protected Map<File, File> files;
    protected File inputDir, outputDir;
    //由超类实例化，分别为api，entities等
    protected String moduleName;
    //模块中文名称
    protected String module_Name;
    //extjs类前缀
    protected String extjsPrefix;

    protected String beanDir;

    // 配置权限
    protected String permission_app;
    protected String permission_module;
    protected String permission_menu;

    // 配置菜单
    protected String module_id;
    protected String menu_id;
    protected String menu_text;
    protected String menu_index;
    protected String menu_icon_class;
    protected String menu_route_id;

    protected Map<String, String> attributes;

    public AbstractGenernateImpl(Map<String, String> attributes, File inputDir, File outputDir, String moduleName) {
        this.attributes = attributes;
        this.inputDir = inputDir;
        beanName = attributes.get("beanName");
        Assert.notNull(beanName);
        packageName = attributes.get("packageName");
        Assert.notNull(packageName);
        pomName = attributes.get("pomName");
        Assert.notNull(pomName);
        projectName = attributes.get("projectName");
        Assert.notNull(projectName);
        parentName = attributes.get("parentName");
        Assert.notNull(parentName);
        versionName = attributes.get("versionName");
        Assert.notNull(versionName);
        parentPackageName = attributes.get("parentPackageName");
        Assert.notNull(parentPackageName);
        module_Name = attributes.get("module_Name");
        Assert.notNull(module_Name);
        extjsPrefix = attributes.get("extjsPrefix");
        Assert.notNull(extjsPrefix);
        beanDir = attributes.get("beanDir");
        Assert.notNull(beanDir);

        permission_app = attributes.get("permission_app");
        Assert.notNull(permission_app);
        permission_module = attributes.get("permission_module");
        Assert.notNull(permission_module);
        permission_menu = attributes.get("permission_menu");
        Assert.notNull(permission_menu);


        module_id = attributes.get("module_id");
        Assert.notNull(module_id);

        menu_id = attributes.get("menu_id");
        Assert.notNull(menu_id);

        menu_text = attributes.get("menu_text");
        Assert.notNull(menu_text);

        menu_index = attributes.get("menu_index");
        Assert.notNull(menu_index);

        menu_icon_class = attributes.get("menu_icon_class");
        Assert.notNull(menu_icon_class);

        menu_route_id = attributes.get("menu_route_id");
        Assert.notNull(menu_route_id);

        File target = new File(outputDir.getAbsolutePath() + "\\" + pomName + "-" + moduleName);
        if (!target.exists())
            target.mkdirs();
        this.outputDir = target;
        this.moduleName = moduleName;


    }

    @Override
    public void genJavaSource() throws MojoExecutionException {
        beforeGenJavaSource();
        //处理api模板
        Map<File, File> apiFiles = new LinkedHashMap<File, File>();
        // looks like maven may change empty String to null?
        Assert.notNull(moduleName);
        findFiles(apiFiles, new File(inputDir.getAbsolutePath() + "//" + moduleName), outputDir);
        for (Map.Entry<File, File> fileEntry : apiFiles.entrySet()) {
            File inputFile = fileEntry.getKey();
            File outputFile = fileEntry.getValue();
            String input = Util.readFile(inputFile, encoding);
            ST stringTemplate;
            if(outputFile.getName().contains(".png")){
                //png文件拷贝

                continue;
            }
            try {
                stringTemplate = new ST(input);
                if (attributes != null) {
                    for (Map.Entry<String, String> attrEntry : attributes.entrySet()) {
                        stringTemplate.add(attrEntry.getKey(), attrEntry.getValue());
                    }
                }
                String output = stringTemplate.render();
                Util.writeFile(outputFile, encoding, output);
            } catch (STException e) {
                throw new MojoExecutionException("Problem when trying to process input template '"
                        + inputFile.getAbsolutePath() + "': " + e.getMessage(), e);
            }
        }
    }



    //递归确定模板文件以及对应的目标目录文件
    private void findFiles(Map<File, File> result, File inputDir,
                             File outputDir) {
        CharSequence javaChar = "java";
        CharSequence resourceChar = "xml";
        CharSequence imageChar = "png";
        CharSequence jsChar = "js";
        for (File f : inputDir.listFiles()) {
            String name = f.getName();
            if (f.isDirectory()) {
                findFiles(result, f, new File(outputDir, name));
            } else {
                name = name.substring(0, name.length() - Util.inputSuffix.length());
                String fileName = fileMap.get(name);
                //判断是否为java文件
                if (fileName != null) {
                    //处理java类型的文件
                    if (fileName.contains(javaChar)) {
                        File pd = new File(this.outputDir, JAVA_SOURCE_PATH + packageName.replaceAll("\\.", "/"));
                        File javaFile = new File(pd, fileName);
                        result.put(f, javaFile);
                    }
                    //处理资源类型的文件
                    else if (fileName.contains(resourceChar)) {
                        File pd = new File(this.outputDir, RESOURCES_SOURCE_PATH);
                        File resourceFile = new File(pd, fileName);
                        result.put(f, resourceFile);
                    }
                    //处理图片文件
                    else if(fileName.contains(imageChar)){
                        File pd = new File(this.outputDir, RESOURCES_SOURCE_PATH);
                        File resourceFile = new File(pd, fileName);
                        result.put(f, resourceFile);
                    }
                    //处理资源类型的文件
                    else if (fileName.contains(jsChar)) {
                        //js输出路径
                        File pd = new File(this.outputDir, JS_SOURCE_PATH + "webapp\\" + projectName.toLowerCase() + "\\" + pomName);
                        File jsFile = new File(pd, fileName);
                        result.put(f, jsFile);
                    }

                } else {
                    if (!outputDir.exists()) {
                        outputDir.mkdirs();
                    }
                    result.put(f, new File(outputDir, name));
                }

            }
        }
    }

    public Map<String, String> getAttributes() {
        return attributes;
    }

    public void setAttributes(Map<String, String> attributes) {
        this.attributes = attributes;
    }

    // 获取实体类信息
    public List<JavaField> getClassFields() throws MojoExecutionException {
        List<com.thoughtworks.qdox.model.JavaField> fields = null;
        JavaProjectBuilder builder = new JavaProjectBuilder();
        try {
            builder.addSource(new FileReader(beanDir + "\\"+ packageName.replaceAll("\\.", "/") + "/" + beanName + "Bean.java"));
            JavaClass cls = builder.getClassByName(packageName + "." + beanName + "Bean");
            fields = cls.getFields();//获取所有字段
        } catch (FileNotFoundException e) {
            throw new MojoExecutionException("Problem when trying to process beanName'"
                    + "': " + e.getMessage(), e);
        }
        return fields;
    }
}
