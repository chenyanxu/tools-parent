package cn.com.rexen.tools;

import cn.com.rexen.tools.api.IGenerate;
import cn.com.rexen.tools.impl.*;
import com.thoughtworks.qdox.JavaProjectBuilder;
import org.apache.maven.plugin.MojoExecutionException;
import org.apache.maven.plugin.MojoFailureException;

import java.io.File;

/**
 * Created by sunlf on 2015/9/18.
 *
 * @goal dao
 * @phase compile
 * @threadSafe
 */
public class DaoMojo extends AbstractBaseKalixMojo {

    @Override
    public void execute() throws MojoExecutionException, MojoFailureException {
        this.docBuilder = new JavaProjectBuilder();
        for (String r : sources) {
            docBuilder.addSourceTree(new File(r));
        }
        // first, find input directory and files it contains
        if (!inputDir.exists()) {
            throw new MojoExecutionException("Input directory '" + inputDir.getAbsolutePath() + "' does not exist");
        }

        //create dao code generate
        IGenerate daoGenerate = new DaoGenerateImpl(attributes, inputDir, outputDir);
        daoGenerate.genJavaSource();

    }
}
