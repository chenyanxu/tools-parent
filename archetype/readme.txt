自动创建模块的maven archtype.
how to use:
mvn archetype:generate -DarchetypeCatalog=local

例如：创建一个order业务模块
mvn archetype:generate -DgroupId=cn.com.rexen.order -DartifactId=order -Dversion=1.0-SNAPSHOT -Dpackage=cn.com.rexen.order -DarchetypeGroupId=cn.com.rexen.core -DarchetypeArtifactId=cn.com.rexen.core.archetype -DarchetypeVersion=1.0-SNAPSHOT -DarchetypeRepository=local