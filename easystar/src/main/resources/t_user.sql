/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : easystar

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2017-12-08 17:00:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `t_userid` varchar(64) NOT NULL COMMENT 'sys_user表的id',
  `t_loginName` varchar(64) NOT NULL COMMENT '登录名',
  `t_name` varchar(100) NOT NULL COMMENT '姓名',
  `t_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `t_phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `QQ` varchar(200) DEFAULT NULL COMMENT 'QQ',
  `WX` varchar(200) DEFAULT NULL COMMENT 'WX',
  `t_photourl` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `t_photoinfo` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `t_company` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `t_companyurl` varchar(255) DEFAULT NULL COMMENT '公司网址',
  `createtime` datetime DEFAULT NULL,
  `t_acount` decimal(10,2) DEFAULT '0.00' COMMENT '账户，保留两位小数',
  `t_inviter` varchar(64) DEFAULT NULL COMMENT '邀请人标识：这里用的是手机号码作为标识',
  `reserve1` varchar(255) DEFAULT NULL COMMENT '密码明文',
  `reserve2` varchar(255) DEFAULT NULL COMMENT '扩展字段1',
  `reserve3` varchar(255) DEFAULT NULL COMMENT '扩展字段1',
  `reserve4` varchar(255) DEFAULT NULL COMMENT '扩展字段1',
  `reserve5` varchar(255) DEFAULT NULL COMMENT '扩展字段1',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息附加表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('bbd9d2771997445eaceff809816ed5b5', 'dongge', 'dongge', 'dongge', '1284622263@qq.com', '15527124409', '1284622263', '15527124409', null, null, '武汉昂纳科技有限公司', 'www.168mitu.com', '2017-11-26 18:49:21', '23.00', null, '123456', null, null, null, null, 'myself', '2017-11-03 21:28:43', 'myself', '2017-11-03 21:28:43', null, '0');
