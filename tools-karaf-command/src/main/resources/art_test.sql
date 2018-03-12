
-- add 艺术中心企业招聘角色
INSERT INTO public.sys_role (id, createby, createbyid, creationdate, updateby, updatebyid, updatedate, app, name, remark, version_)
  VALUES (702, '管理员', -1, '2018-03-06 08:11:01.916000', '管理员', -1, '2018-03-06 08:11:01.916000', '艺术中心', '企业角色', '企业角色', 1);
-- add 艺术中心学生应聘角色
INSERT INTO public.sys_role (id, createby, createbyid, creationdate, updateby, updatebyid, updatedate, app, name, remark, version_)
  VALUES (703, '管理员', -1, '2018-03-06 08:11:01.916000', '管理员', -1, '2018-03-06 08:11:01.916000', '艺术中心', '学生角色', '学生角色', 1);


-- add 艺术中心数据权限（默认查本人，新建查全部的，为admin准备）
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
