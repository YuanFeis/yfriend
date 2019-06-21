-- MySQL dump 10.13  Distrib 5.6.44, for Linux (x86_64)
--
-- Host: localhost    Database: mytwitter
-- ------------------------------------------------------
-- Server version	5.6.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adlogin`
--

DROP TABLE IF EXISTS `adlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adlogin` (
  `adid` int(20) NOT NULL AUTO_INCREMENT,
  `aid` int(20) NOT NULL,
  `aditime` datetime NOT NULL,
  `adotime` datetime NOT NULL,
  PRIMARY KEY (`adid`),
  KEY `aid` (`aid`),
  CONSTRAINT `adlogin_fk` FOREIGN KEY (`aid`) REFERENCES `admins` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adlogin`
--

LOCK TABLES `adlogin` WRITE;
/*!40000 ALTER TABLE `adlogin` DISABLE KEYS */;
INSERT INTO `adlogin` VALUES (1,2,'2019-05-04 16:57:28','2019-05-04 16:57:28'),(2,2,'2019-05-04 17:12:27','2019-05-04 17:12:27'),(3,2,'2019-05-05 00:30:45','2019-05-05 00:30:45'),(4,2,'2019-05-05 10:23:55','2019-05-05 10:23:55'),(5,2,'2019-05-05 20:56:07','2019-05-05 20:56:07'),(6,2,'2019-05-06 11:07:09','2019-05-06 11:07:09'),(7,2,'2019-05-07 22:54:25','2019-05-07 22:54:25');
/*!40000 ALTER TABLE `adlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `aid` int(20) NOT NULL AUTO_INCREMENT,
  `aname` varchar(20) NOT NULL,
  `apwd` varchar(20) NOT NULL,
  `atime` datetime NOT NULL,
  `astate` int(20) NOT NULL,
  `apower` int(20) NOT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `aname` (`aname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concern`
--

DROP TABLE IF EXISTS `concern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concern` (
  `cid` int(20) NOT NULL AUTO_INCREMENT,
  `f_uid` int(20) NOT NULL,
  `s_uid` int(20) NOT NULL,
  `cstate` int(11) NOT NULL DEFAULT '0',
  `ctime` datetime DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `f_uid` (`f_uid`),
  KEY `s_uid` (`s_uid`),
  CONSTRAINT `concern_fk` FOREIGN KEY (`f_uid`) REFERENCES `users` (`uid`),
  CONSTRAINT `concern_fk1` FOREIGN KEY (`s_uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concern`
--

LOCK TABLES `concern` WRITE;
/*!40000 ALTER TABLE `concern` DISABLE KEYS */;
INSERT INTO `concern` VALUES (2,32,31,1,'2019-05-03 22:05:48'),(3,31,32,1,'2019-05-04 14:55:54'),(4,33,31,1,'2019-05-04 17:04:50'),(5,33,32,0,'2019-05-04 17:04:51'),(6,31,33,1,'2019-05-04 17:08:59');
/*!40000 ALTER TABLE `concern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forwards`
--

DROP TABLE IF EXISTS `forwards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forwards` (
  `fid` int(20) NOT NULL AUTO_INCREMENT,
  `tid` int(20) NOT NULL,
  `stid` int(11) NOT NULL,
  `ftime` datetime NOT NULL,
  `uid` int(20) NOT NULL,
  PRIMARY KEY (`fid`),
  KEY `tid` (`tid`),
  KEY `stid` (`stid`),
  KEY `uid` (`uid`),
  CONSTRAINT `forwards_fk` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  CONSTRAINT `forwards_fk1` FOREIGN KEY (`tid`) REFERENCES `tweets` (`tid`),
  CONSTRAINT `forwards_fk2` FOREIGN KEY (`stid`) REFERENCES `tweets` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forwards`
--

LOCK TABLES `forwards` WRITE;
/*!40000 ALTER TABLE `forwards` DISABLE KEYS */;
/*!40000 ALTER TABLE `forwards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `lid` int(20) NOT NULL AUTO_INCREMENT,
  `uid` int(20) NOT NULL,
  `tid` int(20) NOT NULL,
  `ltime` datetime NOT NULL,
  PRIMARY KEY (`lid`),
  KEY `uid` (`uid`),
  KEY `tid` (`tid`),
  CONSTRAINT `likes_fk` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  CONSTRAINT `likes_fk1` FOREIGN KEY (`tid`) REFERENCES `tweets` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,32,1,'2019-05-03 22:05:42'),(2,31,1,'2019-05-04 14:56:11'),(3,31,3,'2019-05-04 17:27:31'),(4,31,4,'2019-05-05 12:19:03'),(5,31,5,'2019-05-05 12:19:05'),(6,31,6,'2019-05-05 12:19:08'),(7,31,9,'2019-05-06 11:06:20'),(8,31,8,'2019-05-06 11:06:22'),(9,31,7,'2019-05-06 11:06:23'),(10,31,10,'2019-05-06 17:14:26'),(11,31,12,'2019-05-06 22:52:51'),(12,31,11,'2019-05-06 22:52:52');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `fuid` int(11) DEFAULT NULL,
  `suid` int(11) DEFAULT NULL,
  `mcontent` varchar(255) DEFAULT NULL,
  `mtime` datetime DEFAULT NULL,
  `mread` int(11) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  KEY `fuid` (`fuid`),
  KEY `suid` (`suid`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`fuid`) REFERENCES `users` (`uid`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`suid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `messageall`
--

DROP TABLE IF EXISTS `messageall`;
/*!50001 DROP VIEW IF EXISTS `messageall`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `messageall` AS SELECT 
 1 AS `mid`,
 1 AS `fuid`,
 1 AS `suid`,
 1 AS `mcontent`,
 1 AS `mtime`,
 1 AS `mread`,
 1 AS `uname`,
 1 AS `urealname`,
 1 AS `ulogo`,
 1 AS `uid2`,
 1 AS `uname2`,
 1 AS `urealname2`,
 1 AS `ulogo2`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `nid` int(20) NOT NULL AUTO_INCREMENT,
  `nuid` int(20) NOT NULL,
  `ntype` int(20) NOT NULL,
  `nlikeuid` int(20) DEFAULT NULL,
  `nliketid` int(20) DEFAULT NULL,
  `nreuid` int(20) DEFAULT NULL,
  `nretid` int(20) DEFAULT NULL,
  `nuided` int(20) DEFAULT NULL,
  `nhuiuid` int(20) DEFAULT NULL,
  `nhuitid` int(20) DEFAULT NULL,
  `nrcontent` varchar(255) DEFAULT NULL,
  `ntime` datetime DEFAULT NULL,
  `nstate` int(20) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,32,1,0,0,0,0,31,0,0,NULL,'2019-05-03 21:01:58',1),(2,32,1,0,0,0,0,31,0,0,NULL,'2019-05-03 22:05:48',1),(3,31,1,0,0,0,0,32,0,0,NULL,'2019-05-04 14:55:54',1),(4,31,2,32,1,0,0,0,0,0,NULL,'2019-05-04 14:56:11',1),(5,33,1,0,0,0,0,31,0,0,NULL,'2019-05-04 17:04:50',1),(6,33,1,0,0,0,0,32,0,0,NULL,'2019-05-04 17:04:51',0),(7,31,1,0,0,0,0,33,0,0,NULL,'2019-05-04 17:08:59',0);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `replyall`
--

DROP TABLE IF EXISTS `replyall`;
/*!50001 DROP VIEW IF EXISTS `replyall`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `replyall` AS SELECT 
 1 AS `uid`,
 1 AS `rid`,
 1 AS `tid`,
 1 AS `rcontent`,
 1 AS `rtime`,
 1 AS `uname`,
 1 AS `urealname`,
 1 AS `uaite`,
 1 AS `ulogo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `replys`
--

DROP TABLE IF EXISTS `replys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replys` (
  `rid` int(20) NOT NULL AUTO_INCREMENT,
  `uid` int(20) NOT NULL,
  `tid` int(20) NOT NULL,
  `rcontent` varchar(255) NOT NULL,
  `rtime` datetime NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `uid` (`uid`),
  KEY `tid` (`tid`),
  CONSTRAINT `replys_fk` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  CONSTRAINT `replys_fk1` FOREIGN KEY (`tid`) REFERENCES `tweets` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replys`
--

LOCK TABLES `replys` WRITE;
/*!40000 ALTER TABLE `replys` DISABLE KEYS */;
/*!40000 ALTER TABLE `replys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signin`
--

DROP TABLE IF EXISTS `signin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signin` (
  `sid` int(20) NOT NULL AUTO_INCREMENT,
  `uid` int(20) NOT NULL,
  `stime` datetime NOT NULL,
  `sdtime` datetime NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `uid` (`uid`),
  CONSTRAINT `signin_fk` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=973 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signin`
--

LOCK TABLES `signin` WRITE;
/*!40000 ALTER TABLE `signin` DISABLE KEYS */;
INSERT INTO `signin` VALUES (920,31,'2019-05-03 19:17:14','2019-05-03 19:17:14'),(921,32,'2019-05-03 21:01:04','2019-05-03 21:01:04'),(922,32,'2019-05-03 21:58:31','2019-05-03 21:58:31'),(923,32,'2019-05-03 22:03:16','2019-05-03 22:03:16'),(924,32,'2019-05-04 11:31:37','2019-05-04 11:31:37'),(925,31,'2019-05-04 14:34:09','2019-05-04 14:34:09'),(926,31,'2019-05-04 14:43:02','2019-05-04 14:43:02'),(927,31,'2019-05-04 14:45:36','2019-05-04 14:45:36'),(928,31,'2019-05-04 14:47:50','2019-05-04 14:47:50'),(929,32,'2019-05-04 14:48:03','2019-05-04 14:48:03'),(930,31,'2019-05-04 14:55:49','2019-05-04 14:55:49'),(931,32,'2019-05-04 14:56:27','2019-05-04 14:56:27'),(932,31,'2019-05-04 14:58:58','2019-05-04 14:58:58'),(933,31,'2019-05-04 15:04:56','2019-05-04 15:04:56'),(934,31,'2019-05-04 15:54:30','2019-05-04 15:55:15'),(935,32,'2019-05-04 15:55:25','2019-05-04 15:57:08'),(936,31,'2019-05-04 15:58:27','2019-05-04 16:02:24'),(937,31,'2019-05-04 16:04:13','2019-05-04 16:19:47'),(938,31,'2019-05-04 16:53:17','2019-05-04 16:55:40'),(939,31,'2019-05-04 17:00:07','2019-05-04 17:02:56'),(940,33,'2019-05-04 17:04:22','2019-05-04 17:07:07'),(941,31,'2019-05-04 17:07:16','2019-05-04 17:11:53'),(942,31,'2019-05-04 17:27:15','2019-05-04 17:39:02'),(943,31,'2019-05-04 18:45:34','2019-05-04 18:56:25'),(944,31,'2019-05-04 18:56:25','2019-05-04 19:07:03'),(945,31,'2019-05-04 23:23:22','2019-05-04 23:27:56'),(946,31,'2019-05-05 00:27:19','2019-05-05 00:32:25'),(947,31,'2019-05-05 10:11:06','2019-05-05 10:23:08'),(948,31,'2019-05-05 10:25:14','2019-05-05 10:28:32'),(949,31,'2019-05-05 12:17:59','2019-05-05 12:18:38'),(950,31,'2019-05-05 12:18:38','2019-05-05 12:20:46'),(951,31,'2019-05-05 15:54:44','2019-05-05 15:55:11'),(952,31,'2019-05-05 18:33:29','2019-05-05 18:41:12'),(953,31,'2019-05-05 20:53:16','2019-05-05 20:54:16'),(954,31,'2019-05-05 22:20:31','2019-05-05 22:21:20'),(955,31,'2019-05-06 07:31:15','2019-05-06 07:37:03'),(956,31,'2019-05-06 11:00:26','2019-05-06 11:00:39'),(957,31,'2019-05-06 11:06:16','2019-05-06 11:07:38'),(958,31,'2019-05-06 11:07:46','2019-05-06 11:07:56'),(959,31,'2019-05-06 17:12:53','2019-05-06 17:14:48'),(960,31,'2019-05-06 17:36:46','2019-05-06 17:37:21'),(961,31,'2019-05-06 19:17:04','2019-05-06 19:23:11'),(962,31,'2019-05-06 22:48:55','2019-05-06 22:52:57'),(963,31,'2019-05-07 12:10:49','2019-05-07 12:23:42'),(964,31,'2019-05-07 21:25:32','2019-05-07 21:30:20'),(965,31,'2019-05-07 22:53:23','2019-05-07 22:53:39'),(966,31,'2019-05-08 00:16:13','2019-05-08 00:16:33'),(967,31,'2019-05-08 00:38:56','2019-05-08 00:39:36'),(968,31,'2019-05-08 06:58:26','2019-05-08 06:59:16'),(969,31,'2019-05-08 11:24:02','2019-05-08 11:24:17'),(970,31,'2019-05-08 12:22:27','2019-05-08 12:24:06'),(971,31,'2019-05-08 19:04:12','2019-05-08 19:13:48'),(972,31,'2019-05-08 19:13:48','2019-05-08 19:14:02');
/*!40000 ALTER TABLE `signin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweets`
--

DROP TABLE IF EXISTS `tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweets` (
  `tid` int(20) NOT NULL AUTO_INCREMENT,
  `uid` int(20) DEFAULT NULL,
  `tcontent` varchar(999) DEFAULT NULL,
  `ttime` datetime DEFAULT NULL,
  `tpic` varchar(50) DEFAULT NULL,
  `tvideo` varchar(50) DEFAULT '',
  `treply` int(20) DEFAULT '0',
  `tforward` int(20) DEFAULT '0',
  `tlike` int(20) DEFAULT '0',
  `tzhuan` int(20) DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `uid` (`uid`),
  KEY `ttime` (`ttime`),
  CONSTRAINT `tweets_fk` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=252;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweets`
--

LOCK TABLES `tweets` WRITE;
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
INSERT INTO `tweets` VALUES (1,32,'','2019-05-03 22:05:37',NULL,'',0,0,2,0),(2,31,'','2019-05-04 16:01:21',NULL,'',0,0,0,0),(3,31,'这是我编写的一个模仿twitter的网站，算是自己的一份天地，他基于jsp于servlet，适用于自己使用，做完这个网站后，作者就要开始投入去学习各种框架啦，虽然有些功能还有待完善。如果有幸你能访问到这里，也算是缘分啦哈哈。','2019-05-04 17:11:29','1556961089280.jpg','',0,0,1,0),(4,31,'谁知道这是开始还是结束呢？','2019-05-04 18:52:07','1556967125780.jpg','',0,0,1,0),(5,31,'今天开拓者和掘金大了四个加时赛，五十年之后的神迹。太厉害了(ง •̀_•́)ง','2019-05-04 23:25:33','1556983533414.jpg','',0,0,1,0),(6,31,'我们都是追梦人，努力超越人生跑道。','2019-05-05 00:28:27','1556987307071.jpg','',0,0,1,0),(7,31,'今天早上一醒过来就发现服务器炸了……重启之后解决了问题，这应该是我挂了两个项目的原因，可以考虑一下把另外一个从tomcat里删除下……毕竟资金有限，还租不起太大的云服务器。','2019-05-05 10:28:05',NULL,'',0,0,1,0),(8,31,'今天老师给我们科普了人工智能的相关事宜，身在java web学习的我也很有启发，但还是去学习框架去吧，中途而费不是我的性格。Fighting~终有一天，我要走向百分之20. 写给自己于19年5月5日。','2019-05-05 18:39:18','1557052757744.jpg','',0,0,1,0),(9,31,'每天早上都要重启一次服务器。这个问题好像还有待解决，由于时间原因可能暂时无法进行维护(●°u°●)​ 」但现在写写自己的生活感受还是不影响的哈哈','2019-05-06 07:36:18',NULL,'',0,0,1,0),(10,31,'这周是单片机课设周，今天写了一天答辩报告，虽然有点辛苦，但是过得很充实，晚上还有课先溜了~FIGHTING!','2019-05-06 17:14:21',NULL,'',0,0,1,0),(11,31,'今天晚上上的是形政，老师给我们讲的是扶贫，看到光辉伟大的共产党人的到贫困农村去艰苦奋斗，脱贫攻坚，乃至奉献生命的光辉事迹后让我有种热泪盈的感觉，努力奋斗，我辈当自强。为祖国的发展奉献自己的一份力。','2019-05-06 19:22:42',NULL,'',0,0,1,0),(12,31,'下了形政课以后班导给我们讲课设的调试问题，虽然很顺利的进行了验收，但也提醒着身为通信工程的我，千万别别专业知识落下了，要做好自己的本职工作(✪▽✪)','2019-05-06 22:52:31',NULL,'',0,0,1,0),(13,31,'今天进行系统调试，看到了许多波形，对电压信号有了更深的理解。','2019-05-07 12:12:40',NULL,'',0,0,0,0),(14,31,'今天我们用示波器抓取了课设模块的波形，身为电类专业的我，终于也算实际用到了示波器了哈哈，还有就是更改了TOMCAT的配置，不知道能不能改善每天早起就崩溃服务器的状态。期待明天','2019-05-07 21:30:06','1557235806595.jpg','',0,0,0,0),(15,31,'通过配置tomcat，貌似解决了查询sql出现问题的情况。此处是因为响应头的原因。设置10240后功能正常。','2019-05-08 12:23:52',NULL,'',0,0,0,0);
/*!40000 ALTER TABLE `tweets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(20) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `upwd` varchar(255) NOT NULL,
  `urealname` varchar(100) NOT NULL,
  `uaite` varchar(20) NOT NULL,
  `ustate` int(20) NOT NULL DEFAULT '1',
  `utime` datetime NOT NULL,
  `uonline` int(20) DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uname` (`uname`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `usersall`
--

DROP TABLE IF EXISTS `usersall`;
/*!50001 DROP VIEW IF EXISTS `usersall`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `usersall` AS SELECT 
 1 AS `uid`,
 1 AS `uname`,
 1 AS `upwd`,
 1 AS `urealname`,
 1 AS `uaite`,
 1 AS `ustate`,
 1 AS `utime`,
 1 AS `uonline`,
 1 AS `uaddress`,
 1 AS `uabout`,
 1 AS `udate`,
 1 AS `ulogo`,
 1 AS `ubg`,
 1 AS `ufans`,
 1 AS `utweet`,
 1 AS `ucolor`,
 1 AS `ufollow`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usersinfo`
--

DROP TABLE IF EXISTS `usersinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersinfo` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `uid` int(20) DEFAULT NULL,
  `uaddress` varchar(100) DEFAULT '中华人民共和国',
  `uabout` varchar(200) DEFAULT NULL,
  `udate` datetime DEFAULT NULL,
  `ulogo` varchar(50) NOT NULL DEFAULT 'default_profile_normal.png',
  `ubg` varchar(50) DEFAULT NULL,
  `ufans` int(20) DEFAULT '0',
  `utweet` int(20) DEFAULT '0',
  `ufollow` int(20) DEFAULT '0',
  `ucolor` varchar(50) NOT NULL DEFAULT 'rgba(29,161,241,1.00)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_2` (`uid`),
  KEY `uid` (`uid`),
  CONSTRAINT `usersinfo_fk` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersinfo`
--

LOCK TABLES `usersinfo` WRITE;
/*!40000 ALTER TABLE `usersinfo` DISABLE KEYS */;
INSERT INTO `usersinfo` VALUES (31,31,'中华人民共和国','一个学习java的大学生，原来喜欢DOTA，现在没有什么特别喜欢的东西，如果有的话，学习别的新东西应该是我现在喜欢的吧','1999-01-30 00:00:00','1556960041830.png','1556960106582.jpg',2,13,2,'rgba(29,161,241,1.00)'),(32,32,'中华人民共和国','一个学习java的大学生，原来喜欢dota，现在还没有特别喜欢的东西。','1999-01-30 00:00:00','1556888493885.png','1556956563849.png',2,0,1,'rgba(29,161,241,1.00)'),(33,33,'中华人民共和国','A STUDENT WHO STUDENT JAVA','1999-01-30 00:00:00','1556960706428.png',NULL,1,0,2,'rgba(29,161,241,1.00)');
/*!40000 ALTER TABLE `usersinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `utweets`
--

DROP TABLE IF EXISTS `utweets`;
/*!50001 DROP VIEW IF EXISTS `utweets`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `utweets` AS SELECT 
 1 AS `uid`,
 1 AS `uname`,
 1 AS `upwd`,
 1 AS `urealname`,
 1 AS `uaite`,
 1 AS `ustate`,
 1 AS `utime`,
 1 AS `uonline`,
 1 AS `uaddress`,
 1 AS `uabout`,
 1 AS `udate`,
 1 AS `ulogo`,
 1 AS `ubg`,
 1 AS `ufans`,
 1 AS `utweet`,
 1 AS `ufollow`,
 1 AS `ucolor`,
 1 AS `tcontent`,
 1 AS `ttime`,
 1 AS `tpic`,
 1 AS `tvideo`,
 1 AS `treply`,
 1 AS `tforward`,
 1 AS `tlike`,
 1 AS `tzhuan`,
 1 AS `tid`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `messageall`
--

/*!50001 DROP VIEW IF EXISTS `messageall`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `messageall` AS select `message`.`mid` AS `mid`,`message`.`fuid` AS `fuid`,`message`.`suid` AS `suid`,`message`.`mcontent` AS `mcontent`,`message`.`mtime` AS `mtime`,`message`.`mread` AS `mread`,`usersall`.`uname` AS `uname`,`usersall`.`urealname` AS `urealname`,`usersall`.`ulogo` AS `ulogo`,`usersall2`.`uid` AS `uid2`,`usersall2`.`uname` AS `uname2`,`usersall2`.`urealname` AS `urealname2`,`usersall2`.`ulogo` AS `ulogo2` from ((`message` join `usersall`) join `usersall` `usersall2`) where ((`message`.`fuid` = `usersall`.`uid`) and (`message`.`suid` = `usersall2`.`uid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `replyall`
--

/*!50001 DROP VIEW IF EXISTS `replyall`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `replyall` AS select `replys`.`uid` AS `uid`,`replys`.`rid` AS `rid`,`replys`.`tid` AS `tid`,`replys`.`rcontent` AS `rcontent`,`replys`.`rtime` AS `rtime`,`usersall`.`uname` AS `uname`,`usersall`.`urealname` AS `urealname`,`usersall`.`uaite` AS `uaite`,`usersall`.`ulogo` AS `ulogo` from (`replys` join `usersall`) where (`replys`.`uid` = `usersall`.`uid`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usersall`
--

/*!50001 DROP VIEW IF EXISTS `usersall`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usersall` AS select `users`.`uid` AS `uid`,`users`.`uname` AS `uname`,`users`.`upwd` AS `upwd`,`users`.`urealname` AS `urealname`,`users`.`uaite` AS `uaite`,`users`.`ustate` AS `ustate`,`users`.`utime` AS `utime`,`users`.`uonline` AS `uonline`,`usersinfo`.`uaddress` AS `uaddress`,`usersinfo`.`uabout` AS `uabout`,`usersinfo`.`udate` AS `udate`,`usersinfo`.`ulogo` AS `ulogo`,`usersinfo`.`ubg` AS `ubg`,`usersinfo`.`ufans` AS `ufans`,`usersinfo`.`utweet` AS `utweet`,`usersinfo`.`ucolor` AS `ucolor`,`usersinfo`.`ufollow` AS `ufollow` from (`users` join `usersinfo`) where (`users`.`uid` = `usersinfo`.`uid`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `utweets`
--

/*!50001 DROP VIEW IF EXISTS `utweets`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `utweets` AS select `users`.`uid` AS `uid`,`users`.`uname` AS `uname`,`users`.`upwd` AS `upwd`,`users`.`urealname` AS `urealname`,`users`.`uaite` AS `uaite`,`users`.`ustate` AS `ustate`,`users`.`utime` AS `utime`,`users`.`uonline` AS `uonline`,`usersinfo`.`uaddress` AS `uaddress`,`usersinfo`.`uabout` AS `uabout`,`usersinfo`.`udate` AS `udate`,`usersinfo`.`ulogo` AS `ulogo`,`usersinfo`.`ubg` AS `ubg`,`usersinfo`.`ufans` AS `ufans`,`usersinfo`.`utweet` AS `utweet`,`usersinfo`.`ufollow` AS `ufollow`,`usersinfo`.`ucolor` AS `ucolor`,`tweets`.`tcontent` AS `tcontent`,`tweets`.`ttime` AS `ttime`,`tweets`.`tpic` AS `tpic`,`tweets`.`tvideo` AS `tvideo`,`tweets`.`treply` AS `treply`,`tweets`.`tforward` AS `tforward`,`tweets`.`tlike` AS `tlike`,`tweets`.`tzhuan` AS `tzhuan`,`tweets`.`tid` AS `tid` from ((`users` join `usersinfo`) join `tweets`) where ((`tweets`.`uid` = `usersinfo`.`uid`) and (`users`.`uid` = `usersinfo`.`uid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-08 19:49:00
