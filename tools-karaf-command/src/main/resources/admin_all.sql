DELETE FROM public.sys_user;
INSERT INTO public.sys_user (id, createby, creationdate, updateby, updatedate, available, email, logindate, loginip, loginname, mobile, name, password, phone,  version_) VALUES (0, '系统', '2016-08-04 15:13:54.808000', '系统', '2016-08-04 15:13:54.808000', 1, null, null, null, 'admin', null, '管理员', 'ICy5YqxZB1uWSwcVLSNLcA==', null, 1);
INSERT INTO public.sys_user (id, createby, creationdate, updateby, updatedate, available, email, logindate, loginip, loginname, mobile, name, password, phone, version_) VALUES (-1, '系统', '2016-08-04 15:13:54.808000', '系统', '2016-08-04 15:13:54.808000', 1, null, null, null, 'qwer', null, '操作员', 'ICy5YqxZB1uWSwcVLSNLcA==', null, 1);

DELETE FROM public.sys_role;
INSERT INTO public.sys_role (id, createby, creationdate, updateby, updatedate, app, name, remark, version_) VALUES (1, '管理员', '2015-11-17 02:32:42.692000', '管理员', '2015-11-17 02:32:42.707000', '系统应用', '超级管理员', '系统应用', 1);

DELETE FROM public.sys_role_user;
INSERT INTO public.sys_role_user (id, createby, creationdate, updateby, updatedate, roleid, userid, version_) VALUES (1, '管理员', '2015-11-17 01:52:55.053000', '管理员', '2015-11-17 01:52:55.053000', 1, 0, 1);

DELETE FROM public.sys_organization_user;
INSERT INTO public.sys_organization_user (id, createby, creationdate, updateby, updatedate, orgid, userid, version_) VALUES (1, '管理员', '2016-08-09 13:09:00.000000', '管理员', '2016-08-09 13:09:00.000000', 1, 0, 1);

--工作组初始化
DELETE FROM public.sys_workgroup;
INSERT INTO public.sys_workgroup (id, createby, creationdate, updateby, updatedate, app, name, remark, version_) VALUES (1, '管理员', '2016-08-09 15:13:13.033000', '管理员', '2016-08-09 15:13:13.033000', '系统应用', '系统管理工作组', '最高权限工作组', 1);

DELETE FROM public.sys_workgroup_user;
INSERT INTO public.sys_workgroup_user (id, createby, creationdate, updateby, updatedate, groupid, userid, version_) VALUES (1, '管理员', '2016-08-09 15:13:38.028000', '管理员', '2016-08-09 15:13:38.028000', 1, 0, 1);

DELETE FROM public.sys_workgroup_role;
INSERT INTO public.sys_workgroup_role (id, createby, creationdate, updateby, updatedate, groupid, roleid, version_) VALUES (1, '管理员', '2016-08-09 15:13:38.028000', '管理员', '2016-08-09 15:13:38.028000', 1, 1, 1);
--DELETE FROM public.sys_role_application;
--INSERT INTO public.sys_role_application VALUES ('1', '管理员', '2015-11-17 00:11:36.699', '管理员', '2015-11-17 00:11:36.699', '0', '1', '1');
--INSERT INTO public.sys_role_application VALUES ('2', '管理员', '2016-06-03 16:28:40.754', '管理员', '2016-06-03 16:28:40.754', '0', '2', '1');
--INSERT INTO public.sys_role_application VALUES ('3', '管理员', '2016-06-03 16:28:40.754', '管理员', '2016-06-03 16:28:40.754', '0', '3', '1');
--INSERT INTO public.sys_role_function VALUES ('1', '管理员', '2015-11-17 00:11:36.703', '管理员', '2015-11-17 00:11:36.703', '0', '1', '1');