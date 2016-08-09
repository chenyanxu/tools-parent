/*
Navicat PGSQL Data Transfer

Source Server         : sunlf
Source Server Version : 90404
Source Host           : localhost:5432
Source Database       : kalix
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90404
File Encoding         : 65001

Date: 2016-05-27 10:19:48
*/


-- ----------------------------
-- Table structure for oa_category
-- ----------------------------
DROP TABLE IF EXISTS "public"."oa_category";
CREATE TABLE "public"."oa_category" (
"id" int8 NOT NULL,
"createby" varchar(255) COLLATE "default",
"creationdate" timestamp(6),
"updateby" varchar(255) COLLATE "default",
"updatedate" timestamp(6),
"version_" int8,
"description" varchar(255) COLLATE "default",
"icon" varchar(255) COLLATE "default",
"key" varchar(255) COLLATE "default",
"name" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of oa_category
-- ----------------------------
INSERT INTO "public"."oa_category" VALUES ('45713', null, '2016-05-24 16:10:22', null, '2016-05-27 09:53:51.682', '2', '人事相关流程', 'x-fa fa-male', 'person', '人事类');
INSERT INTO "public"."oa_category" VALUES ('45714', null, '2016-05-24 16:11:53', null, '2016-05-27 10:00:53.773', '3', '项目相关流程', 'x-fa fa-columns', 'project', '项目类');
INSERT INTO "public"."oa_category" VALUES ('45715', null, '2016-05-24 16:08:42', null, '2016-05-27 10:03:40.929', '2', '行政相关流程', 'x-fa fa-building', 'admin', '行政类');
INSERT INTO "public"."oa_category" VALUES ('45716', null, '2016-05-24 16:12:19', null, '2016-05-27 09:59:13.583', '3', '库存相关流程', 'x-fa fa-inbox', 'stock', '库存类');
INSERT INTO "public"."oa_category" VALUES ('45717', null, '2016-05-24 16:13:49', null, '2016-05-27 09:58:25.59', '2', '绩效相关流程', 'x-fa fa-line-chart', 'performance', '绩效类');
INSERT INTO "public"."oa_category" VALUES ('45718', null, '2016-05-24 16:14:29', null, '2016-05-27 09:57:27.7', '2', '公文相关流程', 'x-fa fa-tablet', 'doc', '公文类');
INSERT INTO "public"."oa_category" VALUES ('45719', null, '2016-05-24 16:15:53', null, '2016-05-27 10:01:57.479', '3', '采购相关流程', 'x-fa fa-shopping-cart', 'purchase', '采购类');
INSERT INTO "public"."oa_category" VALUES ('45720', null, '2016-05-24 16:17:19', null, '2016-05-27 09:56:46.804', '3', '合同相关流程', 'x-fa fa-ticket', 'contract', '合同类');
INSERT INTO "public"."oa_category" VALUES ('45721', null, '2016-05-24 16:18:37', null, '2016-05-27 09:52:52.424', '2', '费用相关流程', 'x-fa fa-money', 'fee', '费用类');
INSERT INTO "public"."oa_category" VALUES ('45722', null, '2016-05-24 16:09:04', null, '2016-05-27 09:55:56.616', '2', '后勤相关流程', 'x-fa fa-support', 'rear', '后勤类');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table oa_category
-- ----------------------------
ALTER TABLE "public"."oa_category" ADD PRIMARY KEY ("id");
