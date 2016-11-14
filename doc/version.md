#版本升级
>使用mavan-release-plugin插件升级工程版本

##1.setting.xml设置
    <servers>
        <!--私服上传用户名 密码配置 与pom.xml distributionManagement配置一起使用-->
        <server>
            <id>private-nexus-library-releases</id>
            <username></username>
            <password></password>
        </server>
        <server>
            <id>private-nexus-library-snapshots</id>
            <username></username>
            <password></password>
        </server>
        <!--版本管理服务器用户名 密码配置-->
        <server>
            <id>github.com</id>
            <username></username>
            <password></password>
        </server>
    </servers>
 
##2.pom.xml配置
    <!--软件配置管理-->
    <scm>
        <!--版本管理 地址配置-->
        <connection>scm:git:https://github.com/<user_name>/<repo_name>.git</connection>
        <developerConnection>scm:git:https://github.com/<user_name>/<repo_name>.git</developerConnection>
    </scm>
    <!--插件配置-->
    <build>
        <pluginManagement>
            <plugins>
                <plugin>
                    <groupId>org.apache.maven.plugins</groupId>
                    <artifactId>maven-release-plugin</artifactId>
                    <!--maven-release-plugin.version 2.5.3-->
                    <version>${maven-release-plugin.version}</version>
                </plugin>
            </plugins>
        </pluginManagement>
    </build>
    <!--maven deploy 地址-->
    <distributionManagement>
        <!--release地址-->
        <repository>
            <id>private-nexus-library-releases</id>
            <name>private-nexus-library-releases</name>
            <url>http://ip:port/nexus/content/repositories/releases/</url>
        </repository>
        <!--snapshot地址-->
        <snapshotRepository>
            <id>private-nexus-library-snapshots</id>
            <name>private-nexus-library-snapshots</name>
            <url>http://ip:port/nexus/content/repositories/snapshots/</url>
        </snapshotRepository>
    </distributionManagement>
   
##3.升级操作
###Windows操作系统
>配置mvn环境变量

M2_HOME=D:\java-develop\tools\apache-maven-3.3.9
path增加%M2_HOME%\bin

>详细操作如下：

1.打开cmd.exe 
2.D:
3.cd d:\jave-develop\project_name
4.mvn release:clean 
清理工程
5.mvn release:prepare -Darguments="-DskipTests"
此步骤会进行一些交互操作，我们一律选择默认值即可，在执行过程中自动进行了如下操作（以1.0.0-SNAPSHOT为例）：
第一步：先将1.0.0-SNAPSHOT快照版升级为1.0.0发布版
第二步：将1.0.0发布版打上Tag（默认project-name-1.0.0)，提交到版本库
第三步：将版本升级到1.0.1-SNAPSHOT快照开发板,提交到配置库
6.mvn release:perform -Darguments="-DskipTests -Dmaven.javadoc.skip"
从版本库下载Tag版本工程，对其进行deploy操作

注：如果5、6步骤出现错误，请进行mvn release:rollback操作，修改错误配置后再依次进行5、6操作