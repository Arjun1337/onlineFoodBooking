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
-- Table structure for table `obffood`
--

DROP TABLE IF EXISTS `obffood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obffood` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_s_id` int(11) DEFAULT NULL COMMENT '店铺外键',
  `f_name` varchar(30) DEFAULT '默认菜品名' COMMENT '菜品名称',
  `f_desc` varchar(100) DEFAULT '无' COMMENT '菜品描述',
  `f_number` int(11) DEFAULT '0' COMMENT '菜品数量',
  `f_price` double DEFAULT '0' COMMENT '菜品价格',
  `f_img` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`f_id`),
  KEY `f_s_id` (`f_s_id`),
  CONSTRAINT `obffood_ibfk_1` FOREIGN KEY (`f_s_id`) REFERENCES `obfstore` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obffood`
--

LOCK TABLES `obffood` WRITE;
/*!40000 ALTER TABLE `obffood` DISABLE KEYS */;
INSERT INTO `obffood` VALUES (2,2,'薯条','就是薯条',90,6,'resources/images/store/477117873633401a9d2c055c45f22498.jpeg'),(3,2,'豪大大芝士爆浆鸡排','boom！！！！',96,16,'resources/images/store/c936d5705065462a801b1ab32fa126a1.jpeg'),(5,2,'梅干地瓜','跟梅林没关系',96,8,'resources/images/store/da3ffe675f7a43ee885511b6c883f35b.jpeg'),(12,3,'白切鸡腿拼广州腊肠饭','就是不叫白斩鸡',92,32,'resources/images/store/4fa0fb1c525f429b86bb6d26052c00e7.jpeg'),(13,3,'8小时熬制咖喱牛腩','居然还没炖烂',98,30,'resources/images/store/fbceaa1831e34fd59d2235c97436543e.jpeg'),(14,3,'浙江小方烤','不是东坡肉！',100,28,'resources/images/store/a1a5479974b24389bc2892a99640f3b5.jpeg'),(15,3,'笋干烧南汁肉饭','南汁我也不知道是啥',100,25,'resources/images/store/5380575f51a543e5ac547a2190f38b5c.jpeg'),(16,3,'老上海片南汁肉','南汁是一种汁（大概）',100,25,'resources/images/store/febd2b4764504e75ad0ddb82be525872.jpeg'),(17,3,'黑椒杏鲍菇雪花牛仔粒','看上去很贵',100,35,'resources/images/store/74425c6870a04a76bf184baca4f73ccc.jpeg'),(22,4,'精品沙拉脆皮鸡饭','好吃,不贵',99,17,'resources/images/store/249eac9a35374e2db3e04c0775fa65c1.jpeg'),(23,4,'精品番茄脆皮鸡饭','番茄味',99,17.8,'resources/images/store/814791a839d645279a106ea63ee512f2.jpeg'),(24,4,'精品孜然脆皮鸡饭','孜然味',100,17.8,'resources/images/store/d6abf9e8968545f69687e2a3a513a851.jpeg'),(32,5,'蒜香蛏子','蒜香',100,25,'resources/images/store/5b8189883e49451da8df9d66215c3b81.jpeg'),(33,5,'蒜香花甲','好吃',100,15,'resources/images/store/4601d8c7ba8e4f85abafd1e7f84259c7.jpeg'),(34,5,'吮指蟹大脚','谢大脚',100,25,'resources/images/store/6faf922b49c64fc0a3cb49156672ab94.jpeg'),(35,5,'秘制花甲','秘制',100,15,'resources/images/store/112dbd68ebf14612abee340f9f028954.jpeg'),(36,5,'椒盐大虾','虾',100,30,'resources/images/store/858e8d748cb34bdb8ae066ee671c0b85.jpeg'),(37,5,'秘制蛏子','虫圣子',100,25,'resources/images/store/fe56ebb37047420a9809dddeb75a523c.jpeg'),(38,5,'秘制花甲粉砂锅','招牌菜',100,20,'resources/images/store/49fecd6a5f634b12ba951cce4191e928.jpeg'),(42,6,'广式小烧麦','广式',96,7,'resources/images/store/06ed43389a604dd79204fff9101280ac.jpeg'),(43,6,'紫薯卷','健康营养',100,8,'resources/images/store/a49808a091ee49338bbc21f264c725b2.jpeg'),(44,6,'天津小笼包','天津狗不理',100,10,'resources/images/store/1840e03303e74308ad358936c6261358.jpeg'),(45,6,'天津小笼汤包','汤包',100,8,'resources/images/store/9932797470064b03b58491f8ed9642c5.jpeg'),(46,6,'一品私厨灌汤蒸饺','灌汤哦',100,8,'resources/images/store/94e3f01a2e6541459dbd027e878be0cc.jpeg'),(53,7,'咖啡','蛤',100,5,'resources/images/store/57677c4e4aa6455ea2419b9c3620f6df.jpeg'),(54,7,'香酥鸡腿','蛤',100,7,'resources/images/store/eeafd91250d444ab84375495fcee915e.jpeg'),(55,7,'辣味鸡肉卷','蛤',100,10,'resources/images/store/f50b8c01b94144e683307b69810a9c2c.jpeg'),(56,7,'蜜汁手扒鸡','蛤',100,18,'resources/images/store/c7bff5b34e4148fcacc4e36db7a6fe28.jpeg'),(57,7,'玉米杯','蛤',100,5,'resources/images/store/e1950020f5514a87bb84dd96ddd0c531.jpeg'),(58,7,'香辣鸡腿堡','蛤',100,10,'resources/images/store/793fe8b5821e41be99000cdfc27d185d.jpeg'),(59,7,'超大鸡排','蛤',100,12,'resources/images/store/3c0ebccd0e804129bcee6f95db1cba70.jpeg'),(63,8,'鸡排','好吃',100,11,'resources/images/store/dc23e198e8f342b095e19e393d964579.jpeg'),(64,8,'珍珠鸡柳条','是珍珠鸡',100,10,'resources/images/store/079503dcecb141fa9b84523ef46c52b7.jpeg'),(65,8,'炸薯条','炸薯条',100,8,'resources/images/store/633a252abbd742b1b9e91f8ba0eb9347.jpeg'),(66,8,'上校鸡块','好吃',100,8,'resources/images/store/82f6457d511e4fa8848a24d76ecb0402.jpeg'),(67,8,'鸡翅','好吃',100,7,'resources/images/store/c0fb70778eaa4b90bdcad6d3a0782215.jpeg'),(68,8,'鸡块','外焦里嫩～～',100,7,'resources/images/store/7ee34555504b4481bf2b246d55e76065.jpeg'),(69,8,'鸡腿','本店主打菜品，外脆里嫩，保证你吃了不后悔～',100,6,'resources/images/store/bfe74990334244c8a920a7998ed49f22.jpeg'),(73,9,'韩式肉排盖饭','盖饭',100,18,'resources/images/store/ee40ba14b7a9447c9f3ce89d7b0a9278.jpeg'),(74,9,'松子玉米饼','好吃',100,15,'resources/images/store/418f8b78ae744d5b95a517aca6f9c168.jpeg'),(75,9,'泡菜饼','好吃',100,15,'resources/images/store/79d10ea20bb74829b4a220a1fd8e0a94.jpeg'),(76,9,'芝士牛肉石锅拌饭','招牌',100,18,'resources/images/store/47b53cfe50be4ef2887a74bab7ce8f08.jpeg'),(77,9,'鸡蛋包饭','好吃',100,16,'resources/images/store/d94271cb97574f29b1107a42c6eac28c.jpeg'),(78,9,'脆皮香蕉','嘎吱',100,12,'resources/images/store/c92bc34a057d4f4eac5730dc5d52ae2e.jpeg'),(83,2,'轰炸大鱿鱼','轰！轰！轰！轰！轰！',100,18,'resources/images/store/394b3fd964e64b09997297878d638b0a.jpeg'),(84,2,'鱿鱼须','克苏恩的触须',99,10,'resources/images/store/6bd22922daf54c77ad4c0df695e292b6.jpeg'),(97,2,'豪大大碳烤香超大鸡排','用的是真碳欸！',99,14,'resources/images/store/3a46e82e38d44bda8fe4151f0ac1e4bc.jpeg'),(98,2,'盐酥鸡','吃盐吃到酥的鸡',100,7,'resources/images/store/bb6280e6857142c380768be496cd5ab6.jpeg'),(99,2,'豪大大超大鸡排','炒鸡大的噢！',100,11,'resources/images/store/91cb95e51055432682881abcbeeadabd.jpeg');
/*!40000 ALTER TABLE `obffood` ENABLE KEYS */;
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
