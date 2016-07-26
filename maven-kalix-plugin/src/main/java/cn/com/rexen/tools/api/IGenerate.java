package cn.com.rexen.tools.api;

import com.thoughtworks.qdox.model.JavaField;
import org.apache.maven.plugin.MojoExecutionException;

import java.util.List;
import java.util.Map;

/**
 * Created by sunlf on 2015/9/18.
 */
public interface IGenerate {
    //在genJavaSource()方法调用前执行
    void beforeGenJavaSource() throws MojoExecutionException;

    //创建java source目录
    void genJavaSource() throws MojoExecutionException;

    //创建resources目录
    void genResources();

    //获取实体类的fields
    List<JavaField> getClassFields() throws MojoExecutionException;
}
