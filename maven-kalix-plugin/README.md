Wouldn't it be nice to combine simplicity and power of stringtemplate
(http://www.stringtemplate.org/) with convenience and power of Maven
build tool? I think so -- yet could not find such combination.
But this small project aims to fix this deficiency.

# Usage

Required information for running is to know:

* groupId: com.fasterxml
* artifactId: maven-stringtemplate-plugin

and goal, which is usually 'process'.

Given this, you would add something like this in your Maven pom.xml:

    <plugin>
      <groupId>com.fasterxml</groupId>
      <artifactId>maven-stringtemplate-plugin</artifactId>
      <version>{LATEST YOU CAN FIND}</version>
      <configuration>
          <inputDir>src/templates</inputDir>
      </configuration>
    </plugin>

# Current status

Plug-in works as is. If you want more features, go ahead, fork and when you are done send a pull request.

# Configuration

Following properties can be configured (note that these are properties
to add in pom.xml, within <configuration> -- equivalent system properties
use "stringtemplate." prefix)

## Input settings

* inputDir (no default): Defines input directory (relative to project base directory) -- all files (with suitable suffix) will be processed, recursively
* inputSuffix (defaults to ".st"): Suffix of input files to process; only files that end with the suffix are processed
* encoding (defaults to "UTF-8"): Character encoding of input files; also used for (re)encoding results
* templateDir (defaults to value set for 'inputDir'): Defines directory (relative to project base) that contains templates included by input files (if any). Note that Stringtemplate requires suffix of '.st' for included templates.

## Output settings

* outputDir (defaults to '${project.build.directory}'): Directory under which processed template output is stored; retains input structure for sub-directories
* outputSuffix (defaults to ""): Suffix to use for output files, instead of input suffix (i.e. inputSuffix is replaced with outputSuffix)

## Template settings

* attributes (no defaults): Map of key/value pairs; attributes that Stringtemplate can use. Added under 'attributes' element in configuration so that key is element name, and value is textual element value

