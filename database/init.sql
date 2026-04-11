CREATE DATABASE  IF NOT EXISTS `fresh_rss_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fresh_rss_db`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: fresh_rss_db
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

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
-- Table structure for table `Categorie_pin`
--

DROP TABLE IF EXISTS `Categorie_pin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categorie_pin` (
  `Id_categorie` int NOT NULL AUTO_INCREMENT,
  `label_Categorie` varchar(255) NOT NULL,
  PRIMARY KEY (`Id_categorie`),
  KEY `ix_Categorie_pin_label_Categorie` (`label_Categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorie_pin`
--

LOCK TABLES `Categorie_pin` WRITE;
/*!40000 ALTER TABLE `Categorie_pin` DISABLE KEYS */;
INSERT INTO `Categorie_pin` VALUES (2,'Coloré_lumineux'),(1,'Minimalist'),(4,'techniques'),(3,'Thématiques');
/*!40000 ALTER TABLE `Categorie_pin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pins_Images`
--

DROP TABLE IF EXISTS `Pins_Images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pins_Images` (
  `Pin_id` int NOT NULL AUTO_INCREMENT,
  `article_id` varchar(255) NOT NULL,
  `Pin_url` text NOT NULL,
  `Pin_local_path` varchar(500) DEFAULT NULL,
  `Pin_source` varchar(255) NOT NULL,
  `Jobs` text NOT NULL,
  `score` int DEFAULT NULL,
  `Pin_categorie` varchar(255) NOT NULL,
  `Pin_SubCategorie` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `Pin_title` varchar(255) NOT NULL,
  `Pin_keywords` text NOT NULL,
  `Pin_Ambiance` text NOT NULL,
  PRIMARY KEY (`Pin_id`),
  KEY `ix_Pins_Images_Pin_source` (`Pin_source`),
  KEY `ix_Pins_Images_article_id` (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pins_Images`
--

LOCK TABLES `Pins_Images` WRITE;
/*!40000 ALTER TABLE `Pins_Images` DISABLE KEYS */;
INSERT INTO `Pins_Images` VALUES (1,'tag:google.com,2005:reader/item/00064d1117558e51','https://i.pinimg.com/originals/19/64/e3/1964e3e772fe5a1729e9d7eeb93d80f7.jpg',NULL,'twilightsunset3 - desktop-setup - Pinterest Bridge','Content Creator',9,'3','9','2026-03-31 11:50:56','Kawaii setup','kawaii, pink, cute, sweet','1 monitor, 1 laptop, 1 keyboard, 1 mouse, 1 headset, 1 mug, 1 lamp, 1 rainbow lamp, 1 computer, 1 fan, 1 clock, several figurines'),(2,'tag:google.com,2005:reader/item/00064d1117558e4e','https://i.pinimg.com/originals/74/a7/0e/74a70e05c93c4d7f0faaccc97fdb5852.jpg',NULL,'twilightsunset3 - desktop-setup - Pinterest Bridge','Content Creator',9,'4','13','2026-03-31 11:51:02','Kawaii setup','kawaii, pastel colors, plants, cute','many plants, pink and green decorations,  pastel colors'),(3,'tag:google.com,2005:reader/item/00064d1117558e4d','https://i.pinimg.com/originals/e9/ca/40/e9ca4002b1a15697c98867905dd1818d.jpg',NULL,'twilightsunset3 - desktop-setup - Pinterest Bridge','Content Creator',8,'3, 3','11, 9','2026-03-31 11:51:19','Cottagecore Kawaii Setup','whimsical, pastel, purple, cute','2 monitors, 1 keyboard, 1 mouse, 1 microphone, 1 shelf with decorations, 1 plant wall, 1 purple lamp'),(4,'tag:google.com,2005:reader/item/00064bfd6973bf37','https://i.pinimg.com/originals/67/4d/51/674d5129deafda835acb1a195e3cedfd.jpg',NULL,'twilightsunset3 - desktop-setup - Pinterest Bridge','Content Creator',9,'3','9','2026-03-31 11:51:37','Kawaii gaming setup','kawaii, pink, cute, gaming','2 monitors, 1 pink keyboard, 1 pink mouse, 1 pink speaker, 1 figurine, 1 plant'),(5,'tag:google.com,2005:reader/item/00064b46071c24c1','https://i.pinimg.com/originals/2b/87/52/2b8752eba917eb912dad92b695ae8984.jpg',NULL,'twilightsunset3 - desktop-setup - Pinterest Bridge','Content Creator',9,'3','9','2026-03-31 11:52:26','Kawaii Setup','kawaii, pink, cute, gaming, setup','1 monitor, 1 keyboard, 1 mousepad, 1 mouse, several figurines'),(6,'tag:google.com,2005:reader/item/00064b46071c24c0','https://i.pinimg.com/originals/c7/75/f3/c775f31a84b5a4796ae3c099f95ea3f6.jpg',NULL,'twilightsunset3 - desktop-setup - Pinterest Bridge','Content Creator',9,'3','9','2026-03-31 11:52:35','Kawaii Setup','kawaii, cute, pink, gaming, content creation','2 screens, 1 laptop, 1 keyboard, 1 mouse, anime posters, figurines, pink flowers'),(7,'tag:google.com,2005:reader/item/00064b46071c24bf','https://i.pinimg.com/originals/39/f0/4e/39f04e97cb8e12a927feef452e165b2b.jpg',NULL,'twilightsunset3 - desktop-setup - Pinterest Bridge','Content Creator, Video Editor',8,'4, 2','13, 8','2026-03-31 11:52:45','Dreamy Setup','dreamy, cozy, minimalist','1 laptop, 1 monitor, 1 keyboard, 1 chair, 1 plant, 1 neon light'),(8,'tag:google.com,2005:reader/item/00064b46071c24be','https://i.pinimg.com/originals/4a/b7/f3/4ab7f327b43791ef8b8e79c431eabcad.jpg',NULL,'twilightsunset3 - desktop-setup - Pinterest Bridge','Content Creator',8,'4','13','2026-03-31 11:53:03','Ghibli-core','Ghibli, Cute, Colorful, Whimsical, Fantasy','1 mechanical keyboard, 2 figurines, 1 plant, 1 lamp, neon sign'),(9,'tag:google.com,2005:reader/item/00064b46071c24bd','https://i.pinimg.com/originals/09/aa/cc/09aacc41567df9a8b565c35be065c9d5.jpg',NULL,'twilightsunset3 - desktop-setup - Pinterest Bridge','Content Creator',9,'3','9','2026-03-31 11:53:11','Kawaii Setup','kawaii, pink, anime, cute, gaming','2 monitors, 1 pink keyboard, 1 white mouse, 1 pink mousepad, 2 white speakers'),(10,'tag:google.com,2005:reader/item/00064b46071c24bc','https://i.pinimg.com/originals/db/e9/76/dbe976bde003ef2c583469461a73de29.jpg',NULL,'twilightsunset3 - desktop-setup - Pinterest Bridge','Content Creator',8,'3, 3','11, 9','2026-03-31 11:53:19','Kawaii Cottagecore Setup','pink, white, kawaii, cottagecore','1 monitor, 1 keyboard, 1 mouse, 1 computer, 1 pink chair, 1 pink stool, 1 blanket, 1 butterfly neon sign, 1 honeycomb lamp'),(11,'tag:google.com,2005:reader/item/00064b46071c24bb','https://i.pinimg.com/originals/6d/61/9b/6d619b497c97e0d40348570dc2b3bd13.jpg',NULL,'twilightsunset3 - desktop-setup - Pinterest Bridge','Content Creator',9,'3','11','2026-03-31 11:53:30','Cozy Cottagecore Setup','cozy, cute, calm','2 plants, 1 lamp, 1 candle, 1 mousepad'),(12,'tag:google.com,2005:reader/item/00064b46071c24ba','https://i.pinimg.com/originals/f3/32/06/f3320611a77614d439e9f382f889dfb5.jpg',NULL,'twilightsunset3 - desktop-setup - Pinterest Bridge','Content Creator',9,'3, 3','10, 9','2026-03-31 11:53:37','Kawaii Ghibli-core Setup','cute, kawaii, ghibli, dreamy','1 monitor, 1 keyboard, 1 mouse, 1 computer, 1 headset, several plants, several figurines and decorations'),(13,'tag:google.com,2005:reader/item/00064d963b0ada7c','https://i.pinimg.com/originals/bc/60/a4/bc60a48dc989a708edb66eb39da4e695.jpg',NULL,'twilightsunset3 - desktop-setup - Pinterest Bridge','Content Creator',9,'3','9','2026-03-31 13:01:09','Kawaii Setup','Sanrio, Kuromi, My Melody, Cute, Pastel','2 monitors, 1 keyboard, 1 mousepad, 1 computer'),(14,'tag:google.com,2005:reader/item/00064adb8937094c','https://i.pinimg.com/originals/73/a8/a3/73a8a375b414dca3398a413c7c528555.jpg',NULL,'ZykoUK_ - dark-decor-ideas - Pinterest Bridge','Content Creator, Developer',8,'1','1','2026-04-01 00:00:14','Minimalist Dark Setup','minimalist, dark, productivity','2 plants, 1 incense, 1 headphone, 1 desk lamp'),(15,'tag:google.com,2005:reader/item/00064e51a3c628ce','https://i.pinimg.com/originals/22/32/b0/2232b02c08b2d46640c4b1048e2b9d9e.jpg',NULL,'twilightsunset3-2','Content Creator',9,'3, 3','11, 9','2026-04-01 00:00:23','Kawaii Dreamy Setup','kawaii, cottagecore, dreamy','2 monitors, 1 keyboard, 1 mouse, neon lights, funko pop'),(16,'tag:google.com,2005:reader/item/00064adb787cfa3f','https://i.pinimg.com/originals/27/95/0f/27950fdcbd7304f6e9c892256ca86401.jpg',NULL,'ZykoUK_ - kawaii-decor-ideas - Pinterest Bridge','Content Creator, Gamer',9,'2','7','2026-04-01 00:02:57','Cyberpunk Setup','cyberpunk, anime, gaming','1 computer with blue lights, 1 figurine, 1 robot'),(17,'tag:google.com,2005:reader/item/00064adb787cfa3e','https://i.pinimg.com/originals/2a/c5/bf/2ac5bf94ff92f5b1d77bb60780697020.jpg',NULL,'ZykoUK_ - kawaii-decor-ideas - Pinterest Bridge','Content Creator',8,'3','9','2026-04-01 00:03:05','Kawaii Setup','cute, pink, playful','1 monitor, 2 keyboards, 1 mouse, several stuffed animals'),(18,'tag:google.com,2005:reader/item/00064adb787cfa3c','https://i.pinimg.com/originals/0d/56/22/0d562292ca66bd0f580a4a4a2843b8f2.jpg',NULL,'ZykoUK_ - kawaii-decor-ideas - Pinterest Bridge','Content Creator',8,'3','9','2026-04-01 00:03:25','Cinnamoroll Theme Setup','Kawaii, Cute, Cinnamoroll','1 desk, 1 chair, 1 computer, 1 monitor, 1 plant, 1 poster, 1 rug'),(19,'tag:google.com,2005:reader/item/00064adb787cfa3b','https://i.pinimg.com/originals/8e/8f/b0/8e8fb013db03fbe4730677f07112bfa0.jpg',NULL,'ZykoUK_ - kawaii-decor-ideas - Pinterest Bridge','Content Creator, Gamer',9,'3','9','2026-04-01 00:03:34','Kawaii Gaming Setup','kawaii, pink, gaming, neon','1 pink chair, 1 white table, 1 black tv, 1 rainbow neon sign, 1 guitar, 1 shelf with games, 1 shelf with consoles, 1 curtain with lights, 1 stuffed animal'),(20,'tag:google.com,2005:reader/item/00064adb787cfa3a','https://i.pinimg.com/originals/7d/42/5b/7d425b25eaa3e167f33f1b5300cf78fb.jpg',NULL,'ZykoUK_ - kawaii-decor-ideas - Pinterest Bridge','Content Creator',9,'3','9','2026-04-01 00:03:42','Kawaii Setup','kawaii, cute, pastel colors','2 monitors, 1 keyboard, 1 computer, several figurines and decorations'),(21,'tag:google.com,2005:reader/item/00064adb787cfa38','https://i.pinimg.com/originals/f0/98/30/f09830106ea44cc56d1b54b88eca3675.jpg',NULL,'ZykoUK_ - kawaii-decor-ideas - Pinterest Bridge','Content Creator',9,'4','13','2026-04-01 00:03:56','Kawaii Setup','kawaii, cute, pink, gaming, content creation','1 pink gaming chair, 1 purple plushie, 1 white desk, 1 pink keyboard, 1 monitor'),(22,'tag:google.com,2005:reader/item/00064d963b0ada7d','https://i.pinimg.com/originals/60/70/fb/6070fb3a7e2213f8b6ca8acff02eabda.jpg',NULL,'ZykoUK_ - dark-decor-ideas - Pinterest Bridge','Gamer, Content Creator',8,'4, 1','14, 1','2026-04-01 00:04:29','Hardcore Enthusiast Minimalist Dark Setup','gaming, dark, minimalist','1 lamp, 1 monitor, 1 computer, 1 keyboard, 1 mouse, 1 headphones, 2 speakers'),(23,'tag:google.com,2005:reader/item/00064d963b0ada7b','https://i.pinimg.com/originals/ad/fe/76/adfe76dfd8dc55bf9c766c52c5c05963.jpg',NULL,'ZykoUK_ - dark-decor-ideas - Pinterest Bridge','Gamer, Content Creator',8,'2, 4','7, 14','2026-04-01 00:04:37','Cyberpunk Hardcore Enthusiast Setup','gaming, cyberpunk, hardcore, enthusiast','1 monitor, 1 keyboard, 1 mouse, 1 computer tower, 1 chair'),(24,'tag:google.com,2005:reader/item/00064adb89370957','https://i.pinimg.com/originals/30/34/f2/3034f2032fc0a0b7968bf4134545cf63.jpg',NULL,'ZykoUK_ - dark-decor-ideas - Pinterest Bridge','Gamer, Content Creator',9,'2, 4','7, 14','2026-04-01 00:05:01','Cyberpunk Gaming Setup','gaming, cyberpunk, hardcore, enthusiast','2 monitors, 1 gaming chair, 1 bed, several posters'),(25,'tag:google.com,2005:reader/item/00064adb89370956','https://i.pinimg.com/originals/6e/b2/a0/6eb2a0b0885894c10b96fc122a59932f.jpg',NULL,'ZykoUK_ - dark-decor-ideas - Pinterest Bridge','Gamer, Content Creator',8,'1','1','2026-04-01 00:05:09','Dark Minimalist Gaming Setup','Dark, Minimalist, Gaming','2 monitors, 1 mechanical keyboard, 1 gaming mouse'),(26,'tag:google.com,2005:reader/item/00064adb89370955','https://i.pinimg.com/originals/f6/8a/e2/f68ae2bd911dbe8881452f5fd272ce58.jpg',NULL,'ZykoUK_ - dark-decor-ideas - Pinterest Bridge','Content Creator, Gamer',8,'1, 2','1, 6','2026-04-01 00:05:17','Setup Minimalist Dark aesthetic','Anime, Dark, Minimalist','1 desk lamp, 1 computer, 1 monitor, 1 mechanical keyboard'),(27,'tag:google.com,2005:reader/item/00064adb89370954','https://i.pinimg.com/originals/9a/6a/cf/9a6acfaa2ebe3a33d7dae66b9d983743.jpg',NULL,'ZykoUK_ - dark-decor-ideas - Pinterest Bridge','Gamer, Content Creator, Hardcore Enthusiast',9,'2, 1','7, 1','2026-04-01 00:05:25','Cyberpunk Dark Aesthetic','dark, minimalist, cyberpunk, gaming, setup','1 desk, 1 chair, 1 computer, 1 monitor, 1 keyboard, 1 mousepad, 1 mouse, 1 headset, 2 plants, 2 framed posters'),(28,'tag:google.com,2005:reader/item/00064adb89370953','https://i.pinimg.com/originals/ff/d2/c0/ffd2c0d7a6ae65f1ac20e2a703fc15d8.jpg',NULL,'ZykoUK_ - dark-decor-ideas - Pinterest Bridge','Gamer, Content Creator',8,'1, 2, 2','1, 6, 5','2026-04-01 00:05:32','Minimalist Dark Gaming Setup','gaming, retro, minimalist','1 desk lamp, 1 computer monitor, 1 keyboard, 1 mouse'),(29,'tag:google.com,2005:reader/item/00064adb89370952','https://i.pinimg.com/originals/f3/c5/7d/f3c57d39e5a69103d5e6a5afde6eea8f.jpg',NULL,'ZykoUK_ - dark-decor-ideas - Pinterest Bridge','Gamer, Content Creator',9,'2','7','2026-04-01 00:05:40','Cyberpunk Gaming Setup','neon, rgb, gaming','3 screens, 1 keyboard, 1 mouse, 1 chair, 1 desk, 1 lamp, blue and purple lights'),(30,'tag:google.com,2005:reader/item/00064adb89370951','https://i.pinimg.com/originals/cf/14/e9/cf14e950062c15dc1ac6945d69f74927.jpg',NULL,'ZykoUK_ - dark-decor-ideas - Pinterest Bridge','Content Creator, Gamer',9,'4, 2','13, 7','2026-04-01 00:05:50','Cyberpunk Content Creator Setup','cyberpunk, gaming, content creator','1 mechanical keyboard, 1 desk lamp, 1 computer monitor, 1 gaming chair'),(31,'tag:google.com,2005:reader/item/00064adb89370950','https://i.pinimg.com/originals/ab/f2/ea/abf2eab7ab6f5cf78acccf93b3947a7e.jpg',NULL,'ZykoUK_ - dark-decor-ideas - Pinterest Bridge','Content Creator, Gamer',9,'2, 4','7, 14','2026-04-01 00:05:58','Cyberpunk aesthetic','futuristic, gaming, high-tech','blue lights, black couch, large TV'),(32,'tag:google.com,2005:reader/item/00064adb8937094f','https://i.pinimg.com/originals/43/3f/e7/433fe7e210b89dd0a81399b7abb78c3f.jpg',NULL,'ZykoUK_ - dark-decor-ideas - Pinterest Bridge','Content Creator',8,'1','1','2026-04-01 00:06:06','Minimalist Dark','dark, minimalist, productivity','1 desk lamp, 1 computer, 1 chair'),(33,'tag:google.com,2005:reader/item/00064adb8937094d','https://i.pinimg.com/originals/6b/7a/25/6b7a25c2a32fcfafc07f8549e855471d.jpg',NULL,'ZykoUK_ - dark-decor-ideas - Pinterest Bridge','Content Creator',9,'1','1','2026-04-01 00:06:23','Minimalist Dark Setup','dark, minimalist, gaming, productivity','2 monitors, 1 keyboard, 1 mouse, 1 plant, 1 lamp, 1 guitar picture, 1 anime picture, 1 forest picture'),(34,'tag:google.com,2005:reader/item/00064e51a3c628e0','https://i.pinimg.com/originals/bc/60/a4/bc60a48dc989a708edb66eb39da4e695.jpg',NULL,'twilightsunset3-2','Content Creator',9,'3','9','2026-04-01 00:06:34','Kawaii Setup','kawaii, cute, pink, white','2 monitors, 1 keyboard, 1 mousepad, 1 computer'),(35,'tag:google.com,2005:reader/item/00064e51a3c628df','https://i.pinimg.com/originals/19/64/e3/1964e3e772fe5a1729e9d7eeb93d80f7.jpg',NULL,'twilightsunset3-2','Content Creator',9,'3, 3','11, 9','2026-04-01 00:06:43','Kawaii Setup','kawaii, cute, pink, sweet, gaming','1 Monitor, 1 Laptop, 1 pink keyboard, 1 pink mousepad, 1 pink chair, 1 rainbow lamp, 1 figurine, 1 clock, 1 cup, 1 lamp'),(36,'tag:google.com,2005:reader/item/00064e51a3c628de','https://i.pinimg.com/originals/74/a7/0e/74a70e05c93c4d7f0faaccc97fdb5852.jpg',NULL,'twilightsunset3-2','Content Creator, Streamer',8,'4, 3','13, 9','2026-04-01 00:06:51','Pastel Gamer Setup','pastel, kawaii, gaming, content creation','2 monitors, 1 mechanical keyboard, 1 pink computer case, many plants, figurines, cute artwork'),(37,'tag:google.com,2005:reader/item/00064e51a3c628dd','https://i.pinimg.com/originals/e9/ca/40/e9ca4002b1a15697c98867905dd1818d.jpg',NULL,'twilightsunset3-2','Content Creator',9,'4','13','2026-04-01 00:06:59','Dreamy','Dreamy, Cottagecore, Kawaii','2 monitors, 1 keyboard, 1 mouse, 1 microphone, 1 plant, 1 shelf with decorative items'),(38,'tag:google.com,2005:reader/item/00064e51a3c628db','https://i.pinimg.com/originals/2b/87/52/2b8752eba917eb912dad92b695ae8984.jpg',NULL,'twilightsunset3-2','Content Creator',9,'3','9','2026-04-01 00:07:15','Kawaii','kawaii, cute, pink, white, anime','1 monitor, 1 keyboard, 1 mousepad, 1 mouse, several decorative items'),(39,'tag:google.com,2005:reader/item/00064e51a3c628d9','https://i.pinimg.com/originals/39/f0/4e/39f04e97cb8e12a927feef452e165b2b.jpg',NULL,'twilightsunset3-2','Content Creator',8,'4','13','2026-04-01 00:07:31','Cozy Content Creator Setup','Kawaii, Cottagecore, Dreamy','1 laptop, 1 monitor, 1 keyboard, 1 chair, 1 plant, 1 pink neon sign, 1 candle, 1 mousepad, 1 shelf with decorations'),(40,'tag:google.com,2005:reader/item/00064e51a3c628d8','https://i.pinimg.com/originals/4a/b7/f3/4ab7f327b43791ef8b8e79c431eabcad.jpg',NULL,'twilightsunset3-2','Content Creator',8,'3','10','2026-04-01 00:07:40','Ghibli-core Setup','Ghibli, cute, colorful','1 monitor, 1 keyboard, 1 mouse, 1 figurine, 1 plant, 1 neon light'),(41,'tag:google.com,2005:reader/item/00064e51a3c628d7','https://i.pinimg.com/originals/09/aa/cc/09aacc41567df9a8b565c35be065c9d5.jpg',NULL,'twilightsunset3-2','Content Creator',8,'3','9','2026-04-01 00:07:48','Kawaii Anime Setup','kawaii, anime, pink, cute','2 monitors, 1 keyboard, 1 mouse, 2 speakers, 1 mousepad'),(42,'tag:google.com,2005:reader/item/00064e51a3c628d6','https://i.pinimg.com/originals/db/e9/76/dbe976bde003ef2c583469461a73de29.jpg',NULL,'twilightsunset3-2','Content Creator',9,'3','9','2026-04-01 00:07:56','Kawaii Setup','kawaii, pink, cute','1 monitor, 1 pink stool, 1 pink chair, 1 white desk, 1 pink butterfly neon light, 1 hexagonal light'),(43,'tag:google.com,2005:reader/item/00064e51a3c628d5','https://i.pinimg.com/originals/6d/61/9b/6d619b497c97e0d40348570dc2b3bd13.jpg',NULL,'twilightsunset3-2','Content Creator',8,'3','11','2026-04-01 00:08:05','Cozy Cottagecore Setup','cozy, cute, calm','2 plants, 1 lamp, 1 computer screen, 1 keyboard, 1 mouse'),(44,'tag:google.com,2005:reader/item/00064e51a3c628d4','https://i.pinimg.com/originals/f3/32/06/f3320611a77614d439e9f382f889dfb5.jpg',NULL,'twilightsunset3-2','Content Creator, Graphic Designer, Animator',9,'3, 3','10, 9','2026-04-01 00:08:14','Kawaii Ghibli-core Setup','cute, anime, ghibli, kawaii, pastel','1 monitor, 1 keyboard, 1 mouse, 1 computer, 1 plant, 1 shelf with decorations, 1 neon light, 1 white chair'),(45,'tag:google.com,2005:reader/item/00064e51a3c628d3','https://i.pinimg.com/originals/53/0d/7d/530d7dbd81ac60a6230c719f2e864148.jpg',NULL,'twilightsunset3-2','Content Creator, Artist',9,'3, 2, 3','11, 8, 9','2026-04-01 00:08:22','Kawaii Dreamy Workspace','whimsical, feminine, cozy','1 green armchair, 1 pink cushion, 1 large desk with floral mousepad, 1 large monitor, 1 keyboard, 1 mousepad, several plants, several decorative items on shelves'),(46,'tag:google.com,2005:reader/item/00064e51a3c628d2','https://i.pinimg.com/originals/75/57/cb/7557cb5d074822cfd4ddd3687a7e30bb.jpg',NULL,'twilightsunset3-2','Content Creator',9,'3','9','2026-04-01 00:08:30','Kawaii setup','pastel colors, cute, playful','1 monitor, 1 pink keyboard, 1 white mouse, various figurines and decorations'),(47,'tag:google.com,2005:reader/item/00064e51a3c628d1','https://i.pinimg.com/originals/c9/05/4e/c9054eb95423bc1e8930e0352d8f6fe8.jpg',NULL,'twilightsunset3-2','Content Creator, Streamer',8,'3','11','2026-04-01 00:08:38','Cozy Cottagecore Gaming Setup','cozy, cute, gaming','1 pink controller, 1 white keyboard, 1 large monitor, 1 mousepad, 1 candle, 1 plant, 1 shelf with decorations'),(48,'tag:google.com,2005:reader/item/00064e51a3c628cf','https://i.pinimg.com/originals/5e/85/bf/5e85bf59ee8f8118486f0c5093ed9f2e.jpg',NULL,'twilightsunset3-2','Content Creator',8,'3','11','2026-04-01 00:08:50','Cozy Autumnal Setup','cozy, autumn, fall','1 monitor, 1 laptop, 1 plush toy, 1 shelf with decorations, 1 neon light, 1 string of lights with orange leaves'),(49,'tag:google.com,2005:reader/item/00064e51a3c628dc','https://i.pinimg.com/originals/67/4d/51/674d5129deafda835acb1a195e3cedfd.jpg',NULL,'twilightsunset3-2','Content Creator',8,'3','9','2026-04-01 00:09:02','Kawaii Gaming Setup','kawaii, pink, cute, gaming','1 monitor, 1 keyboard, 1 mouse, 1 pink speaker, 1 pink cup'),(50,'tag:google.com,2005:reader/item/00064e51a3c628da','https://i.pinimg.com/originals/c7/75/f3/c775f31a84b5a4796ae3c099f95ea3f6.jpg',NULL,'twilightsunset3-2','Content Creator',9,'3','9','2026-04-01 00:09:11','Kawaii Setup','Kawaii, Pink, Anime, Cute','2 monitors, 1 laptop, 1 keyboard, 1 mouse, Pink and white decorations'),(51,'tag:google.com,2005:reader/item/00064adb787cfa3d','https://i.pinimg.com/originals/8b/10/e8/8b10e8242595c1fa40ea33f45115206f.jpg',NULL,'ZykoUK_ - kawaii-decor-ideas - Pinterest Bridge','Content Creator',9,'3','9','2026-04-07 11:46:13','Kawaii Pink Setup','kawaii, pink, cute, playful','2 monitors, 1 keyboard, 1 mouse, 1 pink desk mat, 1 pink cloud-shaped wrist rest, 1 pink lamp, several decorative items'),(52,'tag:google.com,2005:reader/item/00064adb787cfa37','https://i.pinimg.com/originals/b6/39/6c/b6396cbc5754b8523da1237e68fb67b8.jpg',NULL,'ZykoUK_ - kawaii-decor-ideas - Pinterest Bridge','Content Creator',8,'3','9','2026-04-07 11:46:26','Kawaii Setup','kawaii, cute, pink','1 pink chair, 1 white desk, 1 pink keyboard, 1 computer monitor, 1 small computer monitor, several stuffed animals, 1 mirror, 1 blanket'),(53,'tag:google.com,2005:reader/item/00064edd4598d90e','https://i.pinimg.com/originals/ab/c0/c0/abc0c076bf13b8de61c96a0580b7e12f.jpg',NULL,'ZykoUK_ - dark-decor-ideas - Pinterest Bridge','Gamer, Content Creator',9,'2','6','2026-04-07 11:46:47','Neon','Neon, RGB, Gaming','2 Monitors, 1 Keyboard with RGB lighting, 1 Mouse with RGB lighting');
/*!40000 ALTER TABLE `Pins_Images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubCategorie_pin`
--

DROP TABLE IF EXISTS `SubCategorie_pin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SubCategorie_pin` (
  `Id_Subcategorie` int NOT NULL AUTO_INCREMENT,
  `label_SubCategorie` varchar(255) NOT NULL,
  `Id_categorie` int NOT NULL,
  PRIMARY KEY (`Id_Subcategorie`),
  KEY `Id_categorie` (`Id_categorie`),
  KEY `ix_SubCategorie_pin_label_SubCategorie` (`label_SubCategorie`),
  CONSTRAINT `SubCategorie_pin_ibfk_1` FOREIGN KEY (`Id_categorie`) REFERENCES `Categorie_pin` (`Id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubCategorie_pin`
--

LOCK TABLES `SubCategorie_pin` WRITE;
/*!40000 ALTER TABLE `SubCategorie_pin` DISABLE KEYS */;
INSERT INTO `SubCategorie_pin` VALUES (1,'Minimalist_Dark',1),(2,'Minimalist White',1),(3,'Japandi',1),(4,'Industrial',1),(5,'RGB Classic',2),(6,'Neon',2),(7,'Cyberpunk',2),(8,'Dreamy',2),(9,'Kawaii',3),(10,'Ghibli-core',3),(11,'Cottagecore',3),(12,'Retro',3),(13,'Content Creator',4),(14,'Hardcore Enthusiast',4),(15,'Ultrawide',4);
/*!40000 ALTER TABLE `SubCategorie_pin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('c807e528bec6');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-08 21:31:06
