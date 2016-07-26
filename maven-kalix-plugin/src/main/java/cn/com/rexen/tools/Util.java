package cn.com.rexen.tools;

import org.apache.maven.plugin.MojoExecutionException;

import java.io.*;

/**
 * Created by sunlf on 2015/9/18.
 */
public class Util {
    public final static String inputSuffix = ".st";

    public final static void writeFile(File outputFile, String encoding, String contents)
            throws MojoExecutionException {
        try {
            if (!outputFile.exists()) {
                System.out.print("file is not existed!");
                File parent = outputFile.getParentFile();
                if (parent != null && !parent.exists()) {
                    parent.mkdirs();
                }
                outputFile.createNewFile();
            }
            OutputStreamWriter w = new OutputStreamWriter(new FileOutputStream(outputFile), encoding);
            w.write(contents);
            w.close();
        } catch (IOException e) {
            throw new MojoExecutionException("Failed to write output file '" + outputFile.getAbsolutePath() + "': " + e.getMessage(), e);
        }
    }

    public final static String readFile(File inputFile, String encoding) throws MojoExecutionException {
        StringBuilder sb = new StringBuilder((int) inputFile.length());
        char[] buf = new char[1000];
        int count;

        try {
            InputStreamReader in = new InputStreamReader(new FileInputStream(inputFile), encoding);
            while ((count = in.read(buf)) >= 0) {
                sb.append(buf, 0, count);
            }
            in.close();
            return sb.toString();
        } catch (IOException e) {
            throw new MojoExecutionException("Failed to read input file '" + inputFile.getAbsolutePath() + "': " + e.getMessage(), e);
        }
    }


}
