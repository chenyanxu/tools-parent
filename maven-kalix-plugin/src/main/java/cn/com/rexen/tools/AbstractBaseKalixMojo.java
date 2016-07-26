package cn.com.rexen.tools;

import com.thoughtworks.qdox.JavaProjectBuilder;
import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.project.MavenProject;

import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * Created by sunlf on 2015/9/24.
 */
public abstract class AbstractBaseKalixMojo extends AbstractMojo{
    /**
     * @parameter expression="${project}"
     * @required
     * @readonly
     * @since 1.0
     */
    protected MavenProject project;
    /**
     * Sources
     *
     * @parameter
     * @required
     */
    protected List<String> sources;
    /**
     * @parameter default-value="target/generated-sources/kalix"
     * @required
     */
    protected File outputDir;

    JavaProjectBuilder docBuilder;
    /**
     * Input root directory
     *
     * @parameter expression="${stringtemplate.inputDir}"
     * @required
     */
    protected File inputDir;

    /**
     * We can also define attributes for ST to use. These are defined as
     * a Map in pom.xml
     *
     * @parameter
     */
    protected Map<String, String> attributes;
}
