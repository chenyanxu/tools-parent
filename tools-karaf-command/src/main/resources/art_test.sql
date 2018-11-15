
-- add 智能就业管理企业招聘角色
INSERT INTO public.sys_role (id, createby, createbyid, creationdate, updateby, updatebyid, updatedate, app, name, remark, version_)
  VALUES (702, '管理员', -1, '2018-03-06 08:11:01.916000', '管理员', -1, '2018-03-06 08:11:01.916000', '智能就业管理', '企业角色', '企业角色', 1);
-- add 智能就业管理学生应聘角色
INSERT INTO public.sys_role (id, createby, createbyid, creationdate, updateby, updatebyid, updatedate, app, name, remark, version_)
  VALUES (703, '管理员', -1, '2018-03-06 08:11:01.916000', '管理员', -1, '2018-03-06 08:11:01.916000', '智能就业管理', '学生角色', '学生角色', 1);


-- add 智能就业管理数据权限（默认查本人，新建查全部的，为admin准备）
INSERT INTO "public"."sys_data_auth" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "appid", "menuid", "remark", "type", "version_")
  VALUES ('71', '管理员', '-1', '2018-03-09 10:14:38.332', '管理员', '-1', NULL, 'art', 'companyMenu', '', '1', '1');
INSERT INTO "public"."sys_data_auth" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "appid", "menuid", "remark", "type", "version_")
  VALUES ('72', '管理员', '-1', '2018-03-09 10:14:38.332', '管理员', '-1', NULL, 'art', 'recruitMenu', '', '1', '1');
INSERT INTO "public"."sys_data_auth" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "appid", "menuid", "remark", "type", "version_")
  VALUES ('73', '管理员', '-1', '2018-03-09 10:14:38.332', '管理员', '-1', NULL, 'research', 'studentMenu', '', '1', '1');
INSERT INTO "public"."sys_data_auth" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "appid", "menuid", "remark", "type", "version_")
  VALUES ('74', '管理员', '-1', '2018-03-09 10:14:38.332', '管理员', '-1', NULL, 'art', 'artcandidateMenu', '', '1', '1');

-- add 为艺术中心数据权限增加用户（管理员和操作员授权查询全部数据）
INSERT INTO "public"."sys_data_auth_user" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "dataauthid", "userid", "version_")
  VALUES ('71', 'admin', NULL, '2018-03-09 10:37:51.184', 'admin', NULL, '2018-03-09 10:37:51.184', '71', '-1', '1');
INSERT INTO "public"."sys_data_auth_user" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "dataauthid", "userid", "version_")
  VALUES ('72', 'admin', NULL, '2018-03-09 10:37:51.201', 'admin', NULL, '2018-03-09 10:37:51.201', '71', '-2', '1');
INSERT INTO "public"."sys_data_auth_user" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "dataauthid", "userid", "version_")
  VALUES ('73', 'admin', NULL, '2018-03-09 10:37:51.184', 'admin', NULL, '2018-03-09 10:37:51.184', '72', '-1', '1');
INSERT INTO "public"."sys_data_auth_user" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "dataauthid", "userid", "version_")
  VALUES ('74', 'admin', NULL, '2018-03-09 10:37:51.201', 'admin', NULL, '2018-03-09 10:37:51.201', '72', '-2', '1');
  INSERT INTO "public"."sys_data_auth_user" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "dataauthid", "userid", "version_")
  VALUES ('75', 'admin', NULL, '2018-03-09 10:37:51.184', 'admin', NULL, '2018-03-09 10:37:51.184', '73', '-1', '1');
INSERT INTO "public"."sys_data_auth_user" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "dataauthid", "userid", "version_")
  VALUES ('76', 'admin', NULL, '2018-03-09 10:37:51.201', 'admin', NULL, '2018-03-09 10:37:51.201', '73', '-2', '1');
  INSERT INTO "public"."sys_data_auth_user" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "dataauthid", "userid", "version_")
  VALUES ('77', 'admin', NULL, '2018-03-09 10:37:51.184', 'admin', NULL, '2018-03-09 10:37:51.184', '74', '-1', '1');
INSERT INTO "public"."sys_data_auth_user" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "dataauthid", "userid", "version_")
  VALUES ('78', 'admin', NULL, '2018-03-09 10:37:51.201', 'admin', NULL, '2018-03-09 10:37:51.201', '74', '-2', '1');


