package cn.com.rexen.tools;

/* (c) Tatu Saloranta, 2011-
 * 
 * Simple Maven plug-in for executing set of Stringtemplate
 * templates
 */

import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugin.MojoExecutionException;
import org.stringtemplate.v4.ST;
import org.stringtemplate.v4.STGroupDir;
import org.stringtemplate.v4.compiler.STException;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Beef of the plug-in; place where magic happens
 *
 * @author Tatu Saloranta (tatu.saloranta@iki.fi)
 * @threadSafe
 */
public class TemplateMojo
        extends AbstractMojo {
    /**
     * Input root directory
     *
     * @parameter expression="${stringtemplate.inputDir}"
     * @required
     */
    private File inputDir;

    /**
     * Template root directory; used for resolving template references
     * from the main input.
     * Defaults to same as <code>inputDir</code>
     *
     * @parameter
     */
    private File templateDir;

    /**
     * File suffix of input files to process, such as ".st"
     *
     * @parameter expression="${stringtemplate.inputSuffix}"  default-value=".st"
     */
    private String inputSuffix;

    /**
     * Location of the output directory to output results of template expression to
     *
     * @parameter expression="${project.build.directory}"
     * @required
     */
    private File outputDir;

    /**
     * File suffix for output files, to replace input suffix.
     * Defaults to empty String, meaning that input suffix is simply removed.
     *
     * @parameter expression="${stringtemplate.outputSuffix}"  default-value=""
     */
    private String outputSuffix;

    /**
     * Encoding that input files (including template files) use,
     * and which will also be used for encoding output);
     * default value is "UTF-8".
     *
     * @parameter expression="${stringtemplate.encoding}" default-value="UTF-8"
     */
    private String encoding;

    /**
     * Starting delimiter character for Stringtemplate expressions;
     * defaults to '$'.
     * NOTE: Stringtemplate limits delimiters to a single character, so you can NOT
     * use multi-character delimiters.
     *
     * @parameter expression="${stringtemplate.startDelimiter}"  default-value='$'
     */
    private char startDelimiter;

    /**
     * Ending (closing) delimiter character for Stringtemplate expressions;
     * defaults to '$'.
     * NOTE: Stringtemplate limits delimiters to a single character, so you can NOT
     * use multi-character delimiters.
     *
     * @parameter expression="${stringtemplate.endDelimiter}"  default-value="$"
     */
    private char endDelimiter;

    /**
     * We can also define attributes for ST to use. These are defined as
     * a Map in pom.xml
     *
     * @parameter
     */
    private Map<String, String> attributes;
    
    /*
    ///////////////////////////////////////////////////////////////////////
    // Actual processing method(s)
    ///////////////////////////////////////////////////////////////////////
     */

    private static String trim(String str) {
        if (str == null) {
            return "";
        }
        return str.trim();
    }

    /*
    ///////////////////////////////////////////////////////////////////////
    // Helpers
    ///////////////////////////////////////////////////////////////////////
     */

    private static void findFiles(Map<File, File> result, File inputDir, String inputSuffix,
                                  File outputDir, String outputSuffix) {
        for (File f : inputDir.listFiles()) {
            String name = f.getName();
            if (f.isDirectory()) {
                findFiles(result, f, inputSuffix, new File(outputDir, name), outputSuffix);
            } else if (name.endsWith(inputSuffix)) {
                name = name.substring(0, name.length() - inputSuffix.length()) + outputSuffix;
                if (!outputDir.exists()) {
                    outputDir.mkdir();
                }
                result.put(f, new File(outputDir, name));
            }
        }
    }





    /**
     * Main operation
     */
    public void execute()
            throws MojoExecutionException {
        // first, find input directory and files it contains
        if (!inputDir.exists()) {
            throw new MojoExecutionException("Input directory '" + inputDir.getAbsolutePath() + "' does not exist");
        }
        File templates = templateDir;
        if (templates == null) {
            getLog().info("No sepate 'templateDir' specified; will use 'inputDir' as template source'");
            templates = inputDir;
        }

        Map<File, File> files = new LinkedHashMap<File, File>();
        // looks like maven may change empty String to null?
        String outputSuffix = this.outputSuffix;
        findFiles(files, inputDir, trim(inputSuffix), outputDir, trim(outputSuffix));

        if (!outputDir.exists()) {
            outputDir.mkdirs();
        }
        getLog().info(String.format("Found %s template files to process: %s", files.size(), files.toString()));
        URL url;
        try {
            url = templates.toURI().toURL();
        } catch (Exception e) {
            throw new MojoExecutionException("Failed to convert template input directory '" + templates.getAbsolutePath() + "'");
        }

        STGroupDir templateDir = new STGroupDir(url, encoding, startDelimiter, endDelimiter);

        for (Map.Entry<File, File> fileEntry : files.entrySet()) {
            File inputFile = fileEntry.getKey();
            File outputFile = fileEntry.getValue();
            try {
                // let's do sanity check... ok to use same dir, but not same dir and same suffix (i.e. can't overwrite input)
                if (inputFile.getCanonicalPath().equals(outputFile.getCanonicalPath())) {
                    throw new MojoExecutionException("Problem: trying to replace input file '" + inputFile.getCanonicalPath() + "' with output; not allowed");
                }
            } catch (IOException e) {
                throw new MojoExecutionException("I/O problem: " + e.getMessage(), e);
            }
            String input = Util.readFile(inputFile, encoding);
            ST stringTemplate;

            try {
                stringTemplate = new ST(templateDir, input);
            } catch (STException e) {
                throw new MojoExecutionException("Problem when trying to process input template '"
                        + inputFile.getAbsolutePath() + "': " + e.getMessage(), e);
            }
            if (attributes != null) {
                for (Map.Entry<String, String> attrEntry : attributes.entrySet()) {
                    stringTemplate.add(attrEntry.getKey(), attrEntry.getValue());
                }
            }
            getLog().info("Read template '" + inputFile.getAbsolutePath() + "'; will process");
            String output = stringTemplate.render();
            Util.writeFile(outputFile, encoding, output);
            getLog().info("Wrote output file '" + outputFile.getAbsolutePath() + "'");
        }
    }

}
