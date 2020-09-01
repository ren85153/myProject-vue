/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.28-log : Database - study
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`study` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `study`;

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dict_name` varchar(32) DEFAULT NULL COMMENT '字典名称',
  `dict_code` varchar(32) DEFAULT NULL COMMENT '字典编码',
  `dict_type` char(2) DEFAULT NULL COMMENT '字典类型',
  `group_name` varchar(32) DEFAULT NULL COMMENT '组名',
  `group_code` varchar(32) DEFAULT NULL COMMENT '组编码',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级id',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `dict_order` varchar(2) DEFAULT NULL COMMENT '排序',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人id',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人姓名',
  `update_time` date DEFAULT NULL COMMENT '修改时间',
  `update_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人姓名',
  `reserve` varchar(100) DEFAULT NULL COMMENT '扩展',
  `reserve1` varchar(100) DEFAULT NULL COMMENT '扩展1',
  `reserve2` varchar(200) DEFAULT NULL COMMENT '扩展2',
  `reserve3` varchar(200) DEFAULT NULL COMMENT '扩展3',
  `reserve4` int(11) DEFAULT NULL COMMENT '扩展4',
  `reserve5` date DEFAULT NULL COMMENT '扩展5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`dict_name`,`dict_code`,`dict_type`,`group_name`,`group_code`,`parent_id`,`status`,`dict_order`,`remark`,`create_time`,`create_id`,`create_name`,`update_time`,`update_id`,`update_name`,`reserve`,`reserve1`,`reserve2`,`reserve3`,`reserve4`,`reserve5`) values (2,'可用','0','','状态','status',-1,'0','1','1','2020-06-25',NULL,'','2020-06-26',NULL,'','','','','',NULL,NULL),(3,'不可用','1','','状态','status',-1,'0','2','00','2020-06-25',NULL,'','2020-06-25',NULL,'','','','','',NULL,NULL),(14,'叠加态','3','','状态','status',-1,'1','3','','2020-06-25',NULL,'','2020-06-26',NULL,'','','','','',NULL,NULL),(15,'男','1','','性别','sex',-1,'0','4','','2020-06-26',NULL,'','2020-07-12',NULL,'','','','','',NULL,NULL),(16,'女','0','','性别','sex',-1,'0','5','','2020-06-26',NULL,'','2020-07-12',NULL,'','','','','',NULL,NULL),(17,'内框架','0','','菜单类型','menuType',-1,'0','6','','2020-07-12',NULL,'','2020-07-12',NULL,'','','','','',NULL,NULL),(18,'请求链接','1','','菜单类型','menuType',-1,'0','7','','2020-07-12',NULL,'','2020-07-12',NULL,'','','','','',NULL,NULL);

/*Table structure for table `sys_logs` */

DROP TABLE IF EXISTS `sys_logs`;