-- add 用户信息-企业和学生各两个测试用户
INSERT INTO "public"."sys_user" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "available", "email", "icon", "logindate", "loginip", "loginname", "mobile", "name", "password", "phone", "sex", "code", "position", "usertype", "version_")
  VALUES ('780', NULL, NULL, NULL, NULL, NULL, NULL, '1', 'testcompany@qq.com', NULL, NULL, NULL, 'qy001', '13145678901', '测试企业1', 'ICy5YqxZB1uWSwcVLSNLcA==', '88888881', '', 'qy001', NULL, '3', '1');
INSERT INTO "public"."sys_user" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "available", "email", "icon", "logindate", "loginip", "loginname", "mobile", "name", "password", "phone", "sex", "code", "position", "usertype", "version_")
  VALUES ('781', NULL, NULL, NULL, NULL, NULL, NULL, '1', 'testcompany@qq.com', NULL, NULL, NULL, 'qy002', '13145678902', '测试企业2', 'ICy5YqxZB1uWSwcVLSNLcA==', '88888882', '', 'qy002', NULL, '3', '1');
INSERT INTO "public"."sys_user" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "available", "email", "icon", "logindate", "loginip", "loginname", "mobile", "name", "password", "phone", "sex", "code", "position", "usertype", "version_")
  VALUES ('782', NULL, NULL, NULL, NULL, NULL, NULL, '1', 'teststudent@qq.com', NULL, NULL, NULL, 'xs001', '13145678903', '测试学生1', 'ICy5YqxZB1uWSwcVLSNLcA==', '', '男', 'xs001', NULL, '1', '1');
INSERT INTO "public"."sys_user" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "available", "email", "icon", "logindate", "loginip", "loginname", "mobile", "name", "password", "phone", "sex", "code", "position", "usertype", "version_")
  VALUES ('783', NULL, NULL, NULL, NULL, NULL, NULL, '1', 'teststudent@qq.com', NULL, NULL, NULL, 'xs002', '13145678904', '测试学生2', 'ICy5YqxZB1uWSwcVLSNLcA==', '', '男', 'xs002', NULL, '1', '1');


-- add 用户授权（测试用户赋予角色）
INSERT INTO "public"."sys_role_user" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "roleid", "userid", "version_") VALUES ('110800', NULL, NULL, NULL, NULL, NULL, '2018-03-09 07:47:41', '702', '780', '1');
INSERT INTO "public"."sys_role_user" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "roleid", "userid", "version_") VALUES ('110801',NULL, NULL, NULL, NULL, NULL, '2018-03-09 07:47:41', '702', '781', '1');
INSERT INTO "public"."sys_role_user" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "roleid", "userid", "version_") VALUES ('110802',NULL, NULL, NULL, NULL, NULL, '2018-03-09 07:47:41', '703', '782', '1');
INSERT INTO "public"."sys_role_user" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "roleid", "userid", "version_") VALUES ('110803',NULL, NULL, NULL, NULL, NULL, '2018-03-09 07:47:41', '703', '783', '1');


-- add 组织机构（动画专业）
INSERT INTO "public"."sys_organization" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "areaid", "centercode", "code", "dept", "isleaf", "name", "parentid", "version_")
  VALUES ('5341', 'admin', NULL, '2018-03-13 07:55:51.133', 'admin', NULL, '2018-03-13 07:55:51.104', NULL, NULL, '001029001006', NULL, '1', '动画专业', '22602', '1');


-- add 企业详细信息
DELETE FROM public.art_company;
INSERT INTO "public"."art_company" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "address", "city", "industry", "life", "nature", "region", "scale", "userid", "version_")
  VALUES ('780', '管理员', '-1', '2018-03-21 15:12:48', '管理员', '-1', NULL, '解放大路5888号', '长春市', '1', '5年', '1', '22', '100-200人', '780', '1');
INSERT INTO "public"."art_company" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "address", "city", "industry", "life", "nature", "region", "scale", "userid", "version_")
  VALUES ('781', '管理员', '-1', '2018-03-21 15:13:42', '管理员', '-1', NULL, '人民大街8888号', '长春市', '6', '20年', '2', '22', '300-500人', '781', '1');

-- add 学生详细信息
DELETE FROM public.research_person_student;
INSERT INTO "public"."research_person_student" ("id", "address", "birthday", "entranceyear", "instructor", "majorid", "nation", "period", "placeoforigin", "politicalstatus", "postalcode", "province", "traininglevel", "userid", "version_", "classname")
  VALUES ('782','北京市瀛海镇四海三村北十条8号院','1994-08-10','2012/1/1 0:00','刘微','5341','汉族','4年','北京市','共青团员','100176','11','本科','782','1','2014级三维特效2班');
