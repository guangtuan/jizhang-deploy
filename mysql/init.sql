CREATE DATABASE jizhang CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use jizhang;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for account_state
-- ----------------------------
DROP TABLE IF EXISTS `account_state`;
CREATE TABLE `account_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `account_id` int(11) NOT NULL COMMENT 'account.key',
  `amount` int(11) NOT NULL COMMENT '分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for detail
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT 'user.account',
  `source_account_id` int(11) DEFAULT NULL COMMENT 'account.name',
  `dest_account_id` int(11) DEFAULT NULL COMMENT 'account.name',
  `amount` int(11) NOT NULL COMMENT '分',
  `subject_id` int(11) DEFAULT NULL COMMENT 'subject.name',
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=928 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for family
-- ----------------------------
DROP TABLE IF EXISTS `family`;
CREATE TABLE `family` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `tags` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(16) NOT NULL,
  `nickname` varchar(32) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for fixed_expenses
-- ----------------------------
DROP TABLE IF EXISTS `fixed_expenses`;
CREATE TABLE `fixed_expenses` (
  `id` int(11) NOT NULL,
  `form` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'day, week, month, year',
  `index_of_period` int(11) NOT NULL COMMENT '周期中的第n天',
  `start` datetime(3) DEFAULT NULL COMMENT '范围起始',
  `end` datetime(3) DEFAULT NULL COMMENT '范围结束',
  `generate_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生成方式，real_time 到点生成 all 一次性生成所有',
  `generated` tinyint(1) DEFAULT NULL COMMENT '1 生成 2 未生成',
  `amount` int(11) DEFAULT NULL COMMENT '金额：分',
  `source_account_id` int(11) DEFAULT NULL COMMENT '来源账户id',
  `dest_account_id` int(11) DEFAULT NULL COMMENT '目标账户id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `subject_id` int(11) DEFAULT NULL COMMENT '科目id',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `fixed_form` int(11) DEFAULT NULL,
  `index_in_period` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
