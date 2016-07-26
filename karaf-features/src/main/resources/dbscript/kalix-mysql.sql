/*
SQLyog Enterprise - MySQL GUI v6.0
Host - 5.0.90-community-nt : Database - kalix
*********************************************************************
Server version : 5.0.90-community-nt
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `kalix`;

USE `kalix`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `openjpaseq` */

DROP TABLE IF EXISTS `openjpaseq`;

CREATE TABLE `openjpaseq` (
  `ID` tinyint(4) NOT NULL,
  `SEQUENCE_VALUE` bigint(20) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `openjpaseq` */

insert  into `openjpaseq`(`ID`,`SEQUENCE_VALUE`) values (0,15701);

/*Table structure for table `sys_about` */

DROP TABLE IF EXISTS `sys_about`;

CREATE TABLE `sys_about` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `code` varchar(255) default NULL,
  `jd` varchar(255) default NULL,
  `systemName` varchar(255) default NULL,
  `systemVersion` varchar(255) default NULL,
  `userName` varchar(255) default NULL,
  `wd` varchar(255) default NULL,
  `xzqh_dm` varchar(255) default NULL,
  `version_` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_about` */

/*Table structure for table `sys_application` */

DROP TABLE IF EXISTS `sys_application`;

CREATE TABLE `sys_application` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `code` varchar(255) default NULL,
  `location` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  `version_` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_application` */

insert  into `sys_application`(`id`,`createBy`,`creationDate`,`updateBy`,`updateDate`,`code`,`location`,`name`,`remark`,`version_`) values (7901,NULL,'2015-08-14 09:02:40','管理员2','2015-08-14 09:02:40','admin','','系统应用','顶部导航栏',16),(12501,'管理员2','2015-08-14 09:02:44','管理员2','2015-08-14 09:02:44','test','','测试应用','',5);

/*Table structure for table `sys_area` */

DROP TABLE IF EXISTS `sys_area`;

CREATE TABLE `sys_area` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `centerCode` varchar(255) default NULL,
  `code` varchar(255) default NULL,
  `jd` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `parentId` bigint(20) default NULL,
  `parentIds` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `wd` varchar(255) default NULL,
  `version_` bigint(20) default NULL,
  `isLeaf` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_area` */

insert  into `sys_area`(`id`,`createBy`,`creationDate`,`updateBy`,`updateDate`,`centerCode`,`code`,`jd`,`name`,`parentId`,`parentIds`,`type`,`wd`,`version_`,`isLeaf`) values (1,NULL,'2015-07-30 16:22:49','管理员','2015-07-30 16:22:49','22','22','','吉林省',-1,NULL,NULL,'',4,0),(2,NULL,'2015-07-30 14:37:36','管理员','2015-07-30 14:37:36','220101','220101','','市辖区',12,NULL,NULL,'',2,1),(3,NULL,NULL,'fdad2222','2015-07-24 16:06:29','220102','220102','','南关区',12,NULL,NULL,'',2,1),(4,NULL,NULL,NULL,NULL,NULL,'220103',NULL,'宽城区',12,NULL,NULL,NULL,1,1),(5,NULL,NULL,NULL,NULL,NULL,'220104',NULL,'朝阳区',12,NULL,NULL,NULL,1,1),(6,NULL,NULL,NULL,NULL,NULL,'220105',NULL,'二道区',12,NULL,NULL,NULL,1,1),(7,NULL,NULL,NULL,NULL,NULL,'220106',NULL,'绿园区',12,NULL,NULL,NULL,1,1),(8,NULL,NULL,NULL,NULL,NULL,'220112',NULL,'双阳区',12,NULL,NULL,NULL,1,1),(9,NULL,NULL,NULL,NULL,NULL,'220113',NULL,'经济技术开发区',12,NULL,NULL,NULL,1,1),(10,NULL,NULL,NULL,NULL,NULL,'220114',NULL,'高新技术开发区',12,NULL,NULL,NULL,1,1),(11,NULL,NULL,NULL,NULL,NULL,'220115',NULL,'净月旅游开发区',12,NULL,NULL,NULL,1,1),(12,NULL,'2015-07-30 16:22:26','张三','2015-07-30 16:22:26','2201','2201','','长春市',1,NULL,NULL,'',6,0),(13,NULL,NULL,NULL,NULL,NULL,'2202',NULL,'吉林市',1,NULL,NULL,NULL,1,0),(14,NULL,NULL,NULL,NULL,NULL,'2203','124.356312','四平市',1,NULL,NULL,'43.17279',1,0),(15,NULL,NULL,NULL,NULL,NULL,'2204','125.123912','辽源市',1,NULL,NULL,'42.924993',1,0),(16,NULL,NULL,NULL,NULL,NULL,'2205',NULL,'通化市',1,NULL,NULL,NULL,1,0),(17,NULL,NULL,NULL,NULL,NULL,'2206',NULL,'白山市',1,NULL,NULL,NULL,1,0),(18,NULL,NULL,NULL,NULL,NULL,'2207',NULL,'松原市',1,NULL,NULL,NULL,1,0),(19,NULL,NULL,NULL,NULL,NULL,'2208','122.846239','白城市',1,NULL,NULL,'45.626834',1,0),(20,NULL,NULL,NULL,NULL,NULL,'2224','129.516947','延边朝鲜族自治州',1,NULL,NULL,'43.508571',1,0),(21,NULL,NULL,NULL,NULL,NULL,'2222',NULL,'长白山管委会',1,NULL,NULL,NULL,1,0),(22,NULL,NULL,NULL,NULL,NULL,'220116',NULL,'汽车产业开发区',12,NULL,NULL,NULL,1,1),(23,NULL,NULL,NULL,NULL,NULL,'220122',NULL,'农安县',12,NULL,NULL,NULL,1,1),(24,NULL,NULL,NULL,NULL,NULL,'220181',NULL,'九台市',12,NULL,NULL,NULL,1,1),(25,NULL,NULL,NULL,NULL,NULL,'220182',NULL,'榆树市',12,NULL,NULL,NULL,1,1),(26,NULL,NULL,NULL,NULL,NULL,'220183',NULL,'德惠市',12,NULL,NULL,NULL,1,1),(27,NULL,NULL,NULL,NULL,NULL,'220201',NULL,'市辖区',13,NULL,NULL,NULL,1,1),(28,NULL,NULL,NULL,NULL,NULL,'220202',NULL,'昌邑区',13,NULL,NULL,NULL,1,1),(29,NULL,NULL,NULL,NULL,NULL,'220203',NULL,'龙潭区',13,NULL,NULL,NULL,1,1),(30,NULL,NULL,NULL,NULL,NULL,'220204',NULL,'船营区',13,NULL,NULL,NULL,1,1),(31,NULL,NULL,NULL,NULL,NULL,'220211',NULL,'丰满区',13,NULL,NULL,NULL,1,1),(32,NULL,NULL,NULL,NULL,NULL,'220212',NULL,'经济技术开发区',13,NULL,NULL,NULL,1,1),(33,NULL,NULL,NULL,NULL,NULL,'220213',NULL,'高新技术开发区',13,NULL,NULL,NULL,1,1),(34,NULL,NULL,NULL,NULL,NULL,'220214',NULL,'北大壶开发区',13,NULL,NULL,NULL,1,1),(35,NULL,NULL,NULL,NULL,NULL,'220221',NULL,'永吉县',13,NULL,NULL,NULL,1,1),(36,NULL,NULL,NULL,NULL,NULL,'220281',NULL,'蛟河市',13,NULL,NULL,NULL,1,1),(37,NULL,NULL,NULL,NULL,NULL,'220282',NULL,'桦甸市',13,NULL,NULL,NULL,1,1),(38,NULL,NULL,NULL,NULL,NULL,'220283',NULL,'舒兰市',13,NULL,NULL,NULL,1,1),(39,NULL,NULL,NULL,NULL,NULL,'220284',NULL,'磐石市',13,NULL,NULL,NULL,1,1),(40,NULL,NULL,NULL,NULL,NULL,'220301',NULL,'市辖区',14,NULL,NULL,NULL,1,1),(41,NULL,NULL,NULL,NULL,NULL,'220302',NULL,'铁西区',14,NULL,NULL,NULL,1,1),(42,NULL,NULL,NULL,NULL,NULL,'220303',NULL,'铁东区',14,NULL,NULL,NULL,1,1),(43,NULL,NULL,NULL,NULL,NULL,'220304',NULL,'经济开发区',14,NULL,NULL,NULL,1,1),(44,NULL,NULL,NULL,NULL,NULL,'220305',NULL,'辽河农垦管理区',14,NULL,NULL,NULL,1,1),(45,NULL,NULL,NULL,NULL,NULL,'220322',NULL,'梨树县',14,NULL,NULL,NULL,1,1),(46,NULL,NULL,NULL,NULL,NULL,'220323',NULL,'伊通满族自治县',14,NULL,NULL,NULL,1,1),(47,NULL,NULL,NULL,NULL,NULL,'220381','124.685882','公主岭市',14,NULL,NULL,'43.791826',1,1),(48,NULL,NULL,NULL,NULL,NULL,'220382','123.708520','双辽市',14,NULL,NULL,'43.767694',1,1),(49,NULL,NULL,NULL,NULL,NULL,'220401',NULL,'市辖区',15,NULL,NULL,NULL,1,1),(50,NULL,NULL,NULL,NULL,NULL,'220402',NULL,'龙山区',15,NULL,NULL,NULL,1,1),(51,NULL,NULL,NULL,NULL,NULL,'220403',NULL,'西安区',15,NULL,NULL,NULL,1,1),(52,NULL,NULL,NULL,NULL,NULL,'220404',NULL,'经济开发区',15,NULL,NULL,NULL,1,1),(53,NULL,NULL,NULL,NULL,NULL,'220421',NULL,'东丰县',15,NULL,NULL,NULL,1,1),(54,NULL,NULL,NULL,NULL,NULL,'220422',NULL,'东辽县',15,NULL,NULL,NULL,1,1),(55,NULL,NULL,NULL,NULL,NULL,'220501',NULL,'市辖区',16,NULL,NULL,NULL,1,1),(56,NULL,NULL,NULL,NULL,NULL,'220502',NULL,'东昌区',16,NULL,NULL,NULL,1,1),(57,NULL,NULL,NULL,NULL,NULL,'220503',NULL,'二道江区',16,NULL,NULL,NULL,1,1),(58,NULL,NULL,NULL,NULL,NULL,'220504',NULL,'医药高新区',16,NULL,NULL,NULL,1,1),(59,NULL,NULL,NULL,NULL,NULL,'220521',NULL,'通化县',16,NULL,NULL,NULL,1,1),(60,NULL,NULL,NULL,NULL,NULL,'220523',NULL,'辉南县',16,NULL,NULL,NULL,1,1),(61,NULL,NULL,NULL,NULL,NULL,'220524',NULL,'柳河县',16,NULL,NULL,NULL,1,1),(62,NULL,NULL,NULL,NULL,NULL,'220581',NULL,'梅河口市',16,NULL,NULL,NULL,1,1),(63,NULL,NULL,NULL,NULL,NULL,'220582',NULL,'集安市',16,NULL,NULL,NULL,1,1),(64,NULL,NULL,NULL,NULL,NULL,'220601',NULL,'市辖区',17,NULL,NULL,NULL,1,1),(65,NULL,NULL,NULL,NULL,NULL,'220602',NULL,'浑江区',17,NULL,NULL,NULL,1,1),(66,NULL,NULL,NULL,NULL,NULL,'220604',NULL,'江源区',17,NULL,NULL,NULL,1,1),(67,NULL,NULL,NULL,NULL,NULL,'220605',NULL,'经济开发区',17,NULL,NULL,NULL,1,1),(68,NULL,NULL,NULL,NULL,NULL,'220621',NULL,'抚松县',17,NULL,NULL,NULL,1,1),(69,NULL,NULL,NULL,NULL,NULL,'220622',NULL,'靖宇县',17,NULL,NULL,NULL,1,1),(70,NULL,NULL,NULL,NULL,NULL,'220623',NULL,'长白朝鲜族自治县',17,NULL,NULL,NULL,1,1),(71,NULL,NULL,NULL,NULL,NULL,'220625',NULL,'江源县',17,NULL,NULL,NULL,1,1),(72,NULL,NULL,NULL,NULL,NULL,'220681',NULL,'临江市',17,NULL,NULL,NULL,1,1),(73,NULL,NULL,NULL,NULL,NULL,'220701',NULL,'市辖区',18,NULL,NULL,NULL,1,1),(74,NULL,NULL,NULL,NULL,NULL,'220702',NULL,'宁江区',18,NULL,NULL,NULL,1,1),(75,NULL,NULL,NULL,NULL,NULL,'220721',NULL,'前郭尔罗斯蒙古族自治',18,NULL,NULL,NULL,1,1),(76,NULL,NULL,NULL,NULL,NULL,'220722',NULL,'长岭县',18,NULL,NULL,NULL,1,1),(77,NULL,NULL,NULL,NULL,NULL,'220723',NULL,'乾安县',18,NULL,NULL,NULL,1,1),(78,NULL,NULL,NULL,NULL,NULL,'220724',NULL,'扶余市',18,NULL,NULL,NULL,1,1),(79,NULL,NULL,NULL,NULL,NULL,'220725',NULL,'经济开发区',18,NULL,NULL,NULL,1,1),(80,NULL,NULL,NULL,NULL,NULL,'220726',NULL,'石油化学工业循环经济',18,NULL,NULL,NULL,1,1),(81,NULL,NULL,NULL,NULL,NULL,'220801',NULL,'市辖区',19,NULL,NULL,NULL,1,1),(82,NULL,NULL,NULL,NULL,NULL,'220802','122.842671','洮北区',19,NULL,NULL,'45.626718',1,1),(83,NULL,NULL,NULL,NULL,NULL,'220803',NULL,'查干浩特旅游开发区',19,NULL,NULL,NULL,1,1),(84,NULL,NULL,NULL,NULL,NULL,'220804',NULL,'经济开发区',19,NULL,NULL,NULL,1,1),(85,NULL,NULL,NULL,NULL,NULL,'220821',NULL,'镇赉县',19,NULL,NULL,NULL,1,1),(86,NULL,NULL,NULL,NULL,NULL,'220822',NULL,'通榆县',19,NULL,NULL,NULL,1,1),(87,NULL,NULL,NULL,NULL,NULL,'220881',NULL,'洮南市',19,NULL,NULL,NULL,1,1),(88,NULL,NULL,NULL,NULL,NULL,'220882',NULL,'大安市',19,NULL,NULL,NULL,1,1),(89,NULL,NULL,NULL,NULL,NULL,'222201',NULL,'池西区',21,NULL,NULL,NULL,1,1),(90,NULL,NULL,NULL,NULL,NULL,'222202',NULL,'池北区',21,NULL,NULL,NULL,1,1),(91,NULL,NULL,NULL,NULL,NULL,'222203',NULL,'池南区',21,NULL,NULL,NULL,1,1),(92,NULL,NULL,NULL,NULL,NULL,'222401',NULL,'延吉市',20,NULL,NULL,NULL,1,1),(93,NULL,NULL,NULL,NULL,NULL,'222402',NULL,'图们市',20,NULL,NULL,NULL,1,1),(94,NULL,NULL,NULL,NULL,NULL,'222403',NULL,'敦化市',20,NULL,NULL,NULL,1,1),(95,NULL,NULL,NULL,NULL,NULL,'222404',NULL,'珲春市',20,NULL,NULL,NULL,1,1),(96,NULL,NULL,NULL,NULL,NULL,'222405','129.383816','龙井市',20,NULL,NULL,'42.844249',1,1),(97,NULL,NULL,NULL,NULL,NULL,'222406','128.911210','和龙市',20,NULL,NULL,'42.466442',1,1),(98,NULL,NULL,NULL,NULL,NULL,'222424',NULL,'汪清县',20,NULL,NULL,NULL,1,1),(99,NULL,NULL,NULL,NULL,NULL,'222426','128.90089','安图县',20,NULL,NULL,'43.118108',1,1);

/*Table structure for table `sys_demo` */

DROP TABLE IF EXISTS `sys_demo`;

CREATE TABLE `sys_demo` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `currentNode` varchar(255) default NULL,
  `processInstanceId` varchar(255) default NULL,
  `status` smallint(6) default NULL,
  `content` varchar(255) default NULL,
  `publishDate` datetime default NULL,
  `publishPeople` varchar(255) default NULL,
  `text` varchar(255) default NULL,
  `version_` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_demo` */

insert  into `sys_demo`(`id`,`createBy`,`creationDate`,`updateBy`,`updateDate`,`currentNode`,`processInstanceId`,`status`,`content`,`publishDate`,`publishPeople`,`text`,`version_`) values (10401,NULL,'2015-08-05 17:03:07',NULL,'2015-08-06 10:51:13','符合性审批','22501',1,'1',NULL,NULL,'1',8),(10402,NULL,'2015-08-03 11:03:42',NULL,'2015-08-03 11:03:50','符合性审批','2507',1,'xzdz',NULL,NULL,'s',2),(10501,NULL,'2015-08-03 11:21:58',NULL,'2015-08-03 11:39:33','符合性审批','5019',1,'asd',NULL,NULL,'asd',2),(10502,NULL,'2015-08-03 11:52:29',NULL,'2015-08-03 11:52:31','符合性审批','5025',1,'222',NULL,NULL,'测试',2),(10503,NULL,'2015-08-03 11:53:17',NULL,'2015-08-03 11:53:17',NULL,NULL,0,'ds',NULL,NULL,'ds',1),(11601,NULL,'2015-08-05 14:26:30',NULL,'2015-08-05 15:33:11','颁发证件','12501',1,'112',NULL,NULL,'1212',6),(11701,NULL,'2015-08-05 15:33:32',NULL,'2015-08-05 15:39:41','颁发证件','15028',1,'22',NULL,NULL,'22',6),(11702,NULL,'2015-08-05 15:39:50',NULL,'2015-08-05 15:46:41','颁发证件','15054',1,'33',NULL,NULL,'33',6),(11703,NULL,'2015-08-11 15:14:24',NULL,'2015-08-11 15:14:24','','15080',2,'5',NULL,NULL,'5',8),(11704,NULL,'2015-08-05 16:13:30',NULL,'2015-08-05 16:35:23','局长审批','15112',1,'456',NULL,NULL,'456',5),(11705,NULL,'2015-08-06 11:31:04',NULL,'2015-08-06 11:31:04','符合性审批','15128',1,'修改了',NULL,NULL,'8',25),(11801,NULL,'2015-08-06 10:36:58',NULL,'2015-08-06 10:37:00','符合性审批','20001',1,'44',NULL,NULL,'44',2),(11901,NULL,'2015-08-06 11:46:52',NULL,'2015-08-06 11:46:52','','25003',2,'通过',NULL,NULL,'测试通过',8),(12301,NULL,'2015-08-11 14:45:03',NULL,'2015-08-11 14:45:03','','27501',2,'sssss',NULL,NULL,'ssss',8);

/*Table structure for table `sys_department` */

DROP TABLE IF EXISTS `sys_department`;

CREATE TABLE `sys_department` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `centerCode` varchar(255) default NULL,
  `code` varchar(255) default NULL,
  `isLeaf` int(11) default NULL,
  `name` varchar(255) default NULL,
  `orgId` int(11) default NULL,
  `parentId` bigint(20) default NULL,
  `version_` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_department` */

insert  into `sys_department`(`id`,`createBy`,`creationDate`,`updateBy`,`updateDate`,`centerCode`,`code`,`isLeaf`,`name`,`orgId`,`parentId`,`version_`) values (4601,'fdad2222','2015-07-24 16:58:16','fdad2222','2015-07-24 16:58:16','010101','010101',1,'办事处一部',4501,-1,1),(6801,'管理员','2015-07-29 13:29:53','管理员','2015-07-31 11:19:39','020202','020202',0,'办事处二部',4501,-1,12),(9501,'管理员','2015-07-31 11:19:39','管理员','2015-07-31 11:19:42','1','1',1,'1',4501,6801,2),(10801,'管理员2','2015-08-03 15:41:34','管理员2','2015-08-03 15:41:34','2','2',1,'2',4501,6801,1),(10802,'管理员2','2015-08-03 15:41:37','管理员2','2015-08-03 15:41:37','2','3',1,'3',4501,6801,1),(10803,'管理员2','2015-08-03 15:41:39','管理员2','2015-08-03 15:41:39','2','4',1,'4',4501,6801,1),(10804,'管理员2','2015-08-03 15:41:41','管理员2','2015-08-03 15:41:41','2','5',1,'5',4501,6801,1),(10805,'管理员2','2015-08-03 15:41:43','管理员2','2015-08-03 15:41:43','2','6',1,'6',4501,6801,1),(10806,'管理员2','2015-08-03 15:41:46','管理员2','2015-08-03 15:41:46','2','7',1,'7',4501,6801,1),(10807,'管理员2','2015-08-03 15:41:48','管理员2','2015-08-03 15:41:48','2','8',1,'8',4501,6801,1),(10808,'管理员2','2015-08-03 15:41:50','管理员2','2015-08-03 15:41:50','2','9',1,'9',4501,6801,1),(10809,'管理员2','2015-08-03 15:41:53','管理员2','2015-08-03 15:41:53','2','10',1,'10',4501,6801,1),(10810,'管理员2','2015-08-03 15:41:57','管理员2','2015-08-03 15:41:57','2','11',1,'11',4501,6801,1),(10811,'管理员2','2015-08-03 15:53:47','管理员2','2015-08-03 15:53:47','12','12',1,'12',4501,6801,1),(10812,'管理员2','2015-08-03 15:53:49','管理员2','2015-08-03 15:53:49','12','13',1,'13',4501,6801,1),(10813,'管理员2','2015-08-03 15:53:51','管理员2','2015-08-03 15:53:51','12','14',1,'14',4501,6801,1),(10814,'管理员2','2015-08-03 15:53:54','管理员2','2015-08-03 15:53:54','12','16',1,'16',4501,6801,1),(10815,'管理员2','2015-08-03 15:53:58','管理员2','2015-08-03 15:53:58','12','17',1,'17',4501,6801,1),(10816,'管理员2','2015-08-03 15:54:01','管理员2','2015-08-03 15:54:01','12','18',1,'18',4501,6801,1),(10817,'管理员2','2015-08-03 15:54:03','管理员2','2015-08-03 15:54:03','12','19',1,'19',4501,6801,1),(10818,'管理员2','2015-08-03 15:54:07','管理员2','2015-08-03 15:54:07','12','20',1,'20',4501,6801,1),(10819,'管理员2','2015-08-03 15:54:09','管理员2','2015-08-03 15:54:09','12','21',1,'21',4501,6801,1),(10820,'管理员2','2015-08-03 15:54:12','管理员2','2015-08-03 15:54:12','12','22',1,'22',4501,6801,1),(10821,'管理员2','2015-08-03 15:54:14','管理员2','2015-08-03 15:54:14','12','23',1,'23',4501,6801,1),(10822,'管理员2','2015-08-03 15:54:21','管理员2','2015-08-03 15:54:21','24','24',1,'24',4501,6801,1),(10823,'管理员2','2015-08-03 15:54:24','管理员2','2015-08-03 15:54:24','24','25',1,'25',4501,6801,1),(10824,'管理员2','2015-08-03 15:54:28','管理员2','2015-08-03 15:54:28','24','623',1,'26',4501,6801,1),(10825,'管理员2','2015-08-03 15:54:31','管理员2','2015-08-03 15:54:31','24','27',1,'27',4501,6801,1),(10826,'管理员2','2015-08-03 15:54:34','管理员2','2015-08-03 15:54:34','24','28',1,'28',4501,6801,1),(10827,'管理员2','2015-08-03 15:54:36','管理员2','2015-08-03 15:54:36','24','29',1,'29',4501,6801,1);

/*Table structure for table `sys_department_user` */

DROP TABLE IF EXISTS `sys_department_user`;

CREATE TABLE `sys_department_user` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `depId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `version_` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_department_user` */

insert  into `sys_department_user`(`id`,`createBy`,`creationDate`,`updateBy`,`updateDate`,`depId`,`userId`,`version_`) values (7810,'管理员','2015-07-29 17:16:56','管理员','2015-07-29 17:16:56',4601,5601,1),(7811,'管理员','2015-07-29 17:16:56','管理员','2015-07-29 17:16:56',4601,108,1),(7812,'管理员','2015-07-29 17:16:56','管理员','2015-07-29 17:16:56',4601,109,1),(9806,'管理员','2015-07-31 14:42:37','管理员','2015-07-31 14:42:37',6801,7001,1),(9807,'管理员','2015-07-31 14:42:37','管理员','2015-07-31 14:42:37',6801,8301,1);

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `description` varchar(255) default NULL,
  `label` varchar(255) default NULL,
  `sort` int(11) default NULL,
  `type` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  `version_` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`createBy`,`creationDate`,`updateBy`,`updateDate`,`description`,`label`,`sort`,`type`,`value`,`version_`) values (1001,NULL,'2015-07-10 13:21:44',NULL,'2015-07-10 13:21:44','性别','男',1,'sex','1',3),(1101,NULL,'2015-07-23 15:52:06','fdad2222','2015-07-23 15:52:06','233333','女',2,'sex','1',7),(2901,NULL,'2015-07-30 16:03:00','张三','2015-07-30 16:03:00','3','3',3,'3','3',3);

/*Table structure for table `sys_function` */

DROP TABLE IF EXISTS `sys_function`;

CREATE TABLE `sys_function` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `applicationId` int(11) default NULL,
  `code` varchar(255) default NULL,
  `isLeaf` int(11) default NULL,
  `name` varchar(255) default NULL,
  `parentId` bigint(20) default NULL,
  `remark` varchar(255) default NULL,
  `version_` bigint(20) default NULL,
  `permission` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_function` */

insert  into `sys_function`(`id`,`createBy`,`creationDate`,`updateBy`,`updateDate`,`applicationId`,`code`,`isLeaf`,`name`,`parentId`,`remark`,`version_`,`permission`) values (13701,'管理员2','2015-08-13 09:38:36','管理员2','2015-08-14 09:02:41',7901,'sysModule',0,'系统管理',-1,'系统管理模块',18,'admin:sysModule'),(13702,'管理员2','2015-08-13 09:49:51','管理员2','2015-08-14 09:02:41',7901,'permissionControl',0,'权限控制',13701,'权限控制模块',10,'admin:sysModule:permissionControl'),(13703,'管理员2','2015-08-13 10:15:46','管理员2','2015-08-14 09:02:41',7901,'userMenu',0,'用户管理',13702,'用户菜单',7,'admin:sysModule:permissionControl:userMenu'),(13704,'管理员2','2015-08-13 10:17:18','管理员2','2015-08-14 09:02:41',7901,'roleMenu',1,'角色管理',13702,'角色菜单',3,'admin:sysModule:permissionControl:roleMenu'),(13705,'管理员2','2015-08-13 10:17:33','管理员2','2015-08-14 09:02:41',7901,'workGroupMenu',1,'工作组管理',13702,'工作组菜单',3,'admin:sysModule:permissionControl:workGroupMenu'),(13706,'管理员2','2015-08-13 10:22:45','管理员2','2015-08-14 09:02:41',7901,'applicationMenu',1,'应用管理',13702,'应用菜单',3,'admin:sysModule:permissionControl:applicationMenu'),(13707,'管理员2','2015-08-13 10:23:00','管理员2','2015-08-14 09:02:41',7901,'functionMenu',1,'功能管理',13702,'功能菜单',3,'admin:sysModule:permissionControl:functionMenu'),(13708,'管理员2','2015-08-13 10:35:04','管理员2','2015-08-14 09:02:41',7901,'systemConstantMenu',0,'系统常量',13701,'系统常量菜单',4,'admin:sysModule:systemConstantMenu'),(13709,'管理员2','2015-08-13 10:35:19','管理员2','2015-08-14 09:02:41',7901,'organizationMenu',1,'机构管理',13708,'机构菜单',3,'admin:sysModule:systemConstantMenu:organizationMenu'),(13710,'管理员2','2015-08-13 10:35:37','管理员2','2015-08-14 09:02:41',7901,'dictMenu',1,'字典管理',13708,'字典菜单',3,'admin:sysModule:systemConstantMenu:dictMenu'),(13711,'管理员2','2015-08-13 10:35:48','管理员2','2015-08-14 09:02:42',7901,'departmentMenu',1,'部门管理',13708,'部门菜单',3,'admin:sysModule:systemConstantMenu:departmentMenu'),(13712,'管理员2','2015-08-13 10:35:59','管理员2','2015-08-14 09:02:42',7901,'areaMenu',1,'区域管理',13708,'区域菜单',3,'admin:sysModule:systemConstantMenu:areaMenu'),(13713,'管理员2','2015-08-13 10:37:43','管理员2','2015-08-14 09:02:44',12501,'demoWorkFlowModule',0,'流程管理',-1,'流程管理模块',4,'test:demoWorkFlowModule'),(13714,'管理员2','2015-08-13 10:38:28','管理员2','2015-08-14 09:02:44',12501,'demoWorkFlowMenu',0,'流程演示',13713,'流程演示菜单',4,'test:demoWorkFlowModule:demoWorkFlowMenu'),(13715,'管理员2','2015-08-13 10:39:10','管理员2','2015-08-14 09:02:44',12501,'noticeMenu',1,'流程演示管理',13714,'流程演示管理菜单',3,'test:demoWorkFlowModule:demoWorkFlowMenu:noticeMenu'),(13716,'管理员2','2015-08-13 10:39:47','管理员2','2015-08-14 09:02:44',12501,'taskMenu',1,'待办任务列表',13714,'待办任务列表菜单',3,'test:demoWorkFlowModule:demoWorkFlowMenu:taskMenu'),(13717,'管理员2','2015-08-13 10:40:22','管理员2','2015-08-14 09:02:44',12501,'processHistoryMenu',1,'流程历史列表',13714,'流程历史列表菜单',3,'test:demoWorkFlowModule:demoWorkFlowMenu:processHistoryMenu'),(13718,'管理员2','2015-08-13 10:40:48','管理员2','2015-08-14 09:02:45',12501,'processDefinitionMenu',1,'流程定义管理',13714,'流程定义管理菜单',3,'test:demoWorkFlowModule:demoWorkFlowMenu:processDefinitionMenu'),(14501,'管理员2','2015-08-13 16:49:24','管理员2','2015-08-14 09:02:42',7901,'add',1,'新增',13703,'',2,'admin:sysModule:permissionControl:userMenu:add'),(14801,'管理员2','2015-08-14 11:22:02','管理员2','2015-08-14 13:59:31',7901,'read',1,'查看',13703,'查看',3,'admin:sysModule:permissionControl:userMenu:read'),(15101,'管理员2','2015-08-17 11:03:16','管理员2','2015-08-17 11:03:42',7901,'update',1,'修改',13703,'修改',2,'admin:sysModule:permissionControl:userMenu:update'),(15102,'管理员2','2015-08-17 11:03:30','管理员2','2015-08-17 11:03:49',7901,'delete',1,'删除',13703,'删除',2,'admin:sysModule:permissionControl:userMenu:delete');

/*Table structure for table `sys_message` */

DROP TABLE IF EXISTS `sys_message`;

CREATE TABLE `sys_message` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `message` varchar(255) default NULL,
  `sender` varchar(255) default NULL,
  `status` int(11) default NULL,
  `text` varchar(255) default NULL,
  `userId` bigint(20) default NULL,
  `version_` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_message` */

/*Table structure for table `sys_office` */

DROP TABLE IF EXISTS `sys_office`;

CREATE TABLE `sys_office` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `address` varchar(255) default NULL,
  `code` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `grade` varchar(255) default NULL,
  `master` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `parentIds` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `zipCode` varchar(255) default NULL,
  `version_` bigint(20) default NULL,
  `area_id` bigint(20) default NULL,
  `parent_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `I_SYS_FFC_AREABEAN` (`area_id`),
  KEY `I_SYS_FFC_PARENT` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_office` */

/*Table structure for table `sys_organization` */

DROP TABLE IF EXISTS `sys_organization`;

CREATE TABLE `sys_organization` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `areaId` int(11) default NULL,
  `centerCode` varchar(255) default NULL,
  `code` varchar(255) default NULL,
  `isLeaf` int(11) default NULL,
  `name` varchar(255) default NULL,
  `parentId` bigint(20) default NULL,
  `version_` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_organization` */

insert  into `sys_organization`(`id`,`createBy`,`creationDate`,`updateBy`,`updateDate`,`areaId`,`centerCode`,`code`,`isLeaf`,`name`,`parentId`,`version_`) values (4501,'fdad2222','2015-07-24 16:57:59','管理员','2015-07-31 11:40:37',1,'0101','0101',1,'吉林省办事处',-1,17);

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `href` varchar(255) default NULL,
  `icon` varchar(255) default NULL,
  `isShow` bit(1) default NULL,
  `name` varchar(255) default NULL,
  `parentIds` varchar(255) default NULL,
  `permission` varchar(255) default NULL,
  `sort` int(11) default NULL,
  `version_` bigint(20) default NULL,
  `parent_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `I_SYS_SSN_PARENT` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_permission` */

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `name` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  `version_` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`createBy`,`creationDate`,`updateBy`,`updateDate`,`name`,`remark`,`version_`) values (1212,NULL,'2015-07-29 15:30:03','管理员','2015-07-29 15:30:03','超级管理员','',2),(4901,'fdad2222','2015-07-30 15:59:26','张三','2015-07-30 15:59:26','普通管理员','222',7),(14001,'管理员2','2015-08-13 10:41:26','管理员2','2015-08-13 10:41:26','权限控制管理员','',1),(14002,'管理员2','2015-08-13 10:41:34','管理员2','2015-08-13 10:41:34','系统常量管理员','',1);

