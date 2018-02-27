
DELETE FROM public.sys_template;
INSERT INTO "public"."sys_template" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "content", "desc0", "name", "version_") VALUES ('102114', NULL, NULL, '2018-02-26 11:13:40.051', NULL, NULL, '2018-02-26 11:13:40.04', '', '红头文件使用模板', '红头文件使用模板', '1');

DELETE FROM public.sys_templateconfig;
INSERT INTO "public"."sys_templateconfig" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "fielddesc", "fieldname", "fieldvalue", "templateid", "version_") VALUES ('1', NULL, NULL, '2018-01-31 09:24:34', NULL, NULL, '2018-02-26 11:13:10.606', 'docCaption', 'docCaption', '测试红头文件主标题', '102114', '1');
INSERT INTO "public"."sys_templateconfig" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "fielddesc", "fieldname", "fieldvalue", "templateid", "version_") VALUES ('2', NULL, NULL, '2018-01-31 09:24:49', NULL, NULL, '2018-02-26 11:12:16.847', 'docTypeName', 'docTypeName', '测试类型', '102114', '1');
INSERT INTO "public"."sys_templateconfig" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "fielddesc", "fieldname", "fieldvalue", "templateid", "version_") VALUES ('3', NULL, NULL, '2018-02-02 16:13:03', NULL, NULL, '2018-02-26 11:12:57.287', 'title', 'title', '测试内容标题', '102114', '1');
INSERT INTO "public"."sys_templateconfig" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "fielddesc", "fieldname", "fieldvalue", "templateid", "version_") VALUES ('4', NULL, NULL, '2018-02-02 16:13:32', NULL, NULL, '2018-02-26 11:11:50.41', 'a', 'a', '测试内容', '102114', '1');

DELETE FROM public.sys_templatecontent;

