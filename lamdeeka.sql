/*
 Navicat MySQL Data Transfer

 Source Server         : myConn
 Source Server Version : 50525
 Source Host           : 127.0.0.1
 Source Database       : lamdeeka

 Target Server Version : 50525
 File Encoding         : utf-8

 Date: 06/08/2014 11:45:21 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `billing`
-- ----------------------------
DROP TABLE IF EXISTS `billing`;
CREATE TABLE `billing` (
  `bID` int(11) NOT NULL AUTO_INCREMENT,
  `uID` int(11) NOT NULL,
  `ocID` int(11) NOT NULL,
  `taxID` char(13) NOT NULL,
  `posID` char(13) NOT NULL,
  `invoiceNumber` char(14) NOT NULL,
  `billingDate` date NOT NULL,
  `billingTime` time NOT NULL,
  `ptID` int(11) NOT NULL,
  `total` double NOT NULL,
  `payment` double NOT NULL,
  `return` double NOT NULL,
  `rewards` double NOT NULL,
  `posOpenTime` time NOT NULL,
  `posCloseTime` time NOT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `coffeephoto`
-- ----------------------------
DROP TABLE IF EXISTS `coffeephoto`;
CREATE TABLE `coffeephoto` (
  `cpID` int(11) NOT NULL AUTO_INCREMENT,
  `crID` int(11) NOT NULL,
  `crImage` blob,
  PRIMARY KEY (`cpID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `coffeerecipe`
-- ----------------------------
DROP TABLE IF EXISTS `coffeerecipe`;
CREATE TABLE `coffeerecipe` (
  `crID` int(11) NOT NULL AUTO_INCREMENT,
  `crNameTH` varchar(30) NOT NULL,
  `crNameEN` varchar(30) NOT NULL,
  `cpID` blob,
  `rgID` int(11) NOT NULL,
  `cmPrice` double NOT NULL,
  PRIMARY KEY (`crID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `coffeerecipe`
-- ----------------------------
BEGIN;
INSERT INTO `coffeerecipe` VALUES ('1', 'เอสเพรสโซ่', 'Espresso', null, '1', '50'), ('2', 'คาปูชิโน่', 'Capuccino', null, '1', '55'), ('3', 'ลาเต้', 'Latte', null, '1', '60'), ('4', 'ม๊อคค่า', 'Mocca', null, '1', '60'), ('5', 'โกโก้', 'Cocoa', null, '1', '45'), ('6', 'ไทย', 'eng', null, '1', '25'), ('7', 'ไทย', 'eng', null, '1', '25'), ('8', 'ไทย', 'eng', null, '1', '25'), ('9', 'ค๊อคเทล', 'cocktail', null, '4', '190');
COMMIT;

-- ----------------------------
--  Table structure for `coffeetype`
-- ----------------------------
DROP TABLE IF EXISTS `coffeetype`;
CREATE TABLE `coffeetype` (
  `ctID` int(11) NOT NULL AUTO_INCREMENT,
  `ctName` varchar(15) NOT NULL,
  `ctPrice` double NOT NULL,
  PRIMARY KEY (`ctID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `coffeetype`
-- ----------------------------
BEGIN;
INSERT INTO `coffeetype` VALUES ('1', 'Hot', '0'), ('2', 'Cold', '10'), ('3', 'Frappe', '15');
COMMIT;

-- ----------------------------
--  Table structure for `customerlogin`
-- ----------------------------
DROP TABLE IF EXISTS `customerlogin`;
CREATE TABLE `customerlogin` (
  `clID` int(11) NOT NULL AUTO_INCREMENT,
  `ipAddr` char(19) NOT NULL,
  `macAddr` char(20) NOT NULL,
  `loginDate` date DEFAULT NULL,
  `loginTime` time DEFAULT NULL,
  `logoutDate` date DEFAULT NULL,
  `logoutTime` time DEFAULT NULL,
  PRIMARY KEY (`clID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `deliverstatus`
-- ----------------------------
DROP TABLE IF EXISTS `deliverstatus`;
CREATE TABLE `deliverstatus` (
  `dsID` int(11) NOT NULL AUTO_INCREMENT,
  `dsName` char(10) NOT NULL,
  PRIMARY KEY (`dsID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `deliverstatus`
-- ----------------------------
BEGIN;
INSERT INTO `deliverstatus` VALUES ('1', 'Ordering'), ('2', 'On-Process'), ('3', 'Finishing');
COMMIT;

-- ----------------------------
--  Table structure for `ingredient`
-- ----------------------------
DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE `ingredient` (
  `inID` int(11) NOT NULL AUTO_INCREMENT,
  `inName` varchar(50) NOT NULL,
  `addDate` date NOT NULL,
  `addTime` time NOT NULL,
  `editDate` date DEFAULT NULL,
  `editTime` time DEFAULT NULL,
  PRIMARY KEY (`inID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ingredient`
-- ----------------------------
BEGIN;
INSERT INTO `ingredient` VALUES ('1', 'กาแฟ', '2014-04-15', '16:44:00', '0000-00-00', '00:00:00'), ('2', 'นมมิก', '2014-04-15', '16:45:04', '0000-00-00', '00:00:00'), ('3', 'นมสด', '2014-04-15', '16:45:56', '0000-00-00', '00:00:00'), ('4', 'นมข้นจืด', '2014-04-15', '16:46:22', '0000-00-00', '00:00:00'), ('5', 'ทดลอง', '2014-05-19', '20:46:00', null, null), ('6', 'syrup', '2014-05-19', '20:53:18', null, null), ('7', 'vokda', '2014-05-19', '20:53:30', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `ingredientunit`
-- ----------------------------
DROP TABLE IF EXISTS `ingredientunit`;
CREATE TABLE `ingredientunit` (
  `iuID` int(11) NOT NULL AUTO_INCREMENT,
  `inID` int(11) NOT NULL,
  `utID` int(11) NOT NULL,
  `volume` double NOT NULL,
  PRIMARY KEY (`iuID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ingredientunit`
-- ----------------------------
BEGIN;
INSERT INTO `ingredientunit` VALUES ('1', '1', '1', '2'), ('2', '2', '1', '2'), ('3', '3', '1', '2');
COMMIT;

-- ----------------------------
--  Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `mID` int(11) NOT NULL AUTO_INCREMENT,
  `mName` varchar(20) NOT NULL,
  `mLname` varchar(20) NOT NULL,
  `mtID` int(11) NOT NULL,
  `mPicture` blob,
  `mMail` char(20) DEFAULT NULL,
  `mMobile` char(10) NOT NULL,
  `mRegDate` date NOT NULL,
  `mEarnPoint` double NOT NULL,
  PRIMARY KEY (`mID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `member`
-- ----------------------------
BEGIN;
INSERT INTO `member` VALUES ('1', 'Chatnantapon', 'Ratnaratorn', '1', null, 'first.cmu.se@gmail.c', '0843062529', '2014-04-15', '0');
COMMIT;

-- ----------------------------
--  Table structure for `memberreward`
-- ----------------------------
DROP TABLE IF EXISTS `memberreward`;
CREATE TABLE `memberreward` (
  `mrID` int(11) NOT NULL AUTO_INCREMENT,
  `mID` int(11) NOT NULL,
  `mRewarded` double NOT NULL,
  PRIMARY KEY (`mrID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `membertype`
-- ----------------------------
DROP TABLE IF EXISTS `membertype`;
CREATE TABLE `membertype` (
  `mtID` int(11) NOT NULL AUTO_INCREMENT,
  `mtName` char(20) NOT NULL,
  PRIMARY KEY (`mtID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `membertype`
-- ----------------------------
BEGIN;
INSERT INTO `membertype` VALUES ('1', 'Normal'), ('2', 'Premier'), ('3', 'Executive');
COMMIT;

-- ----------------------------
--  Table structure for `ordercoffee`
-- ----------------------------
DROP TABLE IF EXISTS `ordercoffee`;
CREATE TABLE `ordercoffee` (
  `ocID` int(11) NOT NULL AUTO_INCREMENT,
  `crID` int(11) NOT NULL,
  `ctID` int(11) NOT NULL,
  `dsID` int(11) NOT NULL,
  `orderNumber` int(11) NOT NULL,
  `tnID` int(11) NOT NULL,
  `mID` int(11) NOT NULL,
  `uID` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `orderTime` time NOT NULL,
  `total` double(11,0) NOT NULL,
  PRIMARY KEY (`ocID`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ordercoffee`
-- ----------------------------
BEGIN;
INSERT INTO `ordercoffee` VALUES ('1', '1', '2', '1', '0', '3', '999', '1', '0000-00-00', '00:00:00', '60'), ('2', '1', '2', '1', '0', '3', '999', '1', '2014-04-15', '00:00:00', '60'), ('3', '1', '2', '1', '0', '3', '999', '1', '2014-04-15', '23:37:37', '60'), ('4', '1', '2', '1', '1', '3', '999', '1', '2014-04-15', '23:41:00', '60'), ('5', '1', '2', '1', '1', '3', '999', '1', '2014-04-15', '23:41:09', '60'), ('6', '1', '2', '1', '1', '3', '999', '1', '2014-04-15', '23:41:28', '60'), ('7', '3', '3', '1', '1', '8', '999', '1', '2014-04-15', '23:41:39', '75'), ('8', '3', '3', '1', '1', '8', '999', '1', '2014-04-15', '23:42:08', '75'), ('9', '3', '3', '1', '2', '8', '999', '1', '2014-04-15', '23:42:20', '75'), ('10', '3', '3', '1', '3', '8', '999', '1', '2014-04-15', '23:42:24', '75'), ('11', '3', '3', '1', '4', '8', '999', '1', '2014-04-15', '23:42:27', '75'), ('12', '3', '3', '1', '5', '8', '999', '1', '2014-04-15', '23:42:27', '75'), ('13', '3', '3', '1', '6', '8', '999', '1', '2014-04-15', '23:42:27', '75'), ('14', '3', '3', '1', '7', '8', '999', '1', '2014-04-15', '23:42:28', '75'), ('15', '3', '3', '1', '8', '8', '999', '1', '2014-04-15', '23:42:28', '75'), ('16', '3', '3', '1', '9', '8', '999', '1', '2014-04-15', '23:42:28', '75'), ('17', '3', '3', '1', '10', '8', '999', '1', '2014-04-15', '23:42:28', '75'), ('18', '3', '3', '1', '11', '8', '999', '1', '2014-04-15', '23:42:28', '75'), ('19', '3', '3', '1', '12', '8', '999', '1', '2014-04-15', '23:42:29', '75'), ('20', '3', '3', '1', '13', '8', '999', '1', '2014-04-15', '23:42:29', '75'), ('21', '3', '3', '1', '14', '8', '999', '1', '2014-04-15', '23:42:29', '75'), ('22', '3', '3', '1', '15', '8', '999', '1', '2014-04-15', '23:42:29', '75'), ('23', '3', '3', '1', '16', '8', '999', '1', '2014-04-15', '23:42:29', '75'), ('24', '3', '3', '1', '17', '8', '999', '1', '2014-04-15', '23:42:30', '75'), ('25', '3', '3', '1', '18', '8', '999', '1', '2014-04-15', '23:42:30', '75'), ('26', '3', '3', '1', '19', '8', '999', '1', '2014-04-15', '23:42:30', '75'), ('27', '3', '3', '1', '20', '8', '999', '1', '2014-04-15', '23:42:30', '75'), ('28', '3', '3', '1', '21', '8', '999', '1', '2014-04-15', '23:42:31', '75'), ('29', '3', '3', '1', '22', '8', '999', '0', '2014-04-29', '12:05:35', '75');
COMMIT;

-- ----------------------------
--  Table structure for `payment`
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `pID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `paymenttype`
-- ----------------------------
DROP TABLE IF EXISTS `paymenttype`;
CREATE TABLE `paymenttype` (
  `ptID` int(11) NOT NULL AUTO_INCREMENT,
  `ptName` char(20) NOT NULL,
  PRIMARY KEY (`ptID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `paymenttype`
-- ----------------------------
BEGIN;
INSERT INTO `paymenttype` VALUES ('1', 'Cash'), ('2', 'Credit'), ('3', 'Redeem');
COMMIT;

-- ----------------------------
--  Table structure for `recipegroup`
-- ----------------------------
DROP TABLE IF EXISTS `recipegroup`;
CREATE TABLE `recipegroup` (
  `rgID` int(11) NOT NULL AUTO_INCREMENT,
  `rgName` varchar(15) NOT NULL,
  PRIMARY KEY (`rgID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `recipegroup`
-- ----------------------------
BEGIN;
INSERT INTO `recipegroup` VALUES ('1', 'Coffee'), ('2', 'Cake'), ('3', 'Food'), ('4', 'Beer');
COMMIT;

-- ----------------------------
--  Table structure for `tablenum`
-- ----------------------------
DROP TABLE IF EXISTS `tablenum`;
CREATE TABLE `tablenum` (
  `tnID` int(11) NOT NULL AUTO_INCREMENT,
  `tnNumber` char(3) NOT NULL,
  `tnZone` varchar(20) NOT NULL,
  PRIMARY KEY (`tnID`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tablenum`
-- ----------------------------
BEGIN;
INSERT INTO `tablenum` VALUES ('1', '1', 'ด้านใน'), ('2', '2', 'ด้านใน'), ('3', '3', 'ด้านใน'), ('4', '4', 'ด้านใน'), ('5', '5', 'ด้านใน'), ('6', '1', 'ด้านนอก'), ('7', '2', 'ด้านนอก'), ('8', '3', 'ด้านนอก'), ('9', '4', 'ด้านนอก'), ('10', '5', 'ด้านนอก'), ('11', '6', 'ด้านนอก');
COMMIT;

-- ----------------------------
--  Table structure for `unittype`
-- ----------------------------
DROP TABLE IF EXISTS `unittype`;
CREATE TABLE `unittype` (
  `iuID` int(11) NOT NULL AUTO_INCREMENT,
  `iuName` varchar(30) NOT NULL,
  PRIMARY KEY (`iuID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `unittype`
-- ----------------------------
BEGIN;
INSERT INTO `unittype` VALUES ('1', 'ออน'), ('2', 'ปั๊ม'), ('3', 'ช้อนโต๊ะ'), ('4', 'ชอต');
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uID` int(11) NOT NULL AUTO_INCREMENT,
  `uName` varchar(20) NOT NULL,
  `uLname` varchar(20) NOT NULL,
  `username` char(20) NOT NULL,
  `password` char(20) NOT NULL,
  `conPass` char(20) NOT NULL,
  `uMail` char(20) NOT NULL,
  `uMobile` char(10) NOT NULL,
  `uPicture` blob NOT NULL,
  `uRegDate` date NOT NULL,
  `utID` int(11) NOT NULL,
  PRIMARY KEY (`uID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', 'Prin', 'Kammasitt', 'zaat', 'zaat', 'zaat', 'mp.prarin@live.com', '0882524210', '', '2014-04-14', '3'), ('2', 'Tavin', 'Kuanstaporn', 'moxy', 'moxy', 'moxy', 'Mmooxxyy@gmail.com', '0869795237', '', '2014-04-14', '3'), ('3', 'Teerapop', 'Samutranuparp', 'tospace', 'tospace', 'tospace', 'tomori.top@gmail.com', '0922542453', '', '2014-04-14', '3'), ('4', 'แจ๋ว', 'เยี่ยมยอด', 'jj', 'yy', 'yy', 'aaa@df.com', '0812345689', '', '2014-04-15', '1');
COMMIT;

-- ----------------------------
--  Table structure for `useredittype`
-- ----------------------------
DROP TABLE IF EXISTS `useredittype`;
CREATE TABLE `useredittype` (
  `uEdittypeID` int(11) NOT NULL AUTO_INCREMENT,
  `uEdittypeName` int(11) NOT NULL,
  PRIMARY KEY (`uEdittypeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `userlogs`
-- ----------------------------
DROP TABLE IF EXISTS `userlogs`;
CREATE TABLE `userlogs` (
  `ulID` int(11) NOT NULL AUTO_INCREMENT,
  `uID` int(11) NOT NULL,
  `uEdittypeID` int(11) NOT NULL,
  `Description` text,
  PRIMARY KEY (`ulID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `usertype`
-- ----------------------------
DROP TABLE IF EXISTS `usertype`;
CREATE TABLE `usertype` (
  `utID` int(11) NOT NULL AUTO_INCREMENT,
  `utName` varchar(20) NOT NULL,
  PRIMARY KEY (`utID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `usertype`
-- ----------------------------
BEGIN;
INSERT INTO `usertype` VALUES ('1', 'Employee'), ('2', 'Member'), ('3', 'Admin'), ('4', 'Owner');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
