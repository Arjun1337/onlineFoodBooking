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
-- Table structure for table `obfuser`
--

DROP TABLE IF EXISTS `obfuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obfuser` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_account` varchar(20) NOT NULL COMMENT '用户账号',
  `u_pwd` varchar(20) NOT NULL COMMENT '用户密码',
  `u_name` varchar(20) NOT NULL DEFAULT '用户' COMMENT '用户名称',
  `u_street` varchar(30) NOT NULL DEFAULT '无' COMMENT '用户所在街道',
  `u_address` varchar(50) NOT NULL DEFAULT '无' COMMENT '用户详细地址',
  `u_phone` varchar(18) NOT NULL DEFAULT '00000000' COMMENT '用户手机',
  `u_power` int(11) NOT NULL COMMENT '用户权限',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obfuser`
--

LOCK TABLES `obfuser` WRITE;
/*!40000 ALTER TABLE `obfuser` DISABLE KEYS */;
INSERT INTO `obfuser` VALUES (3,'james','123','james_gordon','歌谭市','歌谭市警察局','0000-8198812',2),(4,'bruce','123','Bruce_Wayne','歌谭市','歌谭市歌谭大厦','0000-8198812',2),(5,'penguin','123','Oswald_Cobblepot','阿克汉姆','阿克汉姆精神病院','0000-8198812',2),(6,'alfred','123','Alfred_Pennyworth','歌谭市','歌谭市韦恩庄园','0000-8198812',2),(7,'riddler','123','Edward_Nygma','阿克汉姆','阿克汉姆精神病院','0000-8198812',2),(8,'joke','123','jooooooke','阿克汉姆','阿克汉姆','0000-8198812',2),(9,'admin','123','admin','-','-','-',0),(10,'asd','123','asd','asd','asd','13111111111',1),(11,'tom','123','toom','this','there','13232322323',1),(12,'mute','123123','mute!','chinax','changzhou','13232323233',2);
/*!40000 ALTER TABLE `obfuser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-31 13:26:05
