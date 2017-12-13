/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : easystar

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2017-12-13 21:53:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_erweima_task`
-- ----------------------------
DROP TABLE IF EXISTS `t_erweima_task`;
CREATE TABLE `t_erweima_task` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `tet_userid` varchar(64) NOT NULL COMMENT '对应的用户id',
  `tet_tasktype` varchar(1) NOT NULL COMMENT '任务类型',
  `tet_taskprice` decimal(10,2) NOT NULL COMMENT '任务价格',
  `tet_taskstatus` varchar(1) NOT NULL COMMENT '任务状态：1.待审核2.审核成功3.审核失败',
  `createtime` varchar(1) NOT NULL COMMENT '创建时间',
  `tet_reserve1` varchar(200) DEFAULT NULL COMMENT '扩展字段5',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='二维码做任务表';

-- ----------------------------
-- Records of t_erweima_task
-- ----------------------------
