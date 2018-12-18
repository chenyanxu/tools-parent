@echo 'Start to build project'
@echo off
git clone -b session-new https://gitee.com/donghuaxueyuan/kalix-vue-frame.git
cd kalix-vue-frame
call npm install
cd ..

git clone https://gitee.com/donghuaxueyuan/kalix-vue-enrolment.git
cd kalix-vue-enrolment
call npm install
cd ..

@echo on
@echo 'Build project successfully!'