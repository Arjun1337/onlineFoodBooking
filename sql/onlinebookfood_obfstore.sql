-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: onlinebookfood
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `obfstore`
--

DROP TABLE IF EXISTS `obfstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obfstore` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_u_id` int(11) DEFAULT NULL COMMENT '用户外键',
  `s_name` varchar(20) DEFAULT '默认店铺名称' COMMENT '店铺名称',
  `s_desc` varchar(100) DEFAULT '无' COMMENT '店铺描述',
  `s_point` int(11) DEFAULT '0' COMMENT '店铺评分',
  `s_allsale` double DEFAULT '0' COMMENT '店铺销售量',
  `s_status` varchar(20) DEFAULT NULL COMMENT '店铺状态',
  `s_img` varchar(500) DEFAULT NULL,
  `s_certimg` varchar(500) DEFAULT NULL,
  `s_endtime` varchar(50) DEFAULT NULL,
  `s_address` varchar(255) DEFAULT NULL,
  `s_starttime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `s_u_id` (`s_u_id`),
  CONSTRAINT `obfstore_ibfk_1` FOREIGN KEY (`s_u_id`) REFERENCES `obfuser` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obfstore`
--

LOCK TABLES `obfstore` WRITE;
/*!40000 ALTER TABLE `obfstore` DISABLE KEYS */;
INSERT INTO `obfstore` VALUES (2,4,'豪大大鸡排','好吃不贵',4,126,'3','resources/images/store/6cc8a1130ef947b0983865f61ce222ff.jpeg','ydasfzll/certificate.jpg','06:30 PM','武进区19号','08:30 AM'),(3,4,'武进肉惑创意联盟餐吧','超人快递，享受飞一样的感觉',3,313,'3','resources/images/store/a55dafeaaa6d46a4a01fc8a51714a8d7.jpeg','crdxd/certificate.jpg',NULL,NULL,NULL),(4,4,'脆皮鸡饭烤肉拌饭','i am batman',3,102,'3','resources/images/store/7b5c4775c01c479d980bc9bea72066ef.jpeg','bfztxct/certificate.jpg','07:30 PM','武进区15号','08:30 AM'),(5,5,'海非海特色餐饮','企鹅酒吧，歌谭市最好的酒吧',4,100,'3','resources/images/store/8b79c1b7a4f74550a3a44ef601ec0d38.jpeg','qejbws/certificate.jpg','06:30 PM','武进区15号','08:30 AM'),(6,5,'周韩小笼汤包馆','村里开的西餐店，能不好吗？',4,102,'3','resources/images/store/0b540b16a31e484cb0b3eda00223b746.jpeg','xfcxcd/certificate.jpg','06:30 PM','武进区15号','08:30 AM'),(7,6,'华莱士','无农药，无话费，纯天然',4,100,'3','resources/images/store/61b3670074424709892773369e4d161b.jpeg','wezysg/certificate.jpg','06:30 PM','武进区15号','08:30 AM'),(8,7,'潘大师炸鸡腿','什么剑是透明的？',2,100,'3','resources/images/store/2b52a589c8fc443b8f09ae4f92f9c4fc.jpeg','wzdnxcsm/certificate.jpg','06:30 PM','武进区15号','08:30 AM'),(9,8,'这一家韩式料理','it is joke',2,100,'3','resources/images/store/8e2f9da2e7744b29827414ae12c48600.jpeg','xczttpd/certificate.jpg','06:30 PM','武进区15号','08:30 AM');
/*!40000 ALTER TABLE `obfstore` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-31 13:26:04