/*Table structure for table `sys_role_application` */

DROP TABLE IF EXISTS `sys_role_application`;

CREATE TABLE `sys_role_application` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `applicationId` bigint(20) default NULL,
  `roleId` bigint(20) default NULL,
  `version_` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_application` */

insert  into `sys_role_application`(`id`,`createBy`,`creationDate`,`updateBy`,`updateDate`,`applicationId`,`roleId`,`version_`) values (13808,'管理员2','2015-08-13 10:43:01','管理员2','2015-08-13 10:43:01',7901,14002,1),(14901,'管理员2','2015-08-14 11:22:14','管理员2','2015-08-14 11:22:14',7901,4901,1),(14902,'管理员2','2015-08-14 11:22:15','管理员2','2015-08-14 11:22:15',12501,4901,1),(15201,'管理员2','2015-08-17 11:04:49','管理员2','2015-08-17 11:04:49',7901,1212,1),(15202,'管理员2','2015-08-17 11:04:49','管理员2','2015-08-17 11:04:49',12501,1212,1),(15403,'权限控制人','2015-08-17 14:01:25','权限控制人','2015-08-17 14:01:25',7901,14001,1);

/*Table structure for table `sys_role_function` */

DROP TABLE IF EXISTS `sys_role_function`;

CREATE TABLE `sys_role_function` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `functionId` bigint(20) default NULL,
  `roleId` bigint(20) default NULL,
  `version_` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_function` */

