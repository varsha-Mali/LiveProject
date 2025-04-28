CREATE DATABASE  IF NOT EXISTS `aems_web` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aems_web`;

CREATE TABLE `admin_login` (
  `Login_ID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(200) NOT NULL,
  `Password` varchar(200) NOT NULL,
  PRIMARY KEY (`Login_ID`),
  UNIQUE KEY `Username` (`Username`)
);
CREATE TABLE `department` (
  `Dept_ID` int NOT NULL AUTO_INCREMENT,
  `Dept_Name` varchar(200) DEFAULT NULL,
  `Dept_HOD` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Dept_ID`),
  UNIQUE KEY `Dept_Name` (`Dept_Name`)
);
CREATE TABLE `alumin` (
  `Alumin_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `Address` varchar(200) NOT NULL,
  `company` varchar(200) DEFAULT NULL,
  `Gender` varchar(200) NOT NULL,
  `passing_year` varchar(200) DEFAULT NULL,
  `Email_ID` varchar(200) NOT NULL,
  `Dept_ID` int DEFAULT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`Alumin_id`),
  UNIQUE KEY `Email_ID` (`Email_ID`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `password` (`password`),
  KEY `Dept_ID` (`Dept_ID`),
  CONSTRAINT `alumin_ibfk_1` FOREIGN KEY (`Dept_ID`) REFERENCES `department` (`Dept_ID`)
);


CREATE TABLE `events` (
  `Event_ID` int NOT NULL AUTO_INCREMENT,
  `Event_Name` varchar(200) NOT NULL,
  `date` varchar(200) DEFAULT NULL,
  `Dept_ID` int DEFAULT NULL,
  `Event_Location` varchar(200) NOT NULL,
  `Event_Time` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Event_ID`),
  KEY `Dept_ID` (`Dept_ID`),
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`Dept_ID`) REFERENCES `department` (`Dept_ID`) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `feedback` (
  `alumin_id` int DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  `feedback` varchar(200) NOT NULL,
  KEY `alumin_id` (`alumin_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`alumin_id`) REFERENCES `alumin` (`Alumin_id`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`Event_ID`)
);
