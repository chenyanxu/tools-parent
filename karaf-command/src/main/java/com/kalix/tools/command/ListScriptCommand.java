package com.kalix.tools.command;

import com.kalix.tools.command.internal.InitActivator;
import org.apache.karaf.shell.api.action.Action;
import org.apache.karaf.shell.api.action.Command;
import org.apache.karaf.shell.api.action.Completion;
import org.apache.karaf.shell.api.action.lifecycle.Service;
import org.osgi.framework.BundleContext;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Set;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

/**
 * Created by sunlf on 2015/12/4.
 * 获得当前目录下的全部script列表
 */
@Command(scope = "kalix", name = "list", description = "list current sql script")
@Service
public class ListScriptCommand implements Action
{
    @Completion(MyCompleter.class)
    String arg = null;

    @Override
    public Object execute() throws Exception {
        try {
            BundleContext context= InitActivator.getBundleContext();
            Enumeration<URL> urls=context.getBundle().findEntries("/","*.sql",false);
            while (urls.hasMoreElements()){
                System.out.println(urls.nextElement().toURI());
            }

        } catch (Exception e) {
            System.out.println("list script files error!");
            e.printStackTrace();
        }

        return null;
    }

    String[] getResourceListing(Class clazz, String path) throws URISyntaxException, IOException {
        URL dirURL = clazz.getClassLoader().getResource(path);
        if (dirURL != null && dirURL.getProtocol().equals("file")) {
        /* A file path: easy enough */
            return new File(dirURL.toURI()).list();
        }

        if (dirURL == null) {
        /*
         * In case of a jar file, we can't actually find a directory.
         * Have to assume the same jar as clazz.
         */
            String me = clazz.getName().replace(".", "/")+".class";
            dirURL = clazz.getClassLoader().getResource(me);
        }

        if (dirURL.getProtocol().equals("jar")) {
        /* A JAR path */
            String jarPath = dirURL.getPath().substring(5, dirURL.getPath().indexOf("!")); //strip out only the JAR file
            JarFile jar = new JarFile(URLDecoder.decode(jarPath, "UTF-8"));
            Enumeration<JarEntry> entries = jar.entries(); //gives ALL entries in jar
            Set<String> result = new HashSet<String>(); //avoid duplicates in case it is a subdirectory
            while(entries.hasMoreElements()) {
                String name = entries.nextElement().getName();
                if (name.startsWith(path)) { //filter according to the path
                    String entry = name.substring(path.length());
                    int checkSubdir = entry.indexOf("/");
                    if (checkSubdir >= 0) {
                        // if it is a subdirectory, we just return the directory name
                        entry = entry.substring(0, checkSubdir);
                    }
                    result.add(entry);
                }
            }
            return result.toArray(new String[result.size()]);
        }

        throw new UnsupportedOperationException("Cannot list files for URL "+dirURL);
    }


    public static void main(String[] args) throws IOException, URISyntaxException {
        ListScriptCommand n =new ListScriptCommand();
        String[] str=n.getResourceListing(ListScriptCommand.class,".");
    }

}