insert  into `sys_role_function`(`id`,`createBy`,`creationDate`,`updateBy`,`updateDate`,`functionId`,`roleId`,`version_`) values (13945,'管理员2','2015-08-13 10:43:01','管理员2','2015-08-13 10:43:01',13701,14002,1),(13946,'管理员2','2015-08-13 10:43:01','管理员2','2015-08-13 10:43:01',13708,14002,1),(13947,'管理员2','2015-08-13 10:43:01','管理员2','2015-08-13 10:43:01',13709,14002,1),(13948,'管理员2','2015-08-13 10:43:01','管理员2','2015-08-13 10:43:01',13710,14002,1),(13949,'管理员2','2015-08-13 10:43:01','管理员2','2015-08-13 10:43:01',13711,14002,1),(13950,'管理员2','2015-08-13 10:43:01','管理员2','2015-08-13 10:43:01',13712,14002,1),(15001,'管理员2','2015-08-14 11:22:15','管理员2','2015-08-14 11:22:15',13701,4901,1),(15002,'管理员2','2015-08-14 11:22:15','管理员2','2015-08-14 11:22:15',13702,4901,1),(15003,'管理员2','2015-08-14 11:22:15','管理员2','2015-08-14 11:22:15',13703,4901,1),(15004,'管理员2','2015-08-14 11:22:15','管理员2','2015-08-14 11:22:15',14801,4901,1),(15005,'管理员2','2015-08-14 11:22:15','管理员2','2015-08-14 11:22:15',13713,4901,1),(15006,'管理员2','2015-08-14 11:22:15','管理员2','2015-08-14 11:22:15',13714,4901,1),(15007,'管理员2','2015-08-14 11:22:15','管理员2','2015-08-14 11:22:15',13715,4901,1),(15008,'管理员2','2015-08-14 11:22:15','管理员2','2015-08-14 11:22:15',13716,4901,1),(15009,'管理员2','2015-08-14 11:22:15','管理员2','2015-08-14 11:22:15',13717,4901,1),(15010,'管理员2','2015-08-14 11:22:15','管理员2','2015-08-14 11:22:15',13718,4901,1),(15301,'管理员2','2015-08-17 11:04:49','管理员2','2015-08-17 11:04:49',13701,1212,1),(15302,'管理员2','2015-08-17 11:04:49','管理员2','2015-08-17 11:04:49',13702,1212,1),(15303,'管理员2','2015-08-17 11:04:49','管理员2','2015-08-17 11:04:49',13703,1212,1),(15304,'管理员2','2015-08-17 11:04:49','管理员2','2015-08-17 11:04:49',14501,1212,1),(15305,'管理员2','2015-08-17 11:04:49','管理员2','2015-08-17 11:04:49',14801,1212,1),(15306,'管理员2','2015-08-17 11:04:49','管理员2','2015-08-17 11:04:49',15101,1212,1),(15307,'管理员2','2015-08-17 11:04:49','管理员2','2015-08-17 11:04:49',15102,1212,1),(15308,'管理员2','2015-08-17 11:04:49','管理员2','2015-08-17 11:04:49',13704,1212,1),(15309,'管理员2','2015-08-17 11:04:49','管理员2','2015-08-17 11:04:49',13705,1212,1),(15310,'管理员2','2015-08-17 11:04:49','管理员2','2015-08-17 11:04:49',13706,1212,1),(15311,'管理员2','2015-08-17 11:04:49','管理员2','2015-08-17 11:04:49',13707,1212,1),(15312,'管理员2','2015-08-17 11:04:49','管理员2','2015-08-17 11:04:49',13708,1212,1),(15313,'管理员2','2015-08-17 11:04:49','管理员2','2015-08-17 11:04:49',13709,1212,1),(15314,'管理员2','2015-08-17 11:04:49','管理员2','2015-08-17 11:04:49',13710,1212,1),(15315,'管理员2','2015-08-17 11:04:49','管理员2','2015-08-17 11:04:49',13711,1212,1),(15316,'管理员2','2015-08-17 11:04:49','管理员2','2015-08-17 11:04:49',13712,1212,1),(15317,'管理员2','2015-08-17 11:04:49','管理员2','2015-08-17 11:04:49',13713,1212,1),(15318,'管理员2','2015-08-17 11:04:50','管理员2','2015-08-17 11:04:50',13714,1212,1),(15319,'管理员2','2015-08-17 11:04:50','管理员2','2015-08-17 11:04:50',13715,1212,1),(15320,'管理员2','2015-08-17 11:04:50','管理员2','2015-08-17 11:04:50',13716,1212,1),(15321,'管理员2','2015-08-17 11:04:50','管理员2','2015-08-17 11:04:50',13717,1212,1),(15322,'管理员2','2015-08-17 11:04:50','管理员2','2015-08-17 11:04:50',13718,1212,1),(15520,'权限控制人','2015-08-17 14:01:25','权限控制人','2015-08-17 14:01:25',13701,14001,1),(15521,'权限控制人','2015-08-17 14:01:25','权限控制人','2015-08-17 14:01:25',13702,14001,1),(15522,'权限控制人','2015-08-17 14:01:25','权限控制人','2015-08-17 14:01:25',13703,14001,1),(15523,'权限控制人','2015-08-17 14:01:25','权限控制人','2015-08-17 14:01:25',14501,14001,1),(15524,'权限控制人','2015-08-17 14:01:25','权限控制人','2015-08-17 14:01:25',14801,14001,1),(15525,'权限控制人','2015-08-17 14:01:25','权限控制人','2015-08-17 14:01:25',15101,14001,1),(15526,'权限控制人','2015-08-17 14:01:25','权限控制人','2015-08-17 14:01:25',13704,14001,1),(15527,'权限控制人','2015-08-17 14:01:25','权限控制人','2015-08-17 14:01:25',13705,14001,1),(15528,'权限控制人','2015-08-17 14:01:25','权限控制人','2015-08-17 14:01:25',13706,14001,1),(15529,'权限控制人','2015-08-17 14:01:25','权限控制人','2015-08-17 14:01:25',13707,14001,1);

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `role_id` bigint(20) default NULL,
  `permission_id` bigint(20) default NULL,
  KEY `I_SYS_SSN_ELEMENT` (`permission_id`),
  KEY `I_SYS_SSN_ROLE_ID` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_permission` */

/*Table structure for table `sys_role_user` */

DROP TABLE IF EXISTS `sys_role_user`;

CREATE TABLE `sys_role_user` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `roleId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `version_` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_user` */

insert  into `sys_role_user`(`id`,`createBy`,`creationDate`,`updateBy`,`updateDate`,`roleId`,`userId`,`version_`) values (6306,'管理员','2015-07-29 10:31:41','管理员','2015-07-29 10:31:41',1213,110,1),(6307,'管理员','2015-07-29 10:31:41','管理员','2015-07-29 10:31:41',1213,111,1),(12701,'管理员2','2015-08-12 10:32:21','管理员2','2015-08-12 10:32:21',1212,5601,1),(12702,'管理员2','2015-08-12 10:32:21','管理员2','2015-08-12 10:32:21',1212,7001,1),(12703,'管理员2','2015-08-12 10:32:21','管理员2','2015-08-12 10:32:21',1212,9101,1),(13101,'管理员2','2015-08-12 14:50:54','管理员2','2015-08-12 14:50:54',4901,11501,1),(14201,'管理员2','2015-08-13 10:42:49','管理员2','2015-08-13 10:42:49',14001,14101,1),(14202,'管理员2','2015-08-13 10:43:05','管理员2','2015-08-13 10:43:05',14002,14102,1);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `available` int(11) default NULL,
  `email` varchar(255) default NULL,
  `is_ent_user` int(11) default NULL,
  `jgdm` varchar(255) default NULL,
  `loginDate` datetime default NULL,
  `loginIp` varchar(255) default NULL,
  `loginName` varchar(255) default NULL,
  `mobile` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `qyid` varchar(255) default NULL,
  `relateId` varchar(255) default NULL,
  `version_` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`createBy`,`creationDate`,`updateBy`,`updateDate`,`available`,`email`,`is_ent_user`,`jgdm`,`loginDate`,`loginIp`,`loginName`,`mobile`,`name`,`password`,`phone`,`qyid`,`relateId`,`version_`) values (5601,'2','2015-07-30 16:42:50','管理员','2015-07-30 16:42:50',1,'123',0,NULL,'2015-07-30 16:43:40','0:0:0:0:0:0:0:1','admin','123','管理员','ICy5YqxZB1uWSwcVLSNLcA==','123','',NULL,40),(7001,'管理员','2015-08-18 10:06:33','管理员2','2015-08-18 10:06:33',1,'zhangsan@163.com',0,NULL,'2015-07-30 16:43:35','0:0:0:0:0:0:0:1','zhangsan','1305004812','张三','ICy5YqxZB1uWSwcVLSNLcA==','','',NULL,4),(8301,NULL,'2015-07-30 16:00:12','张三','2015-07-30 16:00:12',1,'lisi@163.com',0,NULL,NULL,NULL,'lisi','13050041542','李四','ICy5YqxZB1uWSwcVLSNLcA==','','',NULL,3),(9101,'管理员','2015-07-31 14:32:25','管理员','2015-07-31 14:32:25',1,'222@163.com',0,NULL,'2015-08-18 15:27:35','0:0:0:0:0:0:0:1','222','222222','管理员2','ICy5YqxZB1uWSwcVLSNLcA==','','',NULL,149),(11401,'管理员2','2015-08-05 11:44:29','管理员2','2015-08-05 11:44:29',1,'123@123.com',0,NULL,NULL,NULL,'wangwu','123456','王五','ICy5YqxZB1uWSwcVLSNLcA==','','',NULL,1),(11501,'管理员2','2015-08-18 10:00:28','管理员2','2015-08-18 10:00:28',1,'123',0,NULL,'2015-08-18 10:07:09','0:0:0:0:0:0:0:1','qwer','123','qwer','ICy5YqxZB1uWSwcVLSNLcA==','123','',NULL,29),(12202,'管理员2','2015-08-11 11:42:48','管理员2','2015-08-11 11:42:48',1,'3',0,NULL,NULL,NULL,'4','3','3','ICy5YqxZB1uWSwcVLSNLcA==','3','',NULL,1),(12204,'管理员2','2015-08-17 11:47:32','管理员2','2015-08-17 11:47:32',0,'3',0,NULL,NULL,NULL,'6','4444','3','ICy5YqxZB1uWSwcVLSNLcA==','3','',NULL,3),(12206,'管理员2','2015-08-11 11:42:57','管理员2','2015-08-11 11:42:57',1,'3',0,NULL,NULL,NULL,'8','3','3','ICy5YqxZB1uWSwcVLSNLcA==','3','',NULL,1),(12208,'管理员2','2015-08-11 11:43:02','管理员2','2015-08-11 11:43:02',1,'3',0,NULL,NULL,NULL,'10','3','3','ICy5YqxZB1uWSwcVLSNLcA==','3','',NULL,1),(12209,'管理员2','2015-08-11 11:43:04','管理员2','2015-08-11 11:43:04',1,'3',0,NULL,NULL,NULL,'11','3','3','ICy5YqxZB1uWSwcVLSNLcA==','3','',NULL,1),(12210,'管理员2','2015-08-11 11:43:05','管理员2','2015-08-11 11:43:05',1,'3',0,NULL,NULL,NULL,'12','3','3','ICy5YqxZB1uWSwcVLSNLcA==','3','',NULL,1),(12211,'管理员2','2015-08-11 11:43:07','管理员2','2015-08-11 11:43:07',1,'3',0,NULL,NULL,NULL,'13','3','3','ICy5YqxZB1uWSwcVLSNLcA==','3','',NULL,1),(12212,'管理员2','2015-08-11 11:43:09','管理员2','2015-08-11 11:43:09',1,'3',0,NULL,NULL,NULL,'14','3','3','ICy5YqxZB1uWSwcVLSNLcA==','3','',NULL,1),(12213,'管理员2','2015-08-11 11:43:10','管理员2','2015-08-11 11:43:10',1,'3',0,NULL,NULL,NULL,'15','3','3','ICy5YqxZB1uWSwcVLSNLcA==','3','',NULL,1),(12214,'管理员2','2015-08-11 11:43:13','管理员2','2015-08-11 11:43:13',1,'3',0,NULL,NULL,NULL,'155','3','3','ICy5YqxZB1uWSwcVLSNLcA==','3','',NULL,1),(12215,'管理员2','2015-08-11 11:43:16','管理员2','2015-08-11 11:43:16',1,'3',0,NULL,NULL,NULL,'16','3','3','ICy5YqxZB1uWSwcVLSNLcA==','3','',NULL,1),(12216,'管理员2','2015-08-11 11:43:19','管理员2','2015-08-11 11:43:19',1,'3',0,NULL,NULL,NULL,'17','3','3','ICy5YqxZB1uWSwcVLSNLcA==','3','',NULL,1),(12219,'管理员2','2015-08-11 11:43:26','管理员2','2015-08-11 11:43:26',1,'3',0,NULL,NULL,NULL,'111','3','3','ICy5YqxZB1uWSwcVLSNLcA==','3','',NULL,1),(12220,'管理员2','2015-08-11 13:57:43','管理员2','2015-08-11 13:57:43',1,'1',0,NULL,NULL,NULL,'112','1','1','ICy5YqxZB1uWSwcVLSNLcA==','1','',NULL,1),(14101,'管理员2','2015-08-18 10:01:49','管理员2','2015-08-18 10:01:50',1,'quanxiankongzhi@123.com',0,NULL,'2015-08-17 14:01:32','0:0:0:0:0:0:0:1','quanxiankongzhi','123','权限控制人','ICy5YqxZB1uWSwcVLSNLcA==','','',NULL,29),(14102,'管理员2','2015-08-18 10:02:00','管理员2','2015-08-18 10:02:00',1,'xitongchangliang@123.com',0,NULL,'2015-08-13 16:42:45','0:0:0:0:0:0:0:1','xitongchangliang','123456','系统常量管理人','ICy5YqxZB1uWSwcVLSNLcA==','','',NULL,5),(15601,'管理员2','2015-08-18 10:01:08','管理员2','2015-08-18 10:01:08',1,'jiami@123.com',0,NULL,'2015-08-18 10:00:44','0:0:0:0:0:0:0:1','jiami','1308504852','加密账户','ICy5YqxZB1uWSwcVLSNLcA==','','',NULL,3);

/*Table structure for table `sys_user_rel` */

DROP TABLE IF EXISTS `sys_user_rel`;

CREATE TABLE `sys_user_rel` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `token` varchar(255) default NULL,
  `user_id` bigint(20) default NULL,
  `user_logo` varchar(255) default NULL,
  `version_` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_rel` */

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) default NULL,
  `role_id` bigint(20) default NULL,
  UNIQUE KEY `U_SYS__RL_USER_ID` (`user_id`,`role_id`),
  KEY `I_SYS__RL_ELEMENT` (`role_id`),
  KEY `I_SYS__RL_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_role` */