INSERT INTO "public"."research_person_student" ("id", "address", "birthday", "entranceyear", "instructor", "majorid", "nation", "period", "placeoforigin", "politicalstatus", "postalcode", "province", "traininglevel", "userid", "version_", "classname")
  VALUES ('783','北京市昌平区南口镇雪山村','1993-02-02','2012/1/1 0:00','刘微','5341','汉族','4年','北京市昌平区','共青团员','','11','本科','783','1','2014级三维动画绑定2班');

-- add 企业招聘信息
DELETE FROM public.art_recruit;
INSERT INTO "public"."art_recruit" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "appliedtechnology", "city", "companyaddress", "companycity", "companycode", "companyemail", "companyindustry", "companylife", "companymobile", "companyname", "companynature", "companyphone", "companyregion", "companyscale", "education", "functioncategoryid", "jobnumbers", "jobtype", "personrequires", "position", "positionrequires", "probationsalary", "publishdate", "region", "requiresofts", "salary", "version_") VALUES ('301', '测试企业1', '780', '2018-03-21 15:18:29.078', '测试企业1', '780', '2018-03-21 15:18:29.064', NULL, '长春市', '解放大路5888号', '长春市', 'qy001', 'testcompany@qq.com', '1', '5年', '13145678901', '测试企业1', '1', '88888881', '22', '100-200 人', '2', '31', '2', '0', '1,3,5,6,7', '广告策划', '要求1，要求2，要求3', '2', '2018-03-21 00:00:00', '22', '软件1，软件2', '4', '1');
INSERT INTO "public"."art_recruit" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "appliedtechnology", "city", "companyaddress", "companycity", "companycode", "companyemail", "companyindustry", "companylife", "companymobile", "companyname", "companynature", "companyphone", "companyregion", "companyscale", "education", "functioncategoryid", "jobnumbers", "jobtype", "personrequires", "position", "positionrequires", "probationsalary", "publishdate", "region", "requiresofts", "salary", "version_") VALUES ('302', '测试企业2', '781', '2018-03-21 15:20:57.285', '测试企业2', '781', '2018-03-21 15:20:57.273', NULL, '长春', '人民大街8888号', '长春市', 'qy002', 'testcompany@qq.com', '6', '20年', '13145678902', '测试企业2', '2', '88888882', '22', '300-500人', '2', '5', '3', '0', '5,3,1,2,11', '岗位1', '要求1，要求2', '2', '2018-03-21 00:00:00', '22', '软件1，软件2', '4', '1');
INSERT INTO "public"."art_recruit" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "appliedtechnology", "city", "companyaddress", "companycity", "companycode", "companyemail", "companyindustry", "companylife", "companymobile", "companyname", "companynature", "companyphone", "companyregion", "companyscale", "education", "functioncategoryid", "jobnumbers", "jobtype", "personrequires", "position", "positionrequires", "probationsalary", "publishdate", "region", "requiresofts", "salary", "version_") VALUES ('303', '测试企业2', '781', '2018-03-21 15:22:17.21', '测试企业2', '781', '2018-03-21 15:22:17.199', NULL, '长春', '人民大街8888号', '长春市', 'qy002', 'testcompany@qq.com', '6', '20年', '13145678902', '测试企业2', '2', '88888882', '22', '300-500人', '2', '53', '2', '0', '0,1,2,4,6,12', '软件工程师', '要求1，要求2，要求3', '3', '2018-03-21 00:00:00', '22', '软件1', '5', '1');

-- add 学生应聘信息
DELETE FROM public.art_candidate;
INSERT INTO "public"."art_candidate" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "careergoal", "city", "code", "education", "expectingindustry", "jobtype", "learningsofts", "name", "position", "region", "salary", "skills", "version_") VALUES ('601', '测试学生1', '782', '2018-03-21 15:42:41.404', '测试学生1', '782', '2018-03-21 15:42:41.387', NULL, '长春市', 'xs001', '2', '1', '0', '软件1，软件2，软件3，软件4，软件5', '测试学生1', '岗位1，岗位2', '22', '4', '0,1,2,3,4,5,6,7,8,9,10,11,12', '1');
INSERT INTO "public"."art_candidate" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "careergoal", "city", "code", "education", "expectingindustry", "jobtype", "learningsofts", "name", "position", "region", "salary", "skills", "version_") VALUES ('602', '测试学生2', '783', '2018-03-21 15:44:56.768', '测试学生2', '783', '2018-03-21 15:44:56.756', NULL, '长春市', 'xs002', '2', '0', '0', '软件1，软件2，软件3', '测试学生2', '岗位1', '22', '5', '0,1,2,3,4,5,6', '1');