CREATE TABLE `sys_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oper_type` char(1) DEFAULT NULL COMMENT '操作类型',
  `oper_content` varchar(1000) DEFAULT NULL COMMENT '操作内容',
  `create_time` date DEFAULT NULL COMMENT '操作时间',
  `create_id` int(11) DEFAULT NULL COMMENT '操作人',
  `ip` varchar(32) DEFAULT NULL COMMENT 'IP地址',
  `reserve` varchar(100) DEFAULT NULL COMMENT '扩展',
  `reserve1` varchar(100) DEFAULT NULL COMMENT '扩展1',
  `reserve2` varchar(200) DEFAULT NULL COMMENT '扩展2',
  `reserve3` varchar(200) DEFAULT NULL COMMENT '扩展3',
  `reserve4` int(11) DEFAULT NULL COMMENT '扩展4',
  `reserve5` date DEFAULT NULL COMMENT '扩展5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_logs` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(32) DEFAULT NULL COMMENT '菜单名称',
  `menu_type` char(1) DEFAULT NULL COMMENT '菜单类型',
  `menu_level` varchar(2) DEFAULT NULL COMMENT '菜单等级',
  `menu_url` varchar(200) DEFAULT NULL COMMENT '菜单路径',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级id',
  `menu_icon` varchar(100) DEFAULT NULL COMMENT '菜单图标',
  `menu_order` varchar(3) DEFAULT NULL COMMENT '菜单顺序',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人id',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人姓名',
  `update_time` date DEFAULT NULL COMMENT '修改时间',
  `update_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人姓名',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `reserve` varchar(100) DEFAULT NULL COMMENT '扩展',
  `reserve1` varchar(100) DEFAULT NULL COMMENT '扩展1',
  `reserve2` varchar(200) DEFAULT NULL COMMENT '扩展2',
  `reserve3` varchar(200) DEFAULT NULL COMMENT '扩展3',
  `reserve4` int(11) DEFAULT NULL COMMENT '扩展4',
  `reserve5` date DEFAULT NULL COMMENT '扩展5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`menu_name`,`menu_type`,`menu_level`,`menu_url`,`parent_id`,`menu_icon`,`menu_order`,`status`,`create_time`,`create_id`,`create_name`,`update_time`,`update_id`,`update_name`,`remark`,`reserve`,`reserve1`,`reserve2`,`reserve3`,`reserve4`,`reserve5`) values (2,'用户管理','0','1','/SysUser',-1,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(3,'角色管理','0','1','/SysRole',-1,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(4,'菜单管理','0','1','/SysMenu',-1,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(5,'字典管理','0','1','/SysDict',-1,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(6,'用户列表','1','1','/sysUser/list',NULL,'','','0','2020-07-12',NULL,'','2020-07-12',NULL,'','','','','','',NULL,NULL),(7,'用户分页','1','1','/sysUser/page',NULL,'','','0','2020-07-12',NULL,'','2020-07-12',NULL,'','','','','','',NULL,NULL),(8,'用户详情','1','1','/sysUser/get',NULL,'','','0','2020-07-12',NULL,'','2020-07-12',NULL,'','','','','','',NULL,NULL),(9,'用户添加','1','1','/sysUser/add',NULL,'','','0','2020-07-12',NULL,'','2020-07-12',NULL,'','','','','','',NULL,NULL),(10,'用户修改','1','1','/sysUser/modify',NULL,'','','0','2020-07-12',NULL,'','2020-07-12',NULL,'','','','','','',NULL,NULL),(11,'用户删除','1','1','/sysUser/delete',NULL,'','','0','2020-07-12',NULL,'','2020-07-12',NULL,'','','','','','',NULL,NULL),(12,'角色列表','1','1','/sysRole/list',NULL,'','','0','2020-07-12',NULL,'','2020-07-12',NULL,'','','','','','',NULL,NULL),(13,'角色分页','1','1','/sysRole/page',NULL,'','','0','2020-07-12',NULL,'','2020-07-12',NULL,'','','','','','',NULL,NULL),(14,'角色详情','1','1','/sysRole/get',NULL,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(15,'角色添加','1','1','/sysRole/add',NULL,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(16,'角色修改','1','1','/sysRole/modify',NULL,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(17,'角色删除','1','1','/sysRole/delete',NULL,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(18,'菜单列表','1','1','/sysMenu/list',NULL,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(19,'菜单分页','1','1','/sysMenu/page',NULL,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(20,'菜单详情','1','1','/sysMenu/get',NULL,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(21,'菜单添加','1','1','/sysMenu/add',NULL,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(22,'菜单修改','1','1','/sysMenu/modify',NULL,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(23,'菜单删除','1','1','/sysMenu/delete',NULL,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(24,'字典列表','1','1','/sysDict/list',NULL,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(25,'字典分页','1','1','/sysDict/page',NULL,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(26,'字典详情','1','1','/sysDict/get',NULL,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(27,'字典添加','1','1','/sysDict/add',NULL,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(28,'字典修改','1','1','/sysDict/modify',NULL,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(29,'字典删除','1','1','/sysDict/delete',NULL,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(30,'日志分页','1','1','/sysLogs/page',NULL,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL),(31,'日志详情','1','1','/sysLogs/get',NULL,'','','0','2020-07-12',NULL,'',NULL,NULL,'','','','','','',NULL,NULL);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `role_type` char(1) DEFAULT NULL COMMENT '角色类型',
  `role_code` varchar(32) DEFAULT NULL COMMENT '角色编码',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人id',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人姓名',
  `update_time` date DEFAULT NULL COMMENT '修改时间',
  `update_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人姓名',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `reserve` varchar(100) DEFAULT NULL COMMENT '扩展',
  `reserve1` varchar(100) DEFAULT NULL COMMENT '扩展1',
  `reserve2` varchar(200) DEFAULT NULL COMMENT '扩展2',
  `reserve3` varchar(200) DEFAULT NULL COMMENT '扩展3',
  `reserve4` int(11) DEFAULT NULL COMMENT '扩展4',
  `reserve5` date DEFAULT NULL COMMENT '扩展5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`role_name`,`role_type`,`role_code`,`status`,`create_time`,`create_id`,`create_name`,`update_time`,`update_id`,`update_name`,`remark`,`reserve`,`reserve1`,`reserve2`,`reserve3`,`reserve4`,`reserve5`) values (2,'角色1','1','1','0','2020-06-24',1,'1','2020-07-06',1,'1','1222222222222222','1','1','1','1',1,'1970-01-01'),(3,'角色2','','2','0','2020-07-06',NULL,'',NULL,NULL,'','4444','','','','',NULL,NULL);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `update_name` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_role_menu` */

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `account` varchar(32) DEFAULT NULL COMMENT '账号',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `telephone` varchar(15) DEFAULT NULL COMMENT '手机号',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `cart_type` varchar(2) DEFAULT NULL COMMENT '证件类型',
  `cart_no` varchar(32) DEFAULT NULL COMMENT '证件号码',
  `nationality` varchar(4) DEFAULT NULL COMMENT '国籍',
  `birth` date DEFAULT NULL COMMENT '生日',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `error_count` int(11) DEFAULT NULL COMMENT '登录错误次数',
  `login_ip` varchar(32) DEFAULT NULL COMMENT '登录IP',
  `login_mac` varchar(32) DEFAULT NULL COMMENT '登录mac地址',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人id',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人姓名',
  `update_time` date DEFAULT NULL COMMENT '修改时间',
  `update_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人姓名',
  `account_type` char(1) DEFAULT NULL COMMENT '账号类型',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `reserve` varchar(100) DEFAULT NULL COMMENT '扩展',
  `reserve1` varchar(100) DEFAULT NULL COMMENT '扩展1',
  `reserve2` varchar(200) DEFAULT NULL COMMENT '扩展2',
  `reserve3` varchar(200) DEFAULT NULL COMMENT '扩展3',
  `reserve4` int(11) DEFAULT NULL COMMENT '扩展4',
  `reserve5` date DEFAULT NULL COMMENT '扩展5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`user_name`,`account`,`password`,`email`,`telephone`,`address`,`cart_type`,`cart_no`,`nationality`,`birth`,`sex`,`status`,`error_count`,`login_ip`,`login_mac`,`create_time`,`create_id`,`create_name`,`update_time`,`update_id`,`update_name`,`account_type`,`remark`,`reserve`,`reserve1`,`reserve2`,`reserve3`,`reserve4`,`reserve5`) values (9,'核本翔','1222','1','1','1','1','1','1','11','1970-01-01','1','0',1,'1','1','2020-06-23',1,'1','2020-07-22',1,'1','1','1','1','1','1','1',1,'1970-01-01'),(10,'核本想','2222222','1','1','1','1','1','1','1','1970-01-01','1','1',1,'1','1','2020-06-24',1,'1','2020-06-24',1,'1','1','1','1','1','11','1',1,'1970-01-01');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `update_name` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_user_role` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
