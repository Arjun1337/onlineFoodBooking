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
-- Table structure for table `obforder`
--

DROP TABLE IF EXISTS `obforder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obforder` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_u_id` int(11) DEFAULT NULL COMMENT '用户外键',
  `o_s_id` int(11) DEFAULT NULL COMMENT '店铺外键',
  `o_detail` varchar(500) DEFAULT '' COMMENT '订单详细',
  `o_price` double DEFAULT '0' COMMENT '订单总价',
  `o_date` varchar(50) DEFAULT NULL COMMENT '下单时间',
  `o_status` varchar(20) DEFAULT NULL COMMENT '订单状态',
  PRIMARY KEY (`o_id`),
  KEY `o_u_id` (`o_u_id`),
  KEY `o_s_id` (`o_s_id`),
  CONSTRAINT `obforder_ibfk_1` FOREIGN KEY (`o_u_id`) REFERENCES `obfuser` (`u_id`),
  CONSTRAINT `obforder_ibfk_3` FOREIGN KEY (`o_s_id`) REFERENCES `obfstore` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obforder`
--

LOCK TABLES `obforder` WRITE;
/*!40000 ALTER TABLE `obforder` DISABLE KEYS */;
INSERT INTO `obforder` VALUES (10,3,2,'薯条:1|豪大大芝士爆浆鸡排:2|梅干地瓜:3|',62,'2016年10月11日 星期二','3'),(11,3,3,'白切鸡腿拼广州腊肠饭:5|',160,'2016年10月11日 星期二','3'),(12,3,2,'薯条:1|',6,'2016年10月13日 星期四','1'),(13,10,3,'白切鸡腿拼广州腊肠饭:1|',32,'2016年10月21日 星期五','3');
/*!40000 ALTER TABLE `obforder` ENABLE KEYS */;
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
