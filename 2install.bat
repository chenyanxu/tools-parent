@echo 'Start to build project'
@echo off
set hasErrors=0

IF %hasErrors%==0 cd kalix-parent & call mvn clean install || set hasErrors=1
IF %hasErrors%==1 echo 'An error occurred of kalix-parent' & pause & goto :EOF

cd ..
IF %hasErrors%==0 cd framework-parent & call mvn -DskipTests=true clean install  -P openshift-develop || set hasErrors=1
IF %hasErrors%==1 echo 'An error occurred of framework-parent' & pause & goto :EOF

cd ..
IF %hasErrors%==0  cd admin-parent & call mvn  -DskipTests=true clean install || set hasErrors=1
IF %hasErrors%==1 echo 'An error occurred of admin-parent' & pause & goto :EOF

cd ..
IF %hasErrors%==0  cd middleware-parent & call mvn  -DskipTests=true clean install || set hasErrors=1
IF %hasErrors%==1 echo 'An error occurred of middleware-parent' & pause & goto :EOF

cd ..
IF %hasErrors%==0  cd oa-parent & call mvn clean install || set hasErrors=1
IF %hasErrors%==1 echo 'An error occurred of oa-parent' & pause & goto :EOF

cd ..
IF %hasErrors%==0  cd common-parent & call mvn clean install || set hasErrors=1
IF %hasErrors%==1 echo 'An error occurred of common-parent' & pause & goto :EOF


cd ..
IF %hasErrors%==0  cd schedule-parent & call mvn clean install || set hasErrors=1
IF %hasErrors%==1 echo 'An error occurred of schedule-parent' & pause & goto :EOF

cd ..
IF %hasErrors%==0  cd general-parent & call mvn  -DskipTests=true clean install || set hasErrors=1
IF %hasErrors%==1 echo 'An error occurred of general-parent' & pause & goto :EOF


cd ..
IF %hasErrors%==0  cd research-parent & call mvn clean install || set hasErrors=1
IF %hasErrors%==1 echo 'An error occurred of research-parent' & pause & goto :EOF

cd ..
IF %hasErrors%==0  cd art-parent & call mvn  -DskipTests=true clean install || set hasErrors=1
IF %hasErrors%==1 echo 'An error occurred of art-parent' & pause & goto :EOF

cd ..
IF %hasErrors%==0  cd educational-parent & call mvn  -DskipTests=true clean install || set hasErrors=1
IF %hasErrors%==1 echo 'An error occurred of educational-parent' & pause & goto :EOF


cd ..
IF %hasErrors%==0  cd tools-parent & call mvn clean install || set hasErrors=1
IF %hasErrors%==1 echo 'An error occurred of tools-parent' & pause & goto :EOF

cd ..

@echo on
@echo 'Build project successfully!'

cmd