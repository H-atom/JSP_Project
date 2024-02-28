/*
 Navicat MySQL Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : webtable

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 28/02/2024 14:05:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for loginclass
-- ----------------------------
DROP TABLE IF EXISTS `loginclass`;
CREATE TABLE `loginclass`  (
  `term` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseNumber` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `credit` double NOT NULL,
  `classroom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classtimeWeek` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classtimeNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `startTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `endTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `major` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`courseNumber`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `term` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `student` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classes` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `credit` double NOT NULL,
  `score` double NOT NULL,
  `gpa` double NOT NULL,
  `gpaLevel` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `right` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `summary` int NULL DEFAULT NULL,
  `classSum` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for studentchoosecourse
-- ----------------------------
DROP TABLE IF EXISTS `studentchoosecourse`;
CREATE TABLE `studentchoosecourse`  (
  `term` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseNumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `student` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `credit` double NOT NULL,
  `teacher` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classroom` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classtimeWeek` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classtimeNumber` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `startTime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `endTime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classes` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `major` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for totalgpa
-- ----------------------------
DROP TABLE IF EXISTS `totalgpa`;
CREATE TABLE `totalgpa`  (
  `term` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `student` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `totalScore` double NOT NULL,
  `classes` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `major` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '202000300',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userclass` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1462756119586803752 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 用户信息
-- ----------------------------
DROP TABLE IF EXISTS `用户信息`;
CREATE TABLE `用户信息`  (
  `usernumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telephone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `identity` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `classes` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `major` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `coursetype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `addTime` int NULL DEFAULT NULL,
  PRIMARY KEY (`usernumber`, `telephone`, `email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 课序号
-- ----------------------------
DROP TABLE IF EXISTS `课序号`;
CREATE TABLE `课序号`  (
  `classNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `endTime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`classNumber`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
