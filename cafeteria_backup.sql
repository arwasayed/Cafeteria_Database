/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.27-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: cafeteria
-- ------------------------------------------------------
-- Server version	10.5.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `c_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (1,'Hot Drinks'),(2,'Snacks'),(3,'Desserts'),(4,'Sandwiches'),(5,'Ice Drinks');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Contents`
--

DROP TABLE IF EXISTS `Order_Contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order_Contents` (
  `o_id` int(11) NOT NULL,
  `P_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL CHECK (`amount` > 0),
  PRIMARY KEY (`o_id`,`P_id`),
  KEY `P_id` (`P_id`),
  CONSTRAINT `Order_Contents_ibfk_1` FOREIGN KEY (`o_id`) REFERENCES `Orders` (`O_id`) ON DELETE CASCADE,
  CONSTRAINT `Order_Contents_ibfk_2` FOREIGN KEY (`P_id`) REFERENCES `Products` (`P_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Contents`
--

LOCK TABLES `Order_Contents` WRITE;
/*!40000 ALTER TABLE `Order_Contents` DISABLE KEYS */;
INSERT INTO `Order_Contents` VALUES (1,1,2),(2,2,3),(3,3,1),(4,4,2),(5,5,1);
/*!40000 ALTER TABLE `Order_Contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `O_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `statuse` enum('done','out of delivery','processing') NOT NULL,
  `note` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`O_id`,`u_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `User_Table` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,1,'processing','Extra sugar in coffee','2025-02-19 01:47:21'),(2,2,'done','No tomato on chips','2025-02-19 01:47:21'),(3,3,'out of delivery','Chocolate topping on cake','2025-02-19 01:47:21'),(4,4,'processing','Extra cheese and halpino in burger','2025-02-19 01:47:21'),(5,5,'done','No suger in Ice Coffe','2025-02-19 01:47:21');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products` (
  `P_id` int(11) NOT NULL,
  `c_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `price` float NOT NULL CHECK (`price` >= 0),
  `available` enum('available','not available') NOT NULL,
  PRIMARY KEY (`P_id`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `Category` (`c_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (1,1,'Coffee','/images/coffee.jpg',2.5,'available'),(2,2,'Chips','/images/chips.jpg',1.5,'available'),(3,3,'Cake','/images/cake.jpg',3,'available'),(4,4,'Burger','/images/burger.jpg',5,'not available'),(5,5,'Ice Coffe','/images/salad.jpg',4,'available');
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `UserOrderSummary`
--

DROP TABLE IF EXISTS `UserOrderSummary`;
/*!50001 DROP VIEW IF EXISTS `UserOrderSummary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `UserOrderSummary` AS SELECT
 1 AS `user_name`,
  1 AS `order_id`,
  1 AS `order_date`,
  1 AS `product_names`,
  1 AS `total_quantity`,
  1 AS `total_price` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `User_Rooms`
--

DROP TABLE IF EXISTS `User_Rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Rooms` (
  `u_id` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `EXT` varchar(50) NOT NULL,
  PRIMARY KEY (`u_id`,`room_number`,`EXT`),
  CONSTRAINT `User_Rooms_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `User_Table` (`u_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Rooms`
--

LOCK TABLES `User_Rooms` WRITE;
/*!40000 ALTER TABLE `User_Rooms` DISABLE KEYS */;
INSERT INTO `User_Rooms` VALUES (1,101,'1234'),(2,102,'5678'),(3,103,'9876'),(4,104,'5432'),(5,105,'1111');
/*!40000 ALTER TABLE `User_Rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Table`
--

DROP TABLE IF EXISTS `User_Table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Table` (
  `u_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Table`
--

LOCK TABLES `User_Table` WRITE;
/*!40000 ALTER TABLE `User_Table` DISABLE KEYS */;
INSERT INTO `User_Table` VALUES (1,'Arwa Sayed','arwa@yahoo.com','1234','/images/arwajpg','admin'),(2,'Maha Galal','maha@yahoo.com','4321','/images/maha.jpg','user'),(3,'Mohamed Ahmed','mohamed@yahoo.com','4751','/images/mm.jpg','user'),(4,'Hager Hussien','hager@yahoo.com','4961','/images/hh.jpg','user'),(5,'Laia Ali','Laila@yahoo.com','7621','/images/lala.jpg','user');
/*!40000 ALTER TABLE `User_Table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `my_order_view`
--

DROP TABLE IF EXISTS `my_order_view`;
/*!50001 DROP VIEW IF EXISTS `my_order_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `my_order_view` AS SELECT
 1 AS `user_id`,
  1 AS `order_id`,
  1 AS `order_date`,
  1 AS `order_status`,
  1 AS `total_price_of_order`,
  1 AS `total_price_of_all_orders` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `orders_view`
--

DROP TABLE IF EXISTS `orders_view`;
/*!50001 DROP VIEW IF EXISTS `orders_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `orders_view` AS SELECT
 1 AS `order_date`,
  1 AS `user_name`,
  1 AS `room_number`,
  1 AS `EXT`,
  1 AS `product_name`,
  1 AS `amount`,
  1 AS `price`,
  1 AS `product_total`,
  1 AS `order_total` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `UserOrderSummary`
--

/*!50001 DROP VIEW IF EXISTS `UserOrderSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `UserOrderSummary` AS select `u`.`name` AS `user_name`,`o`.`O_id` AS `order_id`,`o`.`date` AS `order_date`,group_concat(distinct `p`.`name` separator ', ') AS `product_names`,sum(`oc`.`amount`) AS `total_quantity`,sum(`p`.`price` * `oc`.`amount`) AS `total_price` from (((`Orders` `o` join `User_Table` `u` on(`o`.`u_id` = `u`.`u_id`)) join `Order_Contents` `oc` on(`o`.`O_id` = `oc`.`o_id`)) join `Products` `p` on(`oc`.`P_id` = `p`.`P_id`)) group by `o`.`O_id`,`o`.`date`,`u`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `my_order_view`
--

/*!50001 DROP VIEW IF EXISTS `my_order_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `my_order_view` AS select `u`.`u_id` AS `user_id`,`o`.`O_id` AS `order_id`,`o`.`date` AS `order_date`,`o`.`statuse` AS `order_status`,sum(`p`.`price` * `oc`.`amount`) AS `total_price_of_order`,sum(sum(`p`.`price` * `oc`.`amount`)) over ( partition by `u`.`u_id`) AS `total_price_of_all_orders` from (((`Orders` `o` join `User_Table` `u` on(`o`.`u_id` = `u`.`u_id`)) join `Order_Contents` `oc` on(`o`.`O_id` = `oc`.`o_id`)) join `Products` `p` on(`oc`.`P_id` = `p`.`P_id`)) group by `o`.`O_id`,`o`.`date`,`o`.`statuse`,`u`.`u_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders_view`
--

/*!50001 DROP VIEW IF EXISTS `orders_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_view` AS select `o`.`date` AS `order_date`,`u`.`name` AS `user_name`,`ur`.`room_number` AS `room_number`,`ur`.`EXT` AS `EXT`,`p`.`name` AS `product_name`,`oc`.`amount` AS `amount`,`p`.`price` AS `price`,`p`.`price` * `oc`.`amount` AS `product_total`,sum(`p`.`price` * `oc`.`amount`) over ( partition by `o`.`O_id`) AS `order_total` from ((((`Orders` `o` join `User_Table` `u` on(`o`.`u_id` = `u`.`u_id`)) left join `User_Rooms` `ur` on(`u`.`u_id` = `ur`.`u_id`)) join `Order_Contents` `oc` on(`o`.`O_id` = `oc`.`o_id`)) join `Products` `p` on(`oc`.`P_id` = `p`.`P_id`)) */;
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

-- Dump completed on 2025-02-19  1:52:10
