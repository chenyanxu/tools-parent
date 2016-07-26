/*
Navicat PGSQL Data Transfer

Source Server         : pg
Source Server Version : 90404
Source Host           : localhost:5432
Source Database       : kalix
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90404
File Encoding         : 65001

Date: 2016-05-24 09:20:02
*/


-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_organization";
CREATE TABLE "public"."sys_organization" (
"id" int8 NOT NULL,
"createby" varchar(255) COLLATE "default",
"creationdate" timestamp(6),
"updateby" varchar(255) COLLATE "default",
"updatedate" timestamp(6),
"version_" int8,
"areaid" int4 NOT NULL,
"centercode" varchar(255) COLLATE "default",
"code" varchar(255) COLLATE "default",
"isleaf" int4 NOT NULL,
"name" varchar(255) COLLATE "default",
"parentid" int8 NOT NULL,
"dept" bool
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO "public"."sys_organization" VALUES ('40810', '管理员', '2016-02-29 13:52:29.641', 'qwer', '2016-03-03 14:01:13.897', '5', '10', '001001', '001', '0', '吉林动画学院 ', '-1', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42011', 'qwer', '2016-03-03 14:00:44.948', 'qwer', '2016-03-03 14:00:44.948', '1', '10', '', '001001', '1', '董事会机构', '40810', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42012', 'qwer', '2016-03-03 14:01:34.628', 'qwer', '2016-03-03 14:01:34.628', '1', '10', '', '001002', '1', '职能机构（部）', '40810', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42013', 'qwer', '2016-03-03 14:01:46.614', 'qwer', '2016-03-03 14:01:46.614', '1', '10', '', '001003', '1', '职能机构（中心）', '40810', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42014', 'qwer', '2016-03-03 14:02:09.31', 'qwer', '2016-03-03 14:02:09.31', '1', '10', '', '001004', '1', '教学单位', '40810', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42015', 'qwer', '2016-03-03 14:02:32.111', 'qwer', '2016-03-03 14:02:32.111', '1', '10', '', '001005', '1', '教辅单位', '40810', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42016', 'qwer', '2016-03-03 14:02:42.481', 'qwer', '2016-03-03 14:02:42.481', '1', '10', '', '001006', '1', '科研单位', '40810', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42017', 'qwer', '2016-03-03 14:02:56.16', 'qwer', '2016-03-03 14:02:56.16', '1', '10', '', '001007', '1', '公司', '40810', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42018', 'qwer', '2016-03-03 14:03:12.301', 'qwer', '2016-03-03 14:03:12.301', '1', '10', '', '001008', '1', '平台', '40810', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42110', null, null, null, null, null, '0', null, '001001001', '1', '董事长办公室 （校友会办公室）', '42011', 't');
INSERT INTO "public"."sys_organization" VALUES ('42114', null, null, null, null, null, '0', null, '001001003', '1', '人才培养质量监控办公室', '42011', 't');
INSERT INTO "public"."sys_organization" VALUES ('42115', null, null, null, null, null, '0', null, '001001002', '1', '督导与绩效管理办公室', '42011', 't');
INSERT INTO "public"."sys_organization" VALUES ('42116', null, null, null, null, null, '0', null, '001002001', '0', '校务部', '42012', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42117', null, null, null, null, null, '0', null, '001002002', '0', '教务部', '42012', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42118', null, null, null, null, null, '0', null, '001002003', '0', '学生工作部', '42012', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42119', null, null, null, null, null, '0', null, '001002004', '0', '党群工作部', '42012', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42120', null, null, null, null, null, '0', null, '001002001001', '1', '行政事务办公室', '42116', 't');
INSERT INTO "public"."sys_organization" VALUES ('42121', null, null, null, null, null, '0', null, '001002001002', '1', '文秘综合办公室', '42116', 't');
INSERT INTO "public"."sys_organization" VALUES ('42122', null, null, null, null, null, '0', null, '001002001003', '1', '文化艺术中心', '42116', 't');
INSERT INTO "public"."sys_organization" VALUES ('42123', null, null, null, null, null, '0', null, '001002001004', '1', '校史展览馆', '42116', 't');
INSERT INTO "public"."sys_organization" VALUES ('42124', null, null, null, null, null, '0', null, '001002002001', '1', '教学运行办公室', '42117', 't');
INSERT INTO "public"."sys_organization" VALUES ('42125', null, null, null, null, null, '0', null, '001002002002', '1', '实践教学办公室', '42117', 't');
INSERT INTO "public"."sys_organization" VALUES ('42126', null, null, null, null, null, '0', null, '001002002003', '1', '教学建设办公室（高教研究所）', '42117', 't');
INSERT INTO "public"."sys_organization" VALUES ('42127', null, null, null, null, null, '0', null, '001002002004', '1', '教学质量监控办公室', '42117', 't');
INSERT INTO "public"."sys_organization" VALUES ('42128', null, null, null, null, null, '0', null, '001002003001', '1', '学工综合办公室', '42118', 't');
INSERT INTO "public"."sys_organization" VALUES ('42129', null, null, null, null, null, '0', null, '001002003002', '1', '思想政治教育工作办公室（团委）', '42118', 't');
INSERT INTO "public"."sys_organization" VALUES ('42130', null, null, null, null, null, '0', null, '001002003003', '1', '招生与就业办公室（团委）', '42118', 't');
INSERT INTO "public"."sys_organization" VALUES ('42131', null, null, null, null, null, '0', null, '001002003004', '1', '大学生就业与创业指导中心', '42118', 't');
INSERT INTO "public"."sys_organization" VALUES ('42132', null, null, null, null, null, '0', null, '001002003005', '1', '大学生心理健康教育指导中心', '42118', 't');
INSERT INTO "public"."sys_organization" VALUES ('42133', null, null, null, null, null, '0', null, '001002004001', '1', '党委综合办公室（组织部、纪委）', '42119', 't');
INSERT INTO "public"."sys_organization" VALUES ('42134', null, null, null, null, null, '0', null, '001002004002', '1', '宣传部（统战部）', '42119', 't');
INSERT INTO "public"."sys_organization" VALUES ('42135', null, null, null, null, null, '0', null, '001002004003', '1', '工会', '42119', 't');
INSERT INTO "public"."sys_organization" VALUES ('42136', null, null, null, null, null, '0', null, '001003001', '0', '企划中心', '42013', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42137', null, null, null, null, null, '0', null, '001003002', '0', '人力资源开发与管理中心', '42013', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42138', null, null, null, null, null, '0', null, '001003003', '0', '国际合作与交流中心', '42013', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42139', null, null, null, null, null, '0', null, '001003004', '0', '科研与技术创新中心', '42013', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42140', null, null, null, null, null, '0', null, '001003005', '0', '财务管理与审计中心', '42013', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42141', null, null, null, null, null, '0', null, '001003006', '0', '资产采购管理中心', '42013', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42142', null, null, null, null, null, '0', null, '001003007', '0', '信息化建设中心', '42013', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42143', null, null, null, null, null, '0', null, '001003008', '0', '后勤服务管理中心', '42013', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42144', null, null, null, null, null, '0', null, '001003009', '1', '创新创业中心学研产一体化推进办公室）', '42013', 't');
INSERT INTO "public"."sys_organization" VALUES ('42145', null, null, null, null, null, '0', null, '001003001001', '1', '发展规划办公室', '42136', 't');
INSERT INTO "public"."sys_organization" VALUES ('42146', null, null, null, null, null, '0', null, '001003001002', '1', '内容管理办公室', '42136', 't');
INSERT INTO "public"."sys_organization" VALUES ('42147', null, null, null, null, null, '0', null, '001003001003', '1', '文化建设办公室', '42136', 't');
INSERT INTO "public"."sys_organization" VALUES ('42148', null, null, null, null, null, '0', null, '001003001004', '1', '品牌推广办公室', '42136', 't');
INSERT INTO "public"."sys_organization" VALUES ('42149', null, null, null, null, null, '0', null, '001003002001', '1', '综合办公室', '42137', 't');
INSERT INTO "public"."sys_organization" VALUES ('42150', null, null, null, null, null, '0', null, '001003003001', '1', '国际合作与专家管理办公室', '42138', 't');
INSERT INTO "public"."sys_organization" VALUES ('42151', null, null, null, null, null, '0', null, '001003003002', '1', '留学工作办公室', '42138', 't');
INSERT INTO "public"."sys_organization" VALUES ('42152', null, null, null, null, null, '0', null, '001003004001', '1', '科研管理办公室', '42139', 't');
INSERT INTO "public"."sys_organization" VALUES ('42153', null, null, null, null, null, '0', null, '001003004002', '1', '协同创新办公室', '42139', 't');
INSERT INTO "public"."sys_organization" VALUES ('42154', null, null, null, null, null, '0', null, '001003004003', '1', '研究生工作办公室', '42139', 't');
INSERT INTO "public"."sys_organization" VALUES ('42155', null, null, null, null, null, '0', null, '001003005001', '1', '会计办公室', '42140', 't');
INSERT INTO "public"."sys_organization" VALUES ('42156', null, null, null, null, null, '0', null, '001003005002', '1', '预算管理办公室', '42140', 't');
INSERT INTO "public"."sys_organization" VALUES ('42157', null, null, null, null, null, '0', null, '001003005003', '1', '审计办公室', '42140', 't');
INSERT INTO "public"."sys_organization" VALUES ('42158', null, null, null, null, null, '0', null, '001003006001', '1', '资产管理办公室', '42141', 't');
INSERT INTO "public"."sys_organization" VALUES ('42159', null, null, null, null, null, '0', null, '001003006002', '1', '采购办公室', '42141', 't');
INSERT INTO "public"."sys_organization" VALUES ('42160', null, null, null, null, null, '0', null, '001003007001', '1', '网络管理办公室', '42142', 't');
INSERT INTO "public"."sys_organization" VALUES ('42161', null, null, null, null, null, '0', null, '001003007002', '1', '信息化建设办公室', '42142', 't');
INSERT INTO "public"."sys_organization" VALUES ('42162', null, null, null, null, null, '0', null, '001003008001', '1', '保卫办公室', '42143', 't');
INSERT INTO "public"."sys_organization" VALUES ('42163', null, null, null, null, null, '0', null, '001003008002', '1', '总务办公室', '42143', 't');
INSERT INTO "public"."sys_organization" VALUES ('42164', null, null, null, null, null, '0', null, '001003008003', '1', '基建办公室', '42143', 't');
INSERT INTO "public"."sys_organization" VALUES ('42165', null, null, null, null, null, '0', null, '001003008004', '1', '餐饮服务办公室', '42143', 't');
INSERT INTO "public"."sys_organization" VALUES ('42166', null, null, null, null, null, '0', null, '001004001', '0', '动画艺术学院', '42014', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42167', null, null, null, null, null, '0', null, '001004002', '0', '游戏 学院', '42014', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42168', null, null, null, null, null, '0', null, '001004003', '0', '设计学院', '42014', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42169', null, null, null, null, null, '0', null, '001004004', '0', '产品造型学院', '42014', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42170', null, null, null, null, null, '0', null, '001004005', '0', '电影电视学院', '42014', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42171', null, null, null, null, null, '0', null, '001004006', '0', '广告 学院', '42014', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42172', null, null, null, null, null, '0', null, '001004007', '0', '漫画 学院', '42014', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42173', null, null, null, null, null, '0', null, '001004008', '0', '文化产业管理学院', '42014', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42174', null, null, null, null, null, '0', null, '001004009', '0', '计算机学院', '42014', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42175', null, null, null, null, null, '0', null, '001004010', '1', '公共基础教学部', '42014', 't');
INSERT INTO "public"."sys_organization" VALUES ('42176', null, null, null, null, null, '0', null, '001004011', '1', '思想政治理论教学部', '42014', 't');
INSERT INTO "public"."sys_organization" VALUES ('42177', null, null, null, null, null, '0', null, '001004012', '1', '外语教学部', '42014', 't');
INSERT INTO "public"."sys_organization" VALUES ('42178', null, null, null, null, null, '0', null, '001004013', '1', '力行职业发展学院', '42014', 't');
INSERT INTO "public"."sys_organization" VALUES ('42179', null, null, null, null, null, '0', null, '001004014', '1', '高等职业学院', '42014', 't');
INSERT INTO "public"."sys_organization" VALUES ('42180', null, null, null, null, null, '0', null, '001004001001', '1', '动画策划设计系', '42166', 't');
INSERT INTO "public"."sys_organization" VALUES ('42181', null, null, null, null, null, '0', null, '001004001002', '1', '影视动画系', '42166', 't');
INSERT INTO "public"."sys_organization" VALUES ('42182', null, null, null, null, null, '0', null, '001004001003', '1', '新媒体动画系', '42166', 't');
INSERT INTO "public"."sys_organization" VALUES ('42183', null, null, null, null, null, '0', null, '001004001004', '1', '影视特技系', '42166', 't');
INSERT INTO "public"."sys_organization" VALUES ('42184', null, null, null, null, null, '0', null, '001004001006', '1', '基础教研室', '42166', 't');
INSERT INTO "public"."sys_organization" VALUES ('42185', null, null, null, null, null, '0', null, '001004002001', '1', '数字媒体艺术系', '42167', 't');
INSERT INTO "public"."sys_organization" VALUES ('42186', null, null, null, null, null, '0', null, '001004002002', '1', '数字媒体技术系', '42167', 't');
INSERT INTO "public"."sys_organization" VALUES ('42187', null, null, null, null, null, '0', null, '001004002003', '1', '艺术与科技系', '42167', 't');
INSERT INTO "public"."sys_organization" VALUES ('42188', null, null, null, null, null, '0', null, '001004003001', '1', '环境设计系', '42168', 't');
INSERT INTO "public"."sys_organization" VALUES ('42189', null, null, null, null, null, '0', null, '001004003002', '1', '视觉传达设计系', '42168', 't');
INSERT INTO "public"."sys_organization" VALUES ('42190', null, null, null, null, null, '0', null, '001004003003', '1', '服装与服饰设计系', '42168', 't');
INSERT INTO "public"."sys_organization" VALUES ('42191', null, null, null, null, null, '0', null, '001004004001', '1', '产品设计系', '42169', 't');
INSERT INTO "public"."sys_organization" VALUES ('42192', null, null, null, null, null, '0', null, '001004004002', '1', '工艺美术系', '42169', 't');
INSERT INTO "public"."sys_organization" VALUES ('42193', null, null, null, null, null, '0', null, '001004005002', '1', '广播电视学系', '42170', 't');
INSERT INTO "public"."sys_organization" VALUES ('42194', null, null, null, null, null, '0', null, '001004005003', '1', '摄影系', '42170', 't');
INSERT INTO "public"."sys_organization" VALUES ('42195', null, null, null, null, null, '0', null, '001004005004', '1', '播音与主持艺术系', '42170', 't');
INSERT INTO "public"."sys_organization" VALUES ('42196', null, null, null, null, null, '0', null, '001004005005', '1', '戏剧影视美术设计系', '42170', 't');
INSERT INTO "public"."sys_organization" VALUES ('42197', null, null, null, null, null, '0', null, '001004005006', '1', '表演系', '42170', 't');
INSERT INTO "public"."sys_organization" VALUES ('42198', null, null, null, null, null, '0', null, '001004005007', '1', '戏剧影视文学系', '42170', 't');
INSERT INTO "public"."sys_organization" VALUES ('42199', null, null, null, null, null, '0', null, '001004005008', '1', '戏剧影视导演系', '42170', 't');
INSERT INTO "public"."sys_organization" VALUES ('42200', null, null, null, null, null, '0', null, '001004005009', '1', '网络与新媒体系', '42170', 't');
INSERT INTO "public"."sys_organization" VALUES ('42201', null, null, null, null, null, '0', null, '001004006001', '1', '广告设计系', '42171', 't');
INSERT INTO "public"."sys_organization" VALUES ('42202', null, null, null, null, null, '0', null, '001004006002', '1', '广告学系', '42171', 't');
INSERT INTO "public"."sys_organization" VALUES ('42203', null, null, null, null, null, '0', null, '001004006003', '1', '影视摄影与制作系', '42171', 't');
INSERT INTO "public"."sys_organization" VALUES ('42204', null, null, null, null, null, '0', null, '001004007001', '1', '新媒体漫画系', '42172', 't');
INSERT INTO "public"."sys_organization" VALUES ('42205', null, null, null, null, null, '0', null, '001004007002', '1', '商业绘画系', '42172', 't');
INSERT INTO "public"."sys_organization" VALUES ('42206', null, null, null, null, null, '0', null, '001004008001', '1', '市场营销系', '42173', 't');
INSERT INTO "public"."sys_organization" VALUES ('42207', null, null, null, null, null, '0', null, '001004008002', '1', '文化产业管理系', '42173', 't');
INSERT INTO "public"."sys_organization" VALUES ('42208', null, null, null, null, null, '0', null, '001004009001', '1', '软件工程系', '42174', 't');
INSERT INTO "public"."sys_organization" VALUES ('42209', null, null, null, null, null, '0', null, '001005001', '0', '图书馆', '42015', 'f');
INSERT INTO "public"."sys_organization" VALUES ('42210', null, null, null, null, null, '0', null, '001005002', '1', '档案馆', '42015', 't');
INSERT INTO "public"."sys_organization" VALUES ('42211', null, null, null, null, null, '0', null, '001005003', '1', '吉林国际动漫博物馆', '42015', 't');
INSERT INTO "public"."sys_organization" VALUES ('42212', null, null, null, null, null, '0', null, '001005001001', '1', '综合业务部', '42209', 't');
INSERT INTO "public"."sys_organization" VALUES ('42213', null, null, null, null, null, '0', null, '001005001002', '1', '采编部', '42209', 't');
INSERT INTO "public"."sys_organization" VALUES ('42214', null, null, null, null, null, '0', null, '001005001003', '1', '流通部', '42209', 't');
INSERT INTO "public"."sys_organization" VALUES ('42215', null, null, null, null, null, '0', null, '001005001004', '1', '技术部', '42209', 't');
INSERT INTO "public"."sys_organization" VALUES ('42216', null, null, null, null, null, '0', null, '001005001005', '1', '参考咨询部', '42209', 't');
INSERT INTO "public"."sys_organization" VALUES ('42217', null, null, null, null, null, '0', null, '001006001', '1', '现代动画技术吉林省高等学校工程研究中心', '42016', 't');
INSERT INTO "public"."sys_organization" VALUES ('42218', null, null, null, null, null, '0', null, '001006002', '1', '游戏与互动媒体技术吉林省高等学校工程研究中心', '42016', 't');
INSERT INTO "public"."sys_organization" VALUES ('42219', null, null, null, null, null, '0', null, '001006003', '1', '动画研究院', '42016', 't');
INSERT INTO "public"."sys_organization" VALUES ('42220', null, null, null, null, null, '0', null, '001006004', '1', '文化产业研究院', '42016', 't');
INSERT INTO "public"."sys_organization" VALUES ('42221', null, null, null, null, null, '0', null, '001007001', '1', '吉林纪元时空动漫游戏科技集团股份公司', '42017', 't');
INSERT INTO "public"."sys_organization" VALUES ('42222', null, null, null, null, null, '0', null, '001007003', '1', '吉林天博影视制作股份有限公司', '42017', 't');
INSERT INTO "public"."sys_organization" VALUES ('42223', null, null, null, null, null, '0', null, '001007002', '1', '吉林禹硕影视传媒股份有限公司', '42017', 't');
INSERT INTO "public"."sys_organization" VALUES ('42224', null, null, null, null, null, '0', null, '001007004', '1', '吉林文创动漫游戏产业园管理有限公司', '42017', 't');
INSERT INTO "public"."sys_organization" VALUES ('42225', null, null, null, null, null, '0', null, '001007005', '1', '吉林炫通网络科技股份有限公司', '42017', 't');
INSERT INTO "public"."sys_organization" VALUES ('42226', null, null, null, null, null, '0', null, '001007006', '1', '吉林盘古广告有限公司', '42017', 't');
INSERT INTO "public"."sys_organization" VALUES ('42227', null, null, null, null, null, '0', null, '001007007', '1', '吉林华品科技股份有限公司', '42017', 't');
INSERT INTO "public"."sys_organization" VALUES ('42228', null, null, null, null, null, '0', null, '001007008', '1', '吉林纪元时空动漫游戏科技集团股份有限公司北京分公司', '42017', 't');
INSERT INTO "public"."sys_organization" VALUES ('42229', null, null, null, null, null, '0', null, '001008001', '1', '动画平台', '42018', 't');
INSERT INTO "public"."sys_organization" VALUES ('42230', null, null, null, null, null, '0', null, '001008002', '1', '漫画平台', '42018', 't');
INSERT INTO "public"."sys_organization" VALUES ('42231', null, null, null, null, null, '0', null, '001008003', '1', '游戏平台', '42018', 't');
INSERT INTO "public"."sys_organization" VALUES ('42232', null, null, null, null, null, '0', null, '001008004', '1', '电影平台', '42018', 't');
INSERT INTO "public"."sys_organization" VALUES ('42233', null, null, null, null, null, '0', null, '001008005', '1', '设计平台', '42018', 't');
INSERT INTO "public"."sys_organization" VALUES ('42234', null, null, null, null, null, '0', null, '001008006', '1', '广告平台', '42018', 't');
INSERT INTO "public"."sys_organization" VALUES ('42235', null, null, null, null, null, '0', null, '001008007', '1', '电视与网络新媒体平台', '42018', 't');
INSERT INTO "public"."sys_organization" VALUES ('42236', null, null, null, null, null, '0', null, '001008008', '1', '文化产业管理平台', '42018', 't');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table sys_organization
-- ----------------------------
ALTER TABLE "public"."sys_organization" ADD PRIMARY KEY ("id");