/*Table structure for table `sys_workgroup` */

DROP TABLE IF EXISTS `sys_workgroup`;

CREATE TABLE `sys_workgroup` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `name` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  `version_` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_workgroup` */

insert  into `sys_workgroup`(`id`,`createBy`,`creationDate`,`updateBy`,`updateDate`,`name`,`remark`,`version_`) values (6201,'管理员','2015-07-30 16:22:30','张三','2015-07-30 16:22:30','超级管理员工作组','',4),(7501,'管理员','2015-07-30 15:55:29','张三','2015-07-30 15:55:29','普通管理员工作组','',3);

/*Table structure for table `sys_workgroup_role` */

DROP TABLE IF EXISTS `sys_workgroup_role`;

CREATE TABLE `sys_workgroup_role` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `groupId` bigint(20) default NULL,
  `roleId` bigint(20) default NULL,
  `version_` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_workgroup_role` */

insert  into `sys_workgroup_role`(`id`,`createBy`,`creationDate`,`updateBy`,`updateDate`,`groupId`,`roleId`,`version_`) values (7704,NULL,'2015-07-29 17:06:47',NULL,'2015-07-29 17:06:47',1,1,1),(10301,'管理员','2015-07-31 14:46:36','管理员','2015-07-31 14:46:36',7501,1212,1),(12401,'qwer','2015-08-11 15:20:49','qwer','2015-08-11 15:20:49',6201,1212,1);

/*Table structure for table `sys_workgroup_user` */

DROP TABLE IF EXISTS `sys_workgroup_user`;

CREATE TABLE `sys_workgroup_user` (
  `id` bigint(20) NOT NULL,
  `createBy` varchar(255) default NULL,
  `creationDate` datetime default NULL,
  `updateBy` varchar(255) default NULL,
  `updateDate` datetime default NULL,
  `version_` bigint(20) default NULL,
  `groupId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_workgroup_user` */

insert  into `sys_workgroup_user`(`id`,`createBy`,`creationDate`,`updateBy`,`updateDate`,`version_`,`groupId`,`userId`) values (10001,'管理员','2015-07-31 14:39:06','管理员','2015-07-31 14:39:06',1,7501,9901),(10004,'管理员','2015-07-31 14:42:20','管理员','2015-07-31 14:42:20',1,6201,7001);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
