/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50548
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50548
File Encoding         : 65001

Date: 2018-08-29 22:27:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_student`
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('10', '刘玉安', '102230003', '22', '江西南昌');
INSERT INTO `t_student` VALUES ('11', 'admin2', '111', '111', '111');
INSERT INTO `t_student` VALUES ('13', 'admin1', '123123', '123123', '123123');
INSERT INTO `t_student` VALUES ('15', 'admin3', 'admin', '123', '213');
INSERT INTO `t_student` VALUES ('16', 'user', 'user', '0', 'asdfs');
INSERT INTO `t_student` VALUES ('18', 'user', 'user', '123', '江西 就看见看见看');
INSERT INTO `t_student` VALUES ('19', 'user', 'user', '123', '江西 就看见看见看');

-- ----------------------------
-- Table structure for `t_test`
-- ----------------------------
DROP TABLE IF EXISTS `t_test`;
CREATE TABLE `t_test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `degree` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_test
-- ----------------------------
INSERT INTO `t_test` VALUES ('1', 'user', 'userr', '男', '1');
INSERT INTO `t_test` VALUES ('12', 'user', 'userr', '女', '0');
INSERT INTO `t_test` VALUES ('13', 'user', 'userr', '男', '0');
INSERT INTO `t_test` VALUES ('14', 'peanut', 'peanut', '女', '1');
INSERT INTO `t_test` VALUES ('15', 'peanut', 'peanut', '女', '1');
INSERT INTO `t_test` VALUES ('16', 'peanut', 'peanut', '女', '1');
INSERT INTO `t_test` VALUES ('17', 'peanut', 'peanut', '女', '1');
INSERT INTO `t_test` VALUES ('18', 'peanut', 'peanut', '女', '1');
INSERT INTO `t_test` VALUES ('19', 'peanut', 'peanut', '女', '1');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'admin', '1', '11');
INSERT INTO `t_user` VALUES ('2', 'root', 'root', '2', '22');
INSERT INTO `t_user` VALUES ('4', 'test', 'test', '3', '33');
INSERT INTO `t_user` VALUES ('5', 'user', 'user', '4', '44');
INSERT INTO `t_user` VALUES ('12', '哈哈哈', '111', '111', '111');
INSERT INTO `t_user` VALUES ('13', '啊啊啊', '222', '222', '222');
INSERT INTO `t_user` VALUES ('14', 'peanut', 'peanut', '123', '123');
INSERT INTO `t_user` VALUES ('15', 'peanut', 'peanut', '123', '123');
INSERT INTO `t_user` VALUES ('16', 'peanut', 'peanut', '123', '123');
INSERT INTO `t_user` VALUES ('17', 'peanut', 'peanut', '123', '123');
INSERT INTO `t_user` VALUES ('18', 'peanut', 'peanut', '123', '123');
INSERT INTO `t_user` VALUES ('19', 'peanut', 'peanut', '123', '123');
INSERT INTO `t_user` VALUES ('20', 'peanut', 'peanut', '123', '123');
INSERT INTO `t_user` VALUES ('21', 'peanut', 'peanut', '123', '123');
INSERT INTO `t_user` VALUES ('22', 'peanut', 'peanut', '123', '123');
INSERT INTO `t_user` VALUES ('23', 'peanut11111', 'peanut', '123', '123');
INSERT INTO `t_user` VALUES ('27', '哈哈哈哈哈', 'admin', '0', 'dsfa');

-- ----------------------------
-- Table structure for `t_user_copy`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_copy`;
CREATE TABLE `t_user_copy` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_copy
-- ----------------------------
INSERT INTO `t_user_copy` VALUES ('1', 'admin', 'admin', '1', '11');
INSERT INTO `t_user_copy` VALUES ('2', 'root', 'root', '2', '22');
INSERT INTO `t_user_copy` VALUES ('4', 'test', 'test', '3', '33');
INSERT INTO `t_user_copy` VALUES ('5', 'user', 'user', '4', '44');
INSERT INTO `t_user_copy` VALUES ('12', '哈哈哈', '111', '111', '111');
INSERT INTO `t_user_copy` VALUES ('13', '啊啊啊', '222', '222', '222');
INSERT INTO `t_user_copy` VALUES ('14', 'peanut', 'peanut', '123', '123');
INSERT INTO `t_user_copy` VALUES ('15', 'peanut', 'peanut', '123', '123');
INSERT INTO `t_user_copy` VALUES ('16', 'peanut', 'peanut', '123', '123');
INSERT INTO `t_user_copy` VALUES ('17', 'peanut', 'peanut', '123', '123');
INSERT INTO `t_user_copy` VALUES ('18', 'peanut', 'peanut', '123', '123');
INSERT INTO `t_user_copy` VALUES ('19', 'peanut', 'peanut', '123', '123');
INSERT INTO `t_user_copy` VALUES ('20', 'peanut', 'peanut', '123', '123');
INSERT INTO `t_user_copy` VALUES ('21', 'peanut', 'peanut', '123', '123');
INSERT INTO `t_user_copy` VALUES ('22', 'peanut', 'peanut', '123', '123');
INSERT INTO `t_user_copy` VALUES ('23', 'peanut11111', 'peanut', '123', '123');
INSERT INTO `t_user_copy` VALUES ('27', '哈哈哈哈哈', 'admin', '0', 'dsfa');
