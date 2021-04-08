CREATE DATABASE  IF NOT EXISTS `ourweb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ourweb`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: ourweb
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `conId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Suggestions` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`conId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (7,'王安琦','77gmail.com','很棒!'),(8,'小王','66@gmail.com','我要買更多'),(9,'123','77@gmail.com','22'),(10,'123','123@123','123');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counter` (
  `counter` int(11) NOT NULL,
  PRIMARY KEY (`counter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES (842);
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `manaId` varchar(45) NOT NULL,
  `manaName` varchar(45) NOT NULL,
  `manaPwd` varchar(200) NOT NULL,
  PRIMARY KEY (`manaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('10844222','張允澔','1234'),('cycu0109','洪智力','0109');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `memId` int(30) NOT NULL AUTO_INCREMENT,
  `memName` varchar(45) DEFAULT NULL,
  `memEmail` varchar(45) NOT NULL,
  `memPwd` varchar(45) NOT NULL,
  `memDate` varchar(45) DEFAULT NULL,
  `memAddress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`memId`,`memEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (29,'王浩浩','cycu22@gmail.com','22','2011-07-07','中壢區大仁街33號'),(30,'張琦琦','an7@gmail.com','77','2020-03-19','台中市160街'),(31,'金門王','km@gmail.com','km','2020-07-08','金門國'),(32,'King of Lion','asdf@gmail.com','asdfasdfasdf','2029-10-24','asdfasdfasdf'),(33,'張允蒿','ee@ee','520','2020-12-10','中壢368號45'),(34,'汪琦琦7','qq@gmail','555','2020-12-24','台中市335號'),(35,'秋又程6','uu@gmail','555','2021-01-23','中壢');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `msgId` int(45) NOT NULL AUTO_INCREMENT,
  `msgContent` varchar(45) DEFAULT NULL,
  `msgDate` varchar(45) DEFAULT NULL,
  `pdId` varchar(45) DEFAULT NULL,
  `memId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`msgId`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (26,'好帥ㄛ!!!','2021-01-01','1','29'),(27,'黑紅也太好看','2021-01-02','7','29'),(28,'有點難入手..','2021-01-02','13','29'),(29,'要剁手手了~','2021-01-05','22','29'),(30,'顏色好特別','2021-01-07','30','29'),(31,'真的很實用ㄟ','2021-01-09','48','29'),(32,'哇 好酷 可是買不起 QQ','2021-01-09','10','30'),(33,'圖案好帥 !','2021-01-09','25','30'),(34,'好想要阿 ','2021-01-09','7','30'),(35,'好想要阿 ','2021-01-09','7','30'),(36,'好喜歡 ','2021-01-09','7','30'),(37,'賽車手好帥~','2021-01-09','18','30'),(38,'好綠','2021-01-09','24','30'),(39,'CP值也太高了吧','2021-01-09','29','30'),(40,'最近真的很需要 !','2021-01-09','50','30'),(41,'彩繪好帥呀 !','2021-01-09','4','31'),(42,'買啦 哪次不買 !','2021-01-09','18','31'),(46,'真的很好戴ㄟ','2021-01-09','18','33'),(47,'好用打+1','2021-01-09','49','34'),(48,'讚ㄟ','2021-01-09','7','34'),(49,'還不錯','2021-01-09','4','35');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_form`
--

DROP TABLE IF EXISTS `order_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_form` (
  `oId` int(30) NOT NULL AUTO_INCREMENT,
  `oNumber` varchar(45) DEFAULT NULL,
  `memId` varchar(45) DEFAULT NULL,
  `pdName` varchar(45) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  `totalPrice` varchar(45) DEFAULT NULL,
  `receiverName` varchar(45) DEFAULT NULL,
  `receiverAddress` varchar(45) DEFAULT NULL,
  `payWay` varchar(45) DEFAULT NULL,
  `delivery` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_form`
--

LOCK TABLES `order_form` WRITE;
/*!40000 ALTER TABLE `order_form` DISABLE KEYS */;
INSERT INTO `order_form` VALUES (62,'0','29','GT-Air II (黑橘)','3','257840','王浩浩','中壢區大仁街33號','貨到付款','7-11','2021-01-01'),(63,'0','29','Skwal 2 (Logo款)','3','257840','王浩浩','中壢區大仁街33號','貨到付款','7-11','2021-01-01'),(64,'0','29','Pista GP RR 賽式款—黑紅','6','257840','王浩浩','中壢區大仁街33號','貨到付款','7-11','2021-01-01'),(65,'1','30','Spartan (野狼款)','2','57600','張琦琦','台中市160街','貨到付款','全家','2021-01-02'),(66,'1','30','X武士兩件式雨衣','2','57600','張琦琦','台中市160街','貨到付款','全家','2021-01-02'),(67,'1','30','RF-1200 (蜘蛛網)','3','57600','張琦琦','台中市160街','貨到付款','全家','2021-01-02'),(68,'2','31','x14 (PULL&BEAR 鬼神款)','3','72720','金門王','金門國','貨到付款','全家','2021-01-03'),(69,'2','31','Pista GP RR 賽式款—黑紅','1','72720','金門王','金門國','貨到付款','全家','2021-01-03'),(70,'3','31','SF-6 (特別款-藍)','1','3880','金門王','金門國','貨到付款','OK MART','2021-01-06'),(72,'4','33','x14 (經典霧面黑)','1','17080','張允蒿','中壢368號45樓','貨到付款','7-11','2021-01-07'),(73,'5','33','GT-Air II (藍)','7','100880','張允蒿','中壢368號45','貨到付款','7-11','2021-01-07'),(74,'6','34','K5 (消光灰)','2','22580','汪琦琦7','台中市336號','ATM轉帳繳費','7-11','2021-01-08'),(75,'7','34','Pista GP RR 賽式款—黯藍','1','31920','汪琦琦7','台中市335號','貨到付款','7-11','2021-01-09'),(76,'8','34','SF-6 (特別款-藍)','19','57840','汪琦琦7','台中市335號','貨到付款','7-11','2021-01-09'),(77,'9','35','K3SV (消光灰)','3','23516','秋又程6','中壢','貨到付款','7-11','2021-01-09');
/*!40000 ALTER TABLE `order_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pdId` int(30) NOT NULL AUTO_INCREMENT,
  `pdBrand` varchar(45) DEFAULT NULL,
  `pdKind` varchar(45) DEFAULT NULL,
  `pdName` varchar(45) DEFAULT NULL,
  `pdNote` varchar(300) DEFAULT NULL,
  `pdPrice` int(30) DEFAULT NULL,
  `pdStock` int(30) DEFAULT NULL,
  `pd_img_path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pdId`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'AGV','K1','K1 (黑)','K1系列-依照賽道帽設計，經過空氣力學及空洞測試，尾端擾流板(壓尾)可提昇騎乘表現及高速穩定性。190度全景鏡片具有寬闊的視野及防刮耐磨的特性。舒適的Dry-Comfort內襯皆可拆卸，並在雨天騎乘時達到最小程度的進水與不適感。帽體由4片分離式EPS樹脂組成，可分散撞擊的力道與反彈。',7800,100,'/K1/agvk1_B.jpg'),(2,'AGV','K1','K1 (消光灰)','K1系列-依照賽道帽設計，經過空氣力學及空洞測試，尾端擾流板(壓尾)可提昇騎乘表現及高速穩定性。190度全景鏡片具有寬闊的視野及防刮耐磨的特性。舒適的Dry-Comfort內襯皆可拆卸，並在雨天騎乘時達到最小程度的進水與不適感。帽體由4片分離式EPS樹脂組成，可分散撞擊的力道與反彈。',7800,100,'/K1/agvk1_G.jpg'),(3,'AGV','K1','K1 (白)','K1系列-依照賽道帽設計，經過空氣力學及空洞測試，尾端擾流板(壓尾)可提昇騎乘表現及高速穩定性。190度全景鏡片具有寬闊的視野及防刮耐磨的特性。舒適的Dry-Comfort內襯皆可拆卸，並在雨天騎乘時達到最小程度的進水與不適感。帽體由4片分離式EPS樹脂組成，可分散撞擊的力道與反彈。',7800,100,'/K1/agvk1_W.jpg'),(4,'AGV','K3SV','K3SV (黑)','K3 SV是一款價格適中的舒適帽款，實用的下拉式內墨片令騎乘時不畏懼豔陽，帽體經過空氣力學及空洞測試，尾端擾流板(壓尾)可提昇騎乘表現及高速穩定性。190度全景鏡片具有寬闊的視野及防刮耐磨的特性。舒適的Dry-Comfort內襯皆可拆卸，並在雨天騎乘時達到最小程度的進水與不適感。帽體由4片分離式EPS樹脂組成，可分散撞擊的力道與反彈。 ',8680,100,'/K3SV/agvk3_sv_B.jpg'),(5,'AGV','K3SV','K3SV (消光灰)','K3 SV是一款價格適中的舒適帽款，實用的下拉式內墨片令騎乘時不畏懼豔陽，帽體經過空氣力學及空洞測試，尾端擾流板(壓尾)可提昇騎乘表現及高速穩定性。190度全景鏡片具有寬闊的視野及防刮耐磨的特性。舒適的Dry-Comfort內襯皆可拆卸，並在雨天騎乘時達到最小程度的進水與不適感。帽體由4片分離式EPS樹脂組成，可分散撞擊的力道與反彈。 ',8680,97,'/K3SV/agvk3sv_G.jpg'),(6,'AGV','K3SV','K3SV (白)','K3 SV是一款價格適中的舒適帽款，實用的下拉式內墨片令騎乘時不畏懼豔陽，帽體經過空氣力學及空洞測試，尾端擾流板(壓尾)可提昇騎乘表現及高速穩定性。190度全景鏡片具有寬闊的視野及防刮耐磨的特性。舒適的Dry-Comfort內襯皆可拆卸，並在雨天騎乘時達到最小程度的進水與不適感。帽體由4片分離式EPS樹脂組成，可分散撞擊的力道與反彈。 ',8680,100,'/K3SV/agvk3_sv_W.jpg'),(7,'AGV','K5','K5 (黑)','K5是一款價格適中的舒適帽款，實用的下拉式內墨片令騎乘時不畏懼豔陽，帽體經過空氣力學及空洞測試，尾端擾流板(壓尾)可提昇騎乘表現及高速穩定性。190度全景鏡片具有寬闊的視野及防刮耐磨的特性。舒適的Dry-Comfort內襯皆可拆卸，並在雨天騎乘時達到最小程度的進水與不適感。帽體由4片分離式EPS樹脂組成，可分散撞擊的力道與反彈。',12500,100,'/K5/agvk5s_B.jpg'),(8,'AGV','K5','K5 (消光灰)','K5是一款價格適中的舒適帽款，實用的下拉式內墨片令騎乘時不畏懼豔陽，帽體經過空氣力學及空洞測試，尾端擾流板(壓尾)可提昇騎乘表現及高速穩定性。190度全景鏡片具有寬闊的視野及防刮耐磨的特性。舒適的Dry-Comfort內襯皆可拆卸，並在雨天騎乘時達到最小程度的進水與不適感。帽體由4片分離式EPS樹脂組成，可分散撞擊的力道與反彈。',12500,98,'/K5/agvk5s_G.jpg'),(9,'AGV','K5','K5 (白)','K5是一款價格適中的舒適帽款，實用的下拉式內墨片令騎乘時不畏懼豔陽，帽體經過空氣力學及空洞測試，尾端擾流板(壓尾)可提昇騎乘表現及高速穩定性。190度全景鏡片具有寬闊的視野及防刮耐磨的特性。舒適的Dry-Comfort內襯皆可拆卸，並在雨天騎乘時達到最小程度的進水與不適感。帽體由4片分離式EPS樹脂組成，可分散撞擊的力道與反彈。',12500,100,'/K5/agvk5s_W.jpg'),(10,'AGV','Pista GP RR','Pista GP RR 賽式款—黯藍','此頂安全帽是為了MotoGP™選手專用的純種賽道帽。',39800,99,'/Pista GP RR/agv_pista1.jpg'),(11,'AGV','Pista GP RR','Pista GP RR 賽式款—黑紅','此頂安全帽是為了MotoGP™選手專用的純種賽道帽。',39800,93,'/Pista GP RR/agv_pista2.jpg'),(12,'AGV','Pista GP RR','Pista GP RR 賽式款—太陽','此頂安全帽是為了MotoGP™選手專用的純種賽道帽。',39800,100,'/Pista GP RR/agv_pista5.jpg'),(13,'SHOEI','GT-Air II','GT-Air II (白)','GT-Air II 富有侵略性的x正統設計象徵著該系列GT-Air II繼承了顳部的形狀，這是GT-Air的象徵性設計，同時具有更前衛的外殼設計，與通風部件整合在一起，並從頭部的前部向後部流動。尖銳的下巴線和專用的通信系統安裝空間增加了重點。',18000,100,'/GT-Air II/shoei_gt_air11.jpg'),(14,'SHOEI','GT-Air II','GT-Air II (藍)','GT-Air II 富有侵略性的x正統設計象徵著該系列GT-Air II繼承了顳部的形狀，這是GT-Air的象徵性設計，同時具有更前衛的外殼設計，與通風部件整合在一起，並從頭部的前部向後部流動。尖銳的下巴線和專用的通信系統安裝空間增加了重點。',18000,93,'/GT-Air II/shoei_gt_air3.jpg'),(15,'SHOEI','GT-Air II','GT-Air II (黑橘)','GT-Air II 富有侵略性的x正統設計象徵著該系列GT-Air II繼承了顳部的形狀，這是GT-Air的象徵性設計，同時具有更前衛的外殼設計，與通風部件整合在一起，並從頭部的前部向後部流動。尖銳的下巴線和專用的通信系統安裝空間增加了重點。',18000,97,'/GT-Air II/shoei_gt_air7.jpg'),(16,'SHOEI','RF-1200','RF-1200 (蜘蛛網)','RF-1200在最負盛名的高級全罩式摩托車頭盔譜系中，RF-1200與之前的許多RF前輩一樣，是頭盔性能和技術的新巔峰。SHOEI的RF-1200是一款輕便，緊湊，流線型的頭盔，具有下一代功能，可在道路的各個方面以及某些方面做出規定。但是，不要僅僅因為評論家的面子價值而受到評論家的好評。該輪到您體驗騎RF-1200的刺激了。',13600,97,'/RF-1200/shoei_rf1200_3.jpg'),(17,'SHOEI','RF-1200','RF-1200 (美國國旗版)','RF-1200在最負盛名的高級全罩式摩托車頭盔譜系中，RF-1200與之前的許多RF前輩一樣，是頭盔性能和技術的新巔峰。SHOEI的RF-1200是一款輕便，緊湊，流線型的頭盔，具有下一代功能，可在道路的各個方面以及某些方面做出規定。但是，不要僅僅因為評論家的面子價值而受到評論家的好評。該輪到您體驗騎RF-1200的刺激了。',13600,100,'/RF-1200/shoei_rf1200_2.jpg'),(18,'SHOEI','x14','x14 (經典霧面黑)','x14 經過MOTO GP 所代表最頂級的公路比賽歷練而來的SHOEI 賽道安全帽〔X系列〕保障高安全性的同時，從頂級賽道支援中獲得的最先端技術，毫無保留的投入外觀、面鏡、內裝、空氣導流裝置，全部煥然一新。',17000,99,'/x14/shoei_x14_4.jpg'),(19,'SHOEI','x14','x14 (經典白)','x14 經過MOTO GP 所代表最頂級的公路比賽歷練而來的SHOEI 賽道安全帽〔X系列〕保障高安全性的同時，從頂級賽道支援中獲得的最先端技術，毫無保留的投入外觀、面鏡、內裝、空氣導流裝置，全部煥然一新。',17000,100,'/x14/shoei_x14_5.jpg'),(20,'SHOEI','x14','x14 (PULL&BEAR 鬼神款)','x14 經過MOTO GP 所代表最頂級的公路比賽歷練而來的SHOEI 賽道安全帽〔X系列〕保障高安全性的同時，從頂級賽道支援中獲得的最先端技術，毫無保留的投入外觀、面鏡、內裝、空氣導流裝置，全部煥然一新。',17000,97,'/x14/shoei_x14_9.jpg'),(21,'SHOEI','x14','x14 (PULL&BEAR 93)','x14 經過MOTO GP 所代表最頂級的公路比賽歷練而來的SHOEI 賽道安全帽〔X系列〕保障高安全性的同時，從頂級賽道支援中獲得的最先端技術，毫無保留的投入外觀、面鏡、內裝、空氣導流裝置，全部煥然一新。',17000,100,'/x14/shoei_x14_10.jpg'),(22,'SHARK','Race R Pro','Race R Pro Zarco 2017','Race R Pro 世界上第一個獲得FRHPhe-01認證的品牌。',19300,100,'/Race R Pro/shark_race_r_pro4.jpg'),(23,'SHARK','Race R Pro','Race R Pro Carbon Lorenzo 2019','Race R Pro 世界上第一個獲得FRHPhe-01認證的品牌。',19300,100,'/Race R Pro/shark_race_r_pro1.jpg'),(24,'SHARK','Skwal 2','Skwal 2 (Logo款)','Skwal 2擁有全新的內部裝潢，配有可充電LED燈，可在道路上提供更高的視野。SKWAL 2 有鮮明的外觀，其擾流板的纖薄運動型設計，再加上空氣動力學優化特性，使其成為運動和性能開發的頭盔。',9800,97,'/Skwal 2/shark_skwal_6.jpg'),(25,'SHARK','Spartan','Spartan (野狼款)','Spartan這款全罩式運動頭盔具有SHARK的核心及創新。精緻的設計和優化的空氣動力學性能，彰顯了其靈活而堅定的特性。快速防霧系統，可將鏡片打開並固定到抗霧位置，提升防霧效果。自動密封功能：將鏡片密封在頭盔上，提供更好的隔音效果，並使頭盔具有防水，防寒能力。',14300,98,'/Spartan/shark_spartan_7.jpg'),(26,'SHARK','Spartan','Spartan (黑銀)','Spartan這款全罩式運動頭盔具有SHARK的核心及創新。精緻的設計和優化的空氣動力學性能，彰顯了其靈活而堅定的特性。快速防霧系統，可將鏡片打開並固定到抗霧位置，提升防霧效果。自動密封功能：將鏡片密封在頭盔上，提供更好的隔音效果，並使頭盔具有防水，防寒能力。',14300,100,'/Spartan/shark_spartan_5.jpg'),(27,'SOL','68SII','68SII (黑)','68SII 經典跑車造型鴨尾，讓安全帽升級成為時尚配件。可拆式小鼻罩，避免呼吸時的熱氣在鏡片上凝結霧氣，確保視線清晰。通過美國DOT及台灣CNS安全認證。DOT測試內容包含穿透測試、撞擊測試、視野角度測試等，為消費者的安全提供保障。扣具採用金屬雙D扣，是國際上公認最安全的扣具。市面上常見的插扣，在撞擊時容易斷裂或彈開，造成安全帽飛脫而失去保護作用。大鏡片，採用抗UV400鏡片，同樣通過DOT安全認證，護眼又安全，用腳踩也不會破。快拆式鏡片設計，不需任何工具即可自行更換大鏡片。',3125,100,'/68SII/SOL_68SII_1.jpg'),(28,'SOL','SF-2','SF-2 (浮世繪-粉)','SF-2輕量化設計，適合全罩式新手，體型嬌小者也能舒適配戴。可拆式小鼻罩，避免呼吸時的熱氣在鏡片上凝結霧氣，確保視線清晰。與SF-2M為情侶款設計。SF-2帽體較小，適合女生。通過美國DOT及台灣CNS安全認證。DOT測試內容包含穿透測試、撞擊測試、視野角度測試等，為消費者的安全提供保障。扣具採用金屬雙D扣，是國際上公認最安全的扣具。市面上常見的插扣，在撞擊時容易斷裂或彈開，造成安全帽飛脫而失去保護作用。',2925,100,'/SF-2/SOL_SF2_3.jpg'),(29,'SOL','SF-3','SF-3 (黑橘)','SF-3  SOL全罩式安全帽，一直以來堅持安全保護性與舒適包覆性為研發設計重點，2016新款上市SF-3承襲SOL全罩式系列產品優勢，在研發設計上綜合了SF-2M的輕量通風；SF-5的舒適安全包覆性，同時通過DOT、ECE、CNS三項安全規範的合格認證，誕生內外在同等優異的全新帽款 ─ SF-3，將呈現給您優越的舒適感受。',3300,100,'/SF-3/SOL_SF3_5.jpg'),(30,'SOL','SF-6','SF-6 (特別款-藍)','SF-6 高強度厚鏡片，提升韌性及剛性。鏡片鎖系統，高速騎乘時更穩定。',3800,80,'/SF-6/SOL_SF6_3.jpg'),(48,'EX','recoder','SJ5000X行車紀錄器','SJ 5000X Elite兩吋大螢幕 4K 24fps / 2K 30fps /1080p 60fps 攝影 1200萬畫素 具備Wi-Fi與手機連線，透過SJCAM app遙控、下載影像 陀螺儀防手震 （電子三軸） FOV 攝影角度調整 慢動作高速攝影 縮時攝影 畸形校正 高速連拍 潛水攝影模式（不需外裝紅色校色片） 錄影收音音量調整 商品規格 鏡頭：SONY IMX078 標準檢驗局商品檢驗通過：BSMI字號 D39755 NCC合格字號:CCAJ15LP5601T5 最高支援到128G記憶卡',2899,100,'/recoder.png'),(49,'EX','earphone','BK-S1藍牙耳機','全球獨步混音技術(Audio Mixer) 對講&A2DP混音技術 當您使用手機享受音樂/手機導航音訊時，在前後對講通話中，前後座都聽到各自手機的音訊的來源。 GPS混音技術 當您使用Garmin 660導航機時，在前後對講通話中，前座&後座都可以聽到Garmin 660導航機。 手機、GPS混音技術 當同時連接手機和Garmin 660時，在手機通話中，可以同時接收來自GPS路況訊息。',2000,100,'/earphone.png'),(50,'EX','raincoat','X武士兩件式雨衣','X武士斜開兩件式風雨衣',1250,98,'/raincoat.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `randad`
--

DROP TABLE IF EXISTS `randad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `randad` (
  `ADID` int(11) NOT NULL,
  `file_path` varchar(45) NOT NULL,
  `ad_file` varchar(45) NOT NULL,
  `link` varchar(45) NOT NULL,
  `Alternate` varchar(45) NOT NULL,
  `ADContent` varchar(45) NOT NULL,
  PRIMARY KEY (`ADID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `randad`
--

LOCK TABLES `randad` WRITE;
/*!40000 ALTER TABLE `randad` DISABLE KEYS */;
INSERT INTO `randad` VALUES (1,'images','AD/HONDA4.jpg','moto.honda-taiwan.com.tw/News/Index/3','HONDA','HONDA'),(2,'images','AD/BMW5.jpg','www.bmw-motorrad.tw/zh/home.html','BMW','BMW'),(3,'images','AD/DUCATI6.jpg','ducatitaiwan.com.tw/','杜卡迪','杜卡迪');
/*!40000 ALTER TABLE `randad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingcart` (
  `carId` int(30) NOT NULL AUTO_INCREMENT,
  `memId` varchar(45) DEFAULT NULL,
  `pdId` varchar(45) DEFAULT NULL,
  `pdName` varchar(45) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  `sumPrice` int(30) DEFAULT NULL,
  PRIMARY KEY (`carId`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart`
--

LOCK TABLES `shoppingcart` WRITE;
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
INSERT INTO `shoppingcart` VALUES (132,'32','4','K3SV (黑)','1',8680),(133,'32','4','K3SV (黑)','1',8680),(134,'32','4','K3SV (黑)','99',859320),(135,'32','5','K3SV (消光灰)','100',868000),(146,'35','4','K3SV (黑)','2',17360);
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-09 12:45:27
