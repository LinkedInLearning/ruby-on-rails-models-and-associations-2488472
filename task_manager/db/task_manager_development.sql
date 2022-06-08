/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2022-04-22 19:24:55.939644','2022-04-22 19:24:55.939644');
DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `categories` VALUES (1,'Weekly','2022-04-25 15:31:37.175665','2022-04-25 15:31:37.175665'),(2,'Monthly','2022-06-08 15:12:39.628498','2022-06-08 15:12:39.628498');
DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `schema_migrations` VALUES ('20220422190648'),('20220422190749'),('20220425152907'),('20220425152933'),('20220603145338'),('20220608152906'),('20220608162211'),('20220608172653');
DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `tags` VALUES (1,'outdoors','2022-06-08 16:23:33.660182','2022-06-08 16:23:33.660182'),(2,'indoors','2022-06-08 16:23:42.964222','2022-06-08 16:23:42.964222'),(3,'urgent','2022-06-08 16:23:51.620281','2022-06-08 16:23:51.620281');
DROP TABLE IF EXISTS `tags_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_tasks` (
  `tag_id` bigint NOT NULL,
  `task_id` bigint NOT NULL,
  KEY `index_tags_tasks_on_tag_id_and_task_id` (`tag_id`,`task_id`),
  KEY `index_tags_tasks_on_task_id_and_tag_id` (`task_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `tags_tasks` VALUES (1,8),(3,8);
DROP TABLE IF EXISTS `task_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_assignments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `task_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_task_assignments_on_task_id` (`task_id`),
  KEY `index_task_assignments_on_user_id` (`user_id`),
  KEY `index_task_assignments_on_task_id_and_user_id` (`task_id`,`user_id`),
  KEY `index_task_assignments_on_user_id_and_task_id` (`user_id`,`task_id`),
  CONSTRAINT `fk_rails_8d61fc0e26` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_b7a2056e80` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `task_assignments` VALUES (1,1,1,'supervisor','2022-06-08 17:29:18.006687','2022-06-08 17:29:37.416677'),(2,8,1,NULL,'2022-06-08 17:42:14.639148','2022-06-08 17:42:14.639148');
DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `position` int DEFAULT NULL,
  `completed` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `tasks` VALUES (1,'Fold Laundry','Fold the laundry in the basket and put it in the drawers',1,0,'2022-04-25 14:21:23.314635','2022-06-08 16:29:38.844855',1),(2,'Sweep Porch','Sweep dirt off the porch',2,0,'2022-04-25 14:22:30.251955','2022-06-08 15:14:03.980789',2),(4,'Wash Dishes','Wash and dry the dishes',3,0,'2022-04-26 20:11:20.883374','2022-06-08 15:14:03.982904',2),(6,'Mow Lawn','Get the lawn mower out of the garage. Clean underside around the blades. Fill the gas tank. Adjust the mower height. Set mower to mulch. Make sure the yard is clear of branches, toys, etc. Mow in different directions each week. Edge and sweep borders and pathways.',4,1,'2022-05-27 20:52:01.475690','2022-06-08 15:16:47.256843',2),(7,'Rake Leaves','Rake the leaves in the front and back yard',5,NULL,'2022-06-05 21:24:36.745008','2022-06-08 15:26:06.334204',NULL),(8,'Wash car',NULL,6,NULL,'2022-06-05 21:38:01.924070','2022-06-05 21:38:45.594382',NULL);
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `users` VALUES (1,'Kevin','Skoglund','someone@somewhere.com','2022-06-03 14:56:05.665224','2022-06-03 14:56:05.665224');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

