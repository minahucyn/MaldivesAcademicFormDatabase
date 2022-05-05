CREATE DATABASE  IF NOT EXISTS `maldivesacademicforum` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `maldivesacademicforum`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: maldivesacademicforum
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `attendee`
--

DROP TABLE IF EXISTS `attendee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendee` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Fullname` varchar(100) NOT NULL,
  `NidPp` varchar(50) NOT NULL,
  `Birthdate` varchar(27) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ContactNumber` int NOT NULL,
  `Email` varchar(100) NOT NULL,
  `EducationId` int NOT NULL,
  `PaymentSlipName` varchar(34) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `AK_Users_Email` (`Email`),
  KEY `FK_Attendee_EducationLevels` (`EducationId`),
  CONSTRAINT `FK_Attendee_EducationLevels` FOREIGN KEY (`EducationId`) REFERENCES `educationlevels` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claims`
--

DROP TABLE IF EXISTS `claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conference_sponsors`
--

DROP TABLE IF EXISTS `conference_sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conference_sponsors` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ConferenceId` int NOT NULL,
  `SponsorId` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `AK_ConferenceId_SponsorsId` (`ConferenceId`,`SponsorId`),
  KEY `FK_Conference-Sponsors_Sponsors` (`SponsorId`),
  CONSTRAINT `FK_Conference-Sponsors_Conference` FOREIGN KEY (`ConferenceId`) REFERENCES `conferences` (`Id`),
  CONSTRAINT `FK_Conference-Sponsors_Sponsors` FOREIGN KEY (`SponsorId`) REFERENCES `sponsors` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conferences`
--

DROP TABLE IF EXISTS `conferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conferences` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(100) NOT NULL,
  `Venue` varchar(200) NOT NULL,
  `RegistrationStartDate` varchar(27) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RegistrationEndDate` varchar(27) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `StartDate` varchar(27) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EndDate` varchar(27) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `IconUri` varchar(200) DEFAULT NULL,
  `ContactType` varchar(50) DEFAULT NULL,
  `ContactValve` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `educationlevels`
--

DROP TABLE IF EXISTS `educationlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `educationlevels` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registrations`
--

DROP TABLE IF EXISTS `registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrations` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `AttendeeId` int NOT NULL,
  `ConferenceId` int NOT NULL,
  `IsApproved` tinyint DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Registrations_Attendee` (`AttendeeId`),
  KEY `FK_Registrations_Conference` (`ConferenceId`),
  CONSTRAINT `FK_Registrations_Attendee` FOREIGN KEY (`AttendeeId`) REFERENCES `attendee` (`Id`),
  CONSTRAINT `FK_Registrations_Conference` FOREIGN KEY (`ConferenceId`) REFERENCES `conferences` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roleclaims`
--

DROP TABLE IF EXISTS `roleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleclaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` int NOT NULL,
  `ClaimsId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_RoleClaims_Roles` (`RoleId`),
  KEY `FK_RoleClaims_Claims` (`ClaimsId`),
  CONSTRAINT `FK_RoleClaims_Claims` FOREIGN KEY (`ClaimsId`) REFERENCES `claims` (`Id`),
  CONSTRAINT `FK_RoleClaims_Roles` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `speakers`
--

DROP TABLE IF EXISTS `speakers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `speakers` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Fullname` varchar(100) NOT NULL,
  `Designation` varchar(100) NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sponsors`
--

DROP TABLE IF EXISTS `sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsors` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(100) NOT NULL,
  `Logo` varchar(200) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sysdiagrams`
--

DROP TABLE IF EXISTS `sysdiagrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sysdiagrams` (
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `principal_id` int NOT NULL,
  `diagram_id` int NOT NULL AUTO_INCREMENT,
  `version` int DEFAULT NULL,
  `definition` longblob,
  PRIMARY KEY (`diagram_id`),
  UNIQUE KEY `UK_principal_name` (`principal_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topics` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(200) NOT NULL,
  `SpeakerId` int NOT NULL,
  `ConferenceId` int NOT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `StartDate` varchar(27) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EndDate` varchar(27) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Topics_Speakers` (`SpeakerId`),
  KEY `FK_Topics_Conferences` (`ConferenceId`),
  CONSTRAINT `FK_Topics_Conferences` FOREIGN KEY (`ConferenceId`) REFERENCES `conferences` (`Id`),
  CONSTRAINT `FK_Topics_Speakers` FOREIGN KEY (`SpeakerId`) REFERENCES `speakers` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userroles`
--

DROP TABLE IF EXISTS `userroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userroles` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `RoleId` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `AK_UserRoles_UserId_RoleId` (`UserId`,`RoleId`),
  KEY `FK_UserRoles_Roles` (`RoleId`),
  CONSTRAINT `FK_UserRoles_Roles` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`Id`),
  CONSTRAINT `FK_UserRoles_Users` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Fullname` varchar(100) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `PasswordHash` varchar(1000) NOT NULL,
  `AuthToken` varchar(34) NOT NULL,
  `AuthTokenValid` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `AK_Users_Username` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-05 11:33:02
