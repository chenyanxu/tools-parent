
-- add 艺术中心企业招聘角色
INSERT INTO public.sys_role (id, createby, createbyid, creationdate, updateby, updatebyid, updatedate, app, name, remark, version_)
  VALUES (702, '管理员', -1, '2018-03-06 08:11:01.916000', '管理员', -1, '2018-03-06 08:11:01.916000', '艺术中心', '企业角色', '企业角色', 1);
-- add 艺术中心学生应聘角色
INSERT INTO public.sys_role (id, createby, createbyid, creationdate, updateby, updatebyid, updatedate, app, name, remark, version_)
  VALUES (703, '管理员', -1, '2018-03-06 08:11:01.916000', '管理员', -1, '2018-03-06 08:11:01.916000', '艺术中心', '学生角色', '学生角色', 1);

-- art-企业角色application授权
INSERT INTO "public"."sys_role_application" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "applicationid", "roleid", "version_")
  VALUES ('100717', 'admin', NULL, NULL, 'admin', NULL, '2018-03-06 08:39:08.936', '6', '702', '1');
-- art-学生角色application授权
INSERT INTO "public"."sys_role_application" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "applicationid", "roleid", "version_")
  VALUES ('100718', 'admin', NULL, NULL, 'admin', NULL, '2018-03-06 08:39:08.936', '6', '703', '1');


--art艺术中心企业角色function授权
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107462', 'admin', NULL, NULL, 'admin', NULL, '2018-03-06 08:39:08.953', '6', '702', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107463', 'admin', NULL, NULL, 'admin', NULL, '2018-03-06 08:39:08.966', '1459', '702', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107464', 'admin', NULL, NULL, 'admin', NULL, '2018-03-06 08:39:08.968', '1460', '702', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107465', 'admin', NULL, NULL, 'admin', NULL, '2018-03-06 08:39:08.969', '1461', '702', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107466', 'admin', NULL, NULL, 'admin', NULL, '2018-03-06 08:39:08.971', '1462', '702', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107467', 'admin', NULL, NULL, 'admin', NULL, '2018-03-06 08:39:08.973', '1463', '702', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107468', 'admin', NULL, NULL, 'admin', NULL, '2018-03-06 08:39:08.974', '1469', '702', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107469', 'admin', NULL, NULL, 'admin', NULL, '2018-03-06 08:39:08.975', '1470', '702', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107470', 'admin', NULL, NULL, 'admin', NULL, '2018-03-06 08:39:08.977', '1471', '702', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107471', 'admin', NULL, NULL, 'admin', NULL, '2018-03-06 08:39:08.978', '1472', '702', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107472', 'admin', NULL, NULL, 'admin', NULL, '2018-03-06 08:39:08.979', '1473', '702', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107473', 'admin', NULL, NULL, 'admin', NULL, '2018-03-06 08:39:08.98', '1474', '702', '1');

INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107474', NULL, NULL, NULL, NULL, NULL, '2018-03-06 09:45:54.509', '6', '703', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107475', NULL, NULL, NULL, NULL, NULL, '2018-03-06 09:45:54.511', '1464', '703', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107476', NULL, NULL, NULL, NULL, NULL, '2018-03-06 09:45:54.512', '1465', '703', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107477', NULL, NULL, NULL, NULL, NULL, '2018-03-06 09:45:54.514', '1466', '703', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107478', NULL, NULL, NULL, NULL, NULL, '2018-03-06 09:45:54.515', '1467', '703', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107479', NULL, NULL, NULL, NULL, NULL, '2018-03-06 09:45:54.516', '1468', '703', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107480', NULL, NULL, NULL, NULL, NULL, '2018-03-06 09:45:54.517', '1475', '703', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107481', NULL, NULL, NULL, NULL, NULL, '2018-03-06 09:45:54.518', '1476', '703', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107482', NULL, NULL, NULL, NULL, NULL, '2018-03-06 09:45:54.519', '1477', '703', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107483', NULL, NULL, NULL, NULL, NULL, '2018-03-06 09:45:54.52', '1478', '703', '1');
INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_") VALUES ('107484', NULL, NULL, NULL, NULL, NULL, '2018-03-06 09:45:54.521', '1479', '703', '1');
