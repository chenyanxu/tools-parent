BRANDING SHELL EXAMPLE
======================

Purpose
-------
Demonstrate how to change the shell console branding.


Prerequisites for Running this Example
--------------------------------------
You must have the following installed on your machine:

   - JDK 1.6 or higher.

   - Apache Maven 3.0.3 or higher.


Building and Deploying
----------------------
This example will produce a branding jar, containing a branding properties
file which is used to generate the shell console branding.

To build the demo branding type the following command:

  mvn install

To deploy the branding copy the resulting jar file to karaf/lib folder.

  cp target/org.apache.karaf.demos.branding.shell-${version}.jar $KARAF_HOME/lib

In order for Karaf to pick up the branding jar please edit the
$KARAF_HOME/etc/custom.properties file to include the following:

  org.osgi.framework.system.packages.extra = \
    org.apache.karaf.branding; \
    com.sun.org.apache.xalan.internal.xsltc.trax; \
    com.sun.org.apache.xerces.internal.dom; \
    com.sun.org.apache.xerces.internal.jaxp; \
    com.sun.org.apache.xerces.internal.xni

To see the new branding please restart Karaf:

  cd $KARAF_HOME/bin
  ./karaf

The shell console should now display the content of the branding
properties file.

NOTES
=====
Most projects automate this process. One such project is Apache Servicemix
NMR, see its branding and assembly poms for a guide line.