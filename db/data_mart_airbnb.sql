-- MySQL dump 10.13  Distrib 8.0.36, for Linux (aarch64)
--
-- Host: localhost    Database: data_mart_airbnb
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Amenities`
--

DROP TABLE IF EXISTS `Amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Amenities` (
  `id` int NOT NULL,
  `listing_id` int NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listing_id` (`listing_id`),
  CONSTRAINT `Amenities_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `Listings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Amenities`
--

LOCK TABLES `Amenities` WRITE;
/*!40000 ALTER TABLE `Amenities` DISABLE KEYS */;
INSERT INTO `Amenities` VALUES (1,10,'Spa services','Pamper yourself with a relaxing massage or facial at our on-site spa'),(2,11,'On-site restaurant or cafe','Savor delicious local cuisine without leaving the comfort of your hotel'),(3,9,'Sauna and steam room','Relax and unwind in our sauna and steam room after a long day of sightseeing'),(4,8,'Fitness center','Stay fit and healthy during your stay with our fully-equipped fitness center'),(5,6,'Private beach access','Escape to our private beach and soak up the sun with a tropical cocktail in hand'),(6,7,'Rooftop pool','Enjoy a refreshing dip in our rooftop pool with a stunning view of the city'),(7,5,'Air conditioning','Central air conditioning system in all rooms'),(8,4,'Free parking','Designated parking spot on property for guest use'),(9,3,'Pool','Private outdoor pool for guest use only'),(10,1,'Kitchen','Fully equipped kitchen'),(11,2,'Wi-Fi','High-speed internet access throughout the property');
/*!40000 ALTER TABLE `Amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Listing_addresses`
--

DROP TABLE IF EXISTS `Listing_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Listing_addresses` (
  `id` int NOT NULL,
  `street_name` varchar(100) DEFAULT NULL,
  `house_number` int NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `zip_code` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Listing_addresses`
--

LOCK TABLES `Listing_addresses` WRITE;
/*!40000 ALTER TABLE `Listing_addresses` DISABLE KEYS */;
INSERT INTO `Listing_addresses` VALUES (1,'Emily Ramp',1085,'West Kennethbury','Norway',76495),(2,'Howard Ports',631,'Matthewland','Reunion',31365),(3,'Kim Wells',524,'Michaelbury','Hungary',16364),(4,'Miller Station',96667,'New Sean','Guadeloupe',92132),(5,'Howell Meadows',31384,'South Davidton','Trinidad and Tobago',42687),(6,'Ann Route',120,'West Patriciaville','United States of America',36421),(7,'Monroe Brooks',80129,'Tammyfort','Belize',44040),(8,'Berg Forges',180,'Josephfurt','Bahamas',95803),(9,'Darren Loop',4413,'Richardburgh','Croatia',34867),(10,'Ayers Via',170,'Danielshire','Morocco',77890),(11,'Atkinson Views',8791,'Kathrynburgh','Hungary',29865),(12,'Patrick Skyway',472,'Laurastad','Gabon',55926),(13,'Cunningham Meadows',51145,'North Natasha','Argentina',97333);
/*!40000 ALTER TABLE `Listing_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Listings`
--

DROP TABLE IF EXISTS `Listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Listings` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `property_type` varchar(100) DEFAULT NULL,
  `room_type` varchar(100) DEFAULT NULL,
  `accommodates` int NOT NULL,
  `bedrooms` int NOT NULL,
  `bathrooms` int NOT NULL,
  `price_per_night` decimal(8,4) DEFAULT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address_id` (`address_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Listings_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `Listing_addresses` (`id`),
  CONSTRAINT `Listings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Listings`
--

LOCK TABLES `Listings` WRITE;
/*!40000 ALTER TABLE `Listings` DISABLE KEYS */;
INSERT INTO `Listings` VALUES (1,10,'Hilltop Hideaway','apartment','shared room',8,1,2,126.0000,11),(2,11,'Park Hyatt','house','private room',8,6,2,245.0000,10),(3,9,'The Peninsula','apartment','entire home/apt',9,6,3,331.0000,9),(4,8,'The Mandarin Oriental','house','shared room',7,5,2,345.0000,8),(5,7,'The Plaza Hotel','villa','private room',2,4,3,251.0000,7),(6,6,'The Waldorf Astoria','house','entire home/apt',4,1,3,490.0000,6),(7,5,'Hilton Hotels & Resorts','apartment','entire home/apt',1,3,2,240.0000,5),(8,1,'The Four Seasons','house','private room',10,3,3,308.0000,4),(9,2,'Hotel de Paris','villa','private room',6,4,3,64.0000,3),(10,3,'Serenity Spa & Resort','apartment','entire home/apt',10,4,2,175.0000,2),(11,4,'Grand Hotel','apartment','private room',9,5,3,269.0000,1);
/*!40000 ALTER TABLE `Listings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ListingsAmenities`
--

DROP TABLE IF EXISTS `ListingsAmenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ListingsAmenities` (
  `id` int NOT NULL,
  `listing_id` int NOT NULL,
  `amenities_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Amenities_id_ListingAmenities_amenities_id` (`amenities_id`),
  KEY `Listings_id_ListingAmenities_listings_id` (`listing_id`),
  CONSTRAINT `Amenities_id_ListingAmenities_amenities_id` FOREIGN KEY (`amenities_id`) REFERENCES `Amenities` (`id`),
  CONSTRAINT `Listings_id_ListingAmenities_listings_id` FOREIGN KEY (`listing_id`) REFERENCES `Listings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ListingsAmenities`
--

LOCK TABLES `ListingsAmenities` WRITE;
/*!40000 ALTER TABLE `ListingsAmenities` DISABLE KEYS */;
INSERT INTO `ListingsAmenities` VALUES (1,8,6),(2,8,10),(3,4,9),(4,2,3),(5,11,2),(6,5,7),(7,4,7),(8,10,7),(9,10,7),(10,10,5);
/*!40000 ALTER TABLE `ListingsAmenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Messages`
--

DROP TABLE IF EXISTS `Messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Messages` (
  `id` int NOT NULL,
  `sender_id` int NOT NULL,
  `recipient_id` int NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `date_sent` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id_fk_sender_id` (`sender_id`),
  KEY `users_id_fk_recipient_id` (`recipient_id`),
  CONSTRAINT `users_id_fk_recipient_id` FOREIGN KEY (`recipient_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `users_id_fk_sender_id` FOREIGN KEY (`sender_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Messages`
--

LOCK TABLES `Messages` WRITE;
/*!40000 ALTER TABLE `Messages` DISABLE KEYS */;
INSERT INTO `Messages` VALUES (0,12,2,'Thanks for the information. Can you tell me more about the amenities?','2022-08-12'),(1,12,2,'Yes, it\'s available. Would you like to make a reservation?','2020-03-08'),(2,12,2,'Is the room available from May 10','2021-10-17'),(3,12,2,'Sure, what would you like to know?','2021-08-11'),(4,12,2,'Hi,I\'m interested in your listing.Can you tell me more about it?','2019-04-20');
/*!40000 ALTER TABLE `Messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payments`
--

DROP TABLE IF EXISTS `Payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payments` (
  `id` int NOT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payments`
--

LOCK TABLES `Payments` WRITE;
/*!40000 ALTER TABLE `Payments` DISABLE KEYS */;
INSERT INTO `Payments` VALUES (1,'Visa','2020-12-25',9945.0000),(2,'Mastercard','2021-09-03',6622.0000),(3,'Visa','2020-03-31',8728.0000),(4,'Mastercard','2021-09-20',11094.0000),(5,'Visa','2020-03-13',6770.0000),(6,'Mastercard','2022-08-17',3411.0000),(7,'American Express','2020-12-19',2729.0000);
/*!40000 ALTER TABLE `Payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservations`
--

DROP TABLE IF EXISTS `Reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservations` (
  `id` int NOT NULL,
  `guest_id` int NOT NULL,
  `listing_id` int NOT NULL,
  `check_in_date` date DEFAULT NULL,
  `check_out_date` date DEFAULT NULL,
  `total_cost` decimal(8,4) DEFAULT NULL,
  KEY `listing_id` (`listing_id`),
  CONSTRAINT `Reservations_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `Listings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservations`
--

LOCK TABLES `Reservations` WRITE;
/*!40000 ALTER TABLE `Reservations` DISABLE KEYS */;
INSERT INTO `Reservations` VALUES (1,12,8,'2023-04-23','2024-01-09',6353.0000),(2,18,5,'2023-01-11','2023-04-20',3750.0000),(3,15,4,'2022-02-08','2023-06-08',2329.0000),(4,12,3,'2023-07-02','2023-10-28',8537.0000),(5,13,2,'2019-02-14','2021-07-22',7100.0000),(6,13,1,'2020-04-13','2022-11-10',6808.0000),(7,13,10,'2023-05-18','2023-10-06',7414.0000);
/*!40000 ALTER TABLE `Reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviews`
--

DROP TABLE IF EXISTS `Reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reviews` (
  `id` int NOT NULL,
  `listing_id` int NOT NULL,
  `user_id` int NOT NULL,
  `content` varchar(150) DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  `rating` int NOT NULL,
  `host_response` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listing_id` (`listing_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Reviews_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `Listings` (`id`),
  CONSTRAINT `Reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews`
--

LOCK TABLES `Reviews` WRITE;
/*!40000 ALTER TABLE `Reviews` DISABLE KEYS */;
INSERT INTO `Reviews` VALUES (1,8,21,'Born nothing election democratic part policy.','2019-09-03',4,'Language stage throughout unit.'),(2,11,20,'Read leave eat commercial person line.','2020-08-15',6,'Concern operation family low according stand consider.'),(3,10,19,'Team who TV bill.','2019-05-05',5,'That three find fly.'),(4,4,18,'Rate only center cost short head house inside.','2021-06-16',3,'Tend see office tax.'),(5,4,17,'Poor visit officer often half.','2019-12-09',3,'Magazine quickly large day nor join.'),(6,3,16,'Respond air father human.','2023-04-18',4,'Hand none model.'),(7,3,15,'Trial hope statement edge glass everybody together situation.','2023-05-15',6,'Security human will brother perhaps popular.'),(8,2,14,'Respond available gun trip.','2020-04-25',2,'Animal impact issue question.'),(9,1,13,'Chair choice above anything her also oil short.','2023-01-27',1,'Improve glass condition pay vote.');
/*!40000 ALTER TABLE `Reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_addresses`
--

DROP TABLE IF EXISTS `User_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_addresses` (
  `id` int NOT NULL,
  `street_name` varchar(200) DEFAULT NULL,
  `house_number` int NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `zip_code` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_addresses`
--

LOCK TABLES `User_addresses` WRITE;
/*!40000 ALTER TABLE `User_addresses` DISABLE KEYS */;
INSERT INTO `User_addresses` VALUES (1,'Malone Forges',2523,'North Melanieland','Uganda',58072),(2,'Kathryn Lake',7374,'East Amy','Norfolk Island',65234),(3,'Glover Isle',77300,'Port Edward','Cocos (Keeling) Islands',43077),(4,'Joshua Knoll',3903,'North Latoya','Zambia',53119),(5,'Eileen Turnpike',68,'Arnoldchester','Togo',33147),(6,'Newton Cape',720,'North Alexa','Malawi',46655),(7,'Thomas Dam',4574,'New Marie','Namibia',75188),(8,'Caitlin Village',60398,'Anthonyhaven','Christmas Island',38270),(9,'Turner Unions',39866,'Lake Nicolechester','Thailand',82389),(10,'Lee Walks',9431,'West Micheleborough','Senegal',38055),(11,'Cooper Island',6532,'Lopezstad','Yemen',1858),(12,'Lisa Rapid',8463,'Smithtown','United Kingdom',94144),(13,'Stevens Junctions',23558,'Reidtown','New Zealand',35654),(14,'Christina Manors',787,'North Patricia','Djibouti',57757),(15,'Natasha Squares',74169,'New Karifort','Liberia',64544),(16,'Katrina Vista',31048,'Fernandezhaven','Libyan Arab Jamahiriya',96704),(17,'Walter Springs',532,'Lake Nicholas','Heard Island and McDonald Islands',89414),(18,'Kathryn Mews',9988,'Jasonland','Greece',79873),(19,'Jones Ways',52240,'West Davidchester','Ecuador',65141),(20,'Alexander Curve',5445,'Vincentborough','Colombia',57865);
/*!40000 ALTER TABLE `User_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `id` int NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `DoB` date DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `user_type` enum('host','guest') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Charles','Burns','douglas58@example.com','996.449.9644x6782','1991-07-03','Female','Malawi','host'),(2,'Laura','Murillo','zreed@example.com','445-815-8984x8338','1938-06-01','Male','Sudan','host'),(3,'Eric','Brown','fieldssteven@example.org','442-579-8673','1971-02-18','Male','Brazil','host'),(4,'James','Jones','xfitzgerald@example.net','(225)314-2346','1971-05-11','Female','Ireland','host'),(5,'Justin','Lopez','angelaramirez@example.net','001-296-744-6617x8318','1958-03-18','Female','Saint Helena','host'),(6,'Michael','Adams','hansonjessica@example.net','(815)654-8038x369','1924-02-11','Female','Lesotho','host'),(7,'Jessica','Wilkinson','amandaschaefer@example.com','001-307-339-0014x9359','1991-08-05','Male','Canada','host'),(8,'Mark','Harrison','mcculloughchristopher@example.net','001-297-646-6234x68993','1997-07-29','Female','Cyprus','host'),(9,'Rachael','Morales','stephen35@example.com','287.624.3994','1998-12-11','Female','Nigeria','host'),(10,'Katelyn','Benjamin','brian31@example.org','900.940.2050','1932-06-20','Male','Christmas Island','host'),(11,'Heather','Rios','michael36@example.com','692-506-6331x810','1929-04-01','Male','Bouvet Island (Bouvetoya)','host'),(12,'Melissa','Chavez','jbrown@example.org','900-899-8750x2619','1938-10-08','Female','Denmark','guest'),(13,'Jeffrey','Martinez','arthur54@example.net','+1-970-414-1183x321','1943-07-16','Male','Andorra','guest'),(14,'Mary','Mann','samantha07@example.net','(228)519-5705x90049','1934-08-14','Female','Costa Rica','guest'),(15,'Brian','Davis','morrisaustin@example.org','217-945-7022','1982-11-18','Male','Antarctica (the territory South of 60 deg S)','guest'),(16,'Chris','Davis','jessica19@example.net','834-940-8246','1946-02-04','Female','Saudi Arabia','guest'),(17,'Mary','Mcneil','christinawade@example.com','4505543021','1934-02-23','Female','United Arab Emirates','guest'),(18,'Tina','Mcgrath','campbellaustin@example.com','+1-247-432-7645x253','1933-11-25','Male','Chile','guest'),(19,'Teresa','Robinson','richardrasmussen@example.org','001-286-582-8692x1418','1979-07-23','Male','Madagascar','guest'),(20,'Ryan','Watson','psmith@example.com','631.531.8760','1933-05-31','Female','Saint Martin','guest'),(21,'Douglas','Noble','billy66@example.com','+1-216-627-2321x8069','1926-09-16','Female','Martinique','guest');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-28 13:20:17
