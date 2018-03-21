
-- add 为艺术中心角色application授权
DROP SEQUENCE IF EXISTS "public"."sys_role_application_id_seq";
CREATE SEQUENCE "public"."sys_role_application_id_seq"
 START 1;
select setval('sys_role_application_id_seq', max(id)) from sys_role_application;

INSERT INTO "public"."sys_role_application" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "applicationid", "roleid", "version_")
  SELECT nextval('sys_role_application_id_seq') AS id, 'admin' AS createby, NULL AS createbyid, NULL AS creationdate,
       'admin' AS updateby, NULL AS updatebyid, '2018-03-16 14:26:10.215' AS updatedate,
       id AS applicationid, '702' AS roleid, '1' AS version_ FROM sys_application WHERE NAME = '艺术中心';
INSERT INTO "public"."sys_role_application" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "applicationid", "roleid", "version_")
  SELECT nextval('sys_role_application_id_seq') AS id, 'admin' AS createby, NULL AS createbyid, NULL AS creationdate,
       'admin' AS updateby, NULL AS updatebyid, '2018-03-16 14:26:30.22' AS updatedate,
       id AS applicationid, '703' AS roleid, '1' AS version_ FROM sys_application WHERE NAME = '艺术中心';

--add 为艺术中心角色function授权
DROP SEQUENCE IF EXISTS "public"."sys_role_function_id_seq";
CREATE SEQUENCE "public"."sys_role_function_id_seq"
 START 1;
select setval('sys_role_function_id_seq', max(id)) from sys_role_function;

INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_")
SELECT nextval('sys_role_function_id_seq') AS id, 'admin' AS createby, NULL AS createbyid, NULL AS creationdate,
       'admin' AS updateby, NULL AS updatebyid, '2018-03-16 14:26:10' AS updatedate,
       a.functionid, '702' AS roleid, '1' AS version_
FROM
(select DISTINCT s.functionid from (
select fun.applicationid as functionid FROM sys_function fun, sys_application app WHERE fun.applicationid=app.id and app.name = '艺术中心' and fun.datapermissionkey='recruit'
UNION
select fun.parentid as functionid FROM sys_function fun, sys_application app WHERE fun.applicationid=app.id and app.name = '艺术中心' and fun.datapermissionkey='recruit'
UNION
select fun.id as functionid FROM sys_function fun, sys_application app WHERE fun.applicationid=app.id and app.name = '艺术中心' and fun.datapermissionkey='recruit'
UNION
select t.id as functionid from sys_function t where t.parentid in (
	select fun.id from sys_function fun, sys_application app WHERE fun.applicationid=app.id and app.name = '艺术中心' and fun.datapermissionkey='recruit')

UNION
select fun.applicationid as functionid FROM sys_function fun, sys_application app WHERE fun.applicationid=app.id and app.name = '艺术中心' and fun.datapermissionkey='company'
UNION
select fun.parentid as functionid FROM sys_function fun, sys_application app WHERE fun.applicationid=app.id and app.name = '艺术中心' and fun.datapermissionkey='company'
UNION
select fun.id as functionid FROM sys_function fun, sys_application app WHERE fun.applicationid=app.id and app.name = '艺术中心' and fun.datapermissionkey='company'
UNION
select t.id from sys_function t where t.parentid in (
	select fun.id from sys_function fun, sys_application app WHERE fun.applicationid=app.id and app.name = '艺术中心' and fun.datapermissionkey='company')

) s order by s.functionid) a;

INSERT INTO "public"."sys_role_function" ("id", "createby", "createbyid", "creationdate", "updateby", "updatebyid", "updatedate", "functionid", "roleid", "version_")
SELECT nextval('sys_role_function_id_seq') AS id, 'admin' AS createby, NULL AS createbyid, NULL AS creationdate,
       'admin' AS updateby, NULL AS updatebyid, '2018-03-16 14:26:30' AS updatedate,
       a.functionid, '703' AS roleid, '1' AS version_
FROM
(select DISTINCT s.functionid from (
select fun.applicationid as functionid FROM sys_function fun, sys_application app WHERE fun.applicationid=app.id and app.name = '艺术中心' and fun.datapermissionkey='artcandidate'
UNION
select fun.parentid as functionid FROM sys_function fun, sys_application app WHERE fun.applicationid=app.id and app.name = '艺术中心' and fun.datapermissionkey='artcandidate'
UNION
select fun.id as functionid FROM sys_function fun, sys_application app WHERE fun.applicationid=app.id and app.name = '艺术中心' and fun.datapermissionkey='artcandidate'
UNION
select t.id as functionid from sys_function t where t.parentid in (
	select fun.id from sys_function fun, sys_application app WHERE fun.applicationid=app.id and app.name = '艺术中心' and fun.datapermissionkey='artcandidate')

UNION
select fun.applicationid as functionid FROM sys_function fun, sys_application app WHERE fun.applicationid=app.id and app.name = '艺术中心' and fun.datapermissionkey='artstudent'
UNION
select fun.parentid as functionid FROM sys_function fun, sys_application app WHERE fun.applicationid=app.id and app.name = '艺术中心' and fun.datapermissionkey='artstudent'
UNION
select fun.id as functionid FROM sys_function fun, sys_application app WHERE fun.applicationid=app.id and app.name = '艺术中心' and fun.datapermissionkey='artstudent'
UNION
select t.id from sys_function t where t.parentid in (
	select fun.id from sys_function fun, sys_application app WHERE fun.applicationid=app.id and app.name = '艺术中心' and fun.datapermissionkey='artstudent')

) s order by s.functionid) a;

