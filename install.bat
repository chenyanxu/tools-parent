@echo 'Start to build project'
@echo off
git clone https://github.com/chenyanxu/kalix-parent.git
cd kalix-parent
call mvn clean install
cd ..

git clone https://github.com/chenyanxu/framework-parent.git
cd framework-parent
call mvn -DskipTests=true clean install -P openshift-develop
cd ..

git clone https://github.com/chenyanxu/admin-parent.git
cd admin-parent
call mvn clean install
cd ..

git clone https://github.com/chenyanxu/middleware-parent.git
cd middleware-parent
call mvn clean install
cd ..

git clone https://github.com/chenyanxu/oa-parent.git
cd oa-parent
call mvn clean install
cd ..

git clone https://github.com/chenyanxu/common-parent.git
cd common-parent
call mvn clean install
cd ..

git clone https://github.com/chenyanxu/tools-parent.git
cd tools-parent
call mvn clean install
cd ..

@echo on
@echo 'Build project successfully!'