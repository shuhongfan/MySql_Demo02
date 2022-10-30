/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : db01

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 16/12/2021 18:20:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for stu
-- ----------------------------
DROP TABLE IF EXISTS `stu`;
CREATE TABLE `stu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `age` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_t_age`(`age`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4;

-- ----------------------------
-- Records of stu
-- ----------------------------
INSERT INTO `stu` VALUES (1, 1, 'tom');
INSERT INTO `stu` VALUES (3, 3, 'cat');
INSERT INTO `stu` VALUES (8, 8, 'rose');
INSERT INTO `stu` VALUES (11, 11, 'jetty');
INSERT INTO `stu` VALUES (19, 19, 'lily');
INSERT INTO `stu` VALUES (25, 25, 'luci');

SET FOREIGN_KEY_CHECKS = 1;
