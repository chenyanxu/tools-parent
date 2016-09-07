--用于导入行政人员数据
--import data from import table
INSERT into sys_user(ID,code,sex,loginname,NAME) SELECT id,id,sex,name,name from import;

UPDATE sys_user set position=1,available=1,password='ICy5YqxZB1uWSwcVLSNLcA=='

UPDATE sys_user SET createbyid=0,createby='管理员',creationdate='2016-09-07 15:13:54.808000'

UPDATE sys_user SET updatebyid=0,updateby='管理员',updatedate='2016-09-07 15:13:54.808000'

UPDATE sys_user SET version_=1