-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2023 at 01:36 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arcade game center db`
--

-- --------------------------------------------------------

--
-- Table structure for table `branche`
--

CREATE TABLE `branche` (
  `Branch_ID` int(11) NOT NULL,
  `Branche_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `branche`
--

INSERT INTO `branche` (`Branch_ID`, `Branche_name`) VALUES
(1, 'Arcade Game Center The First'),
(2, 'Arcade Games The Second'),
(3, 'Arcade Games The Third');

-- --------------------------------------------------------

--
-- Table structure for table `branche_address`
--

CREATE TABLE `branche_address` (
  `Building` varchar(100) NOT NULL,
  `City` varchar(45) NOT NULL,
  `Branch_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `branche_address`
--

INSERT INTO `branche_address` (`Building`, `City`, `Branch_ID`) VALUES
('Cairo Mall', 'Cairo', 1),
('Mall Of Egyept', '6-Octoba', 2),
('Zyzinya Mall', 'El-Maidy', 3);

-- --------------------------------------------------------

--
-- Table structure for table `branche_days`
--

CREATE TABLE `branche_days` (
  `Branch_ID` int(11) NOT NULL,
  `day` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `branche_days`
--

INSERT INTO `branche_days` (`Branch_ID`, `day`) VALUES
(1, 'Sunday'),
(1, 'Monday'),
(1, 'Tuesday'),
(1, 'Wednesday'),
(1, 'Thursday'),
(1, 'Friday'),
(2, 'Saturday'),
(2, 'Friday'),
(2, 'Thursday'),
(2, 'Wednesday'),
(2, 'Tuesday'),
(3, 'Sunday'),
(3, 'Monday'),
(3, 'Wednesday'),
(3, 'Friday');

-- --------------------------------------------------------

--
-- Table structure for table `branch_phone_numbers`
--

CREATE TABLE `branch_phone_numbers` (
  `Branch_Phone_Number` int(11) NOT NULL,
  `Branch_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `branch_phone_numbers`
--

INSERT INTO `branch_phone_numbers` (`Branch_Phone_Number`, `Branch_ID`) VALUES
(1123045819, 1),
(1147585638, 1),
(1235847699, 1),
(1023548857, 2),
(1023556954, 2),
(1253482248, 2),
(1024827847, 3),
(1235957664, 3);

-- --------------------------------------------------------

--
-- Table structure for table `competition`
--

CREATE TABLE `competition` (
  `Competition_Id` int(11) NOT NULL,
  `Competition_name` varchar(45) DEFAULT NULL,
  `Start_date` date DEFAULT NULL,
  `End_date` date DEFAULT NULL,
  `EmployeeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `competition`
--

INSERT INTO `competition` (`Competition_Id`, `Competition_name`, `Start_date`, `End_date`, `EmployeeID`) VALUES
(1, 'Competition a', '2022-01-01', '2022-01-15', 10),
(2, 'Competition b', '2022-01-16', '2022-01-30', 15),
(3, 'Competition c', '2022-02-01', '2022-02-15', 10);

-- --------------------------------------------------------

--
-- Table structure for table `competition_prizes`
--

CREATE TABLE `competition_prizes` (
  `Prize_Rank` int(11) NOT NULL,
  `Competition_Id` int(11) NOT NULL,
  `Prize_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `competition_prizes`
--

INSERT INTO `competition_prizes` (`Prize_Rank`, `Competition_Id`, `Prize_ID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(1, 2, 4),
(2, 2, 5),
(3, 2, 6),
(1, 3, 7),
(2, 3, 8),
(3, 3, 9);

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
  `Contract_Id` int(11) NOT NULL,
  `Employment_contract_status` enum('Ongoing','Rejected','Temporarily Suspended') NOT NULL,
  `Employment_status` enum('Temporary','Permanent') NOT NULL,
  `Main_salary` float NOT NULL,
  `Annual_salary_increase_rate` float NOT NULL,
  `Salary_after_Increase` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `contract`
--

INSERT INTO `contract` (`Contract_Id`, `Employment_contract_status`, `Employment_status`, `Main_salary`, `Annual_salary_increase_rate`, `Salary_after_Increase`) VALUES
(1, 'Ongoing', 'Permanent', 10000, 10, NULL),
(2, 'Ongoing', 'Permanent', 5000, 9, NULL),
(3, 'Ongoing', 'Permanent', 5000, 9, NULL),
(4, 'Rejected', 'Temporary', 2000, 5, NULL),
(5, 'Temporarily Suspended', 'Temporary', 3000, 5, NULL),
(6, 'Temporarily Suspended', 'Permanent', 6000, 7.5, NULL),
(7, 'Ongoing', 'Temporary', 4000, 8, NULL),
(8, 'Rejected', 'Temporary', 2000, 7.5, NULL),
(9, 'Temporarily Suspended', 'Temporary', 4000, 8, NULL),
(10, 'Rejected', 'Temporary', 3000, 6, NULL),
(11, 'Ongoing', 'Temporary', 1500, 3, NULL),
(12, 'Ongoing', 'Permanent', 4000, 5, NULL),
(13, 'Ongoing', 'Permanent', 4000, 5, NULL),
(14, 'Ongoing', 'Permanent', 4000, 4, NULL),
(15, 'Ongoing', 'Temporary', 5000, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cornars`
--

CREATE TABLE `cornars` (
  `Corner_Number` int(11) NOT NULL,
  `Games_type` varchar(45) NOT NULL,
  `Corner_Name` varchar(45) NOT NULL,
  `Required_age` int(11) NOT NULL,
  `Num_of_machines` int(11) DEFAULT NULL,
  `visitors_num` int(11) DEFAULT NULL,
  `Branch_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cornars`
--

INSERT INTO `cornars` (`Corner_Number`, `Games_type`, `Corner_Name`, `Required_age`, `Num_of_machines`, `visitors_num`, `Branch_ID`) VALUES
(1, 'subway', 'cornA', 15, 0, 1, 1),
(2, 'gata', 'cornB', 14, 0, 2, 2),
(3, 'mafia', 'cornC', 10, 0, 3, 3),
(4, 'pes', 'cornD', 11, 0, 4, 1),
(5, 'callofduty', 'cornE', 17, 0, 5, 2),
(6, 'bubg', 'cornF', 19, 0, 6, 3),
(7, 'stray', 'cornJ', 7, 0, 7, 1),
(8, 'creatied', 'cornH', 20, 0, 8, 2),
(9, 'elharata', 'cornK', 16, 0, 9, 3),
(10, 'mone', 'cornL', 22, 0, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmployeeID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `National_number` int(11) NOT NULL,
  `JobId` int(11) NOT NULL,
  `ShiftID` int(11) NOT NULL,
  `Branch_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmployeeID`, `Name`, `Date_of_birth`, `National_number`, `JobId`, `ShiftID`, `Branch_ID`) VALUES
(1, 'Abdelrhman Hussien', '2001-03-22', 369852147, 1, 1, 1),
(2, 'Ahmed Ali', '2001-01-01', 147852369, 2, 1, 1),
(3, 'Abdelrhman Mohammed', '2001-04-10', 123456789, 2, 1, 1),
(4, 'Mohammed Ibrahem', '2001-05-02', 123654741, 4, 1, 1),
(5, 'Gamal mohammed', '1995-05-09', 120524585, 3, 2, 2),
(6, 'Sara gamal', '1998-08-15', 963582147, 2, 2, 2),
(7, 'Hala Fared', '1996-03-05', 859623571, 6, 1, 2),
(8, 'Mariam Mahmood', '1979-08-09', 951357852, 8, 3, 2),
(9, 'Fares Mahmood', '1981-07-05', 856923471, 8, 3, 3),
(10, 'Yousef Hany', '1992-08-04', 985695357, 7, 1, 3),
(11, 'Khaled Mohamed', '2000-04-01', 956842847, 8, 2, 3),
(12, 'Lilia Emad', '1996-08-15', 856235964, 5, 1, 3),
(13, 'Omar Ziad', '1991-09-22', 458569235, 3, 2, 2),
(14, 'Kareem Hashm', '1990-10-25', 759628354, 3, 3, 1),
(15, 'Hesham Ahmed', '1999-12-12', 548756647, 7, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_address`
--

CREATE TABLE `employee_address` (
  `Street` varchar(50) NOT NULL,
  `City` varchar(45) NOT NULL,
  `EmployeeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `employee_address`
--

INSERT INTO `employee_address` (`Street`, `City`, `EmployeeID`) VALUES
('El-Badrashin', 'Giza', 1),
('El-Haram', 'Giza', 2),
('El-Maide', 'Cairo', 3),
('El-Haram', 'Giza', 4),
('El-Maide', 'Cairo', 5),
('El-Haram', 'Giza', 6),
('El-Maide', 'Cairo', 7),
('El-Haram', 'Giza', 8),
('El-Maide', 'Cairo', 9),
('El-Haram', 'Giza', 10),
('El-Maide', 'Cairo', 11),
('El-Haram', 'Giza', 12),
('El-Maide', 'Cairo', 13),
('El-Haram', 'Giza', 14),
('El-Maide', 'Cairo', 15);

-- --------------------------------------------------------

--
-- Table structure for table `employee_attendance_time`
--

CREATE TABLE `employee_attendance_time` (
  `Attendance_status` enum('Attend','Absent') NOT NULL DEFAULT 'Absent',
  `Attendance_date_time` datetime NOT NULL,
  `Departure_date_time` datetime NOT NULL,
  `ShiftID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `employee_attendance_time`
--

INSERT INTO `employee_attendance_time` (`Attendance_status`, `Attendance_date_time`, `Departure_date_time`, `ShiftID`, `EmployeeID`) VALUES
('Absent', '2022-12-01 07:55:00', '2022-12-01 16:00:00', 1, 1),
('Attend', '2022-12-01 15:55:00', '0000-00-00 00:00:00', 2, 2),
('Absent', '2022-12-01 23:55:00', '2022-12-01 08:00:00', 3, 3),
('Attend', '2022-12-01 07:55:00', '2022-12-01 16:00:00', 1, 4),
('Absent', '2022-12-01 15:55:00', '0000-00-00 00:00:00', 2, 5),
('Attend', '2022-12-01 23:55:00', '2022-12-01 08:00:00', 3, 6),
('Absent', '2022-12-01 07:55:00', '2022-12-01 16:00:00', 1, 7),
('Attend', '2022-12-01 15:55:00', '0000-00-00 00:00:00', 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `employee_phone_numbers`
--

CREATE TABLE `employee_phone_numbers` (
  `Phone_number` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `employee_phone_numbers`
--

INSERT INTO `employee_phone_numbers` (`Phone_number`, `EmployeeID`) VALUES
(1022555555, 1),
(1000222222, 2),
(1023253669, 3),
(1026956633, 4),
(1011111522, 5),
(1000659699, 6),
(1023536269, 7),
(1207821622, 8),
(1023536779, 9),
(1150981408, 10),
(1021538776, 11),
(1209221622, 12),
(1023358779, 13),
(1150151408, 14),
(1029738776, 15);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `JobId` int(11) NOT NULL,
  `Job_title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`JobId`, `Job_title`) VALUES
(4, 'Chief'),
(8, 'Cleaners'),
(7, 'Comption Manager'),
(5, 'Corner Service'),
(3, 'Guard'),
(6, 'Maintenance Worke'),
(1, 'Manager'),
(2, 'Receptionist');

-- --------------------------------------------------------

--
-- Table structure for table `joined_user`
--

CREATE TABLE `joined_user` (
  `Join_Date` datetime DEFAULT NULL,
  `Competition_Id` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `joined_user`
--

INSERT INTO `joined_user` (`Join_Date`, `Competition_Id`, `UserID`) VALUES
('2021-01-22 11:30:22', 1, 1),
('2022-02-22 19:30:22', 2, 2),
('2022-03-22 09:30:22', 3, 3),
('2022-04-22 18:30:22', 1, 4),
('2021-05-22 19:30:22', 2, 5),
('2022-06-22 15:30:22', 3, 6),
('2021-05-22 12:30:22', 1, 7),
('2022-08-22 13:30:22', 2, 8),
('2022-11-22 19:30:22', 3, 9),
('2022-02-22 16:30:22', 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `ls_lifted`
--

CREATE TABLE `ls_lifted` (
  `Lifted_Data` date NOT NULL,
  ` Lifted_reason` varchar(250) NOT NULL,
  `Machine_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ls_lifted`
--

INSERT INTO `ls_lifted` (`Lifted_Data`, ` Lifted_reason`, `Machine_ID`) VALUES
('2022-12-15', 'Mechanical damage', 9),
('2022-12-10', 'software erorr', 7),
('2022-12-11', 'User Usage Defect', 3);

-- --------------------------------------------------------

--
-- Table structure for table `machine`
--

CREATE TABLE `machine` (
  `Machine_ID` int(11) NOT NULL,
  `Machine_name` varchar(45) NOT NULL,
  `Machine_type` varchar(45) NOT NULL,
  `Machine_price` float NOT NULL,
  `Total_number_of_prizes` int(11) NOT NULL,
  `Date_of_entry` date NOT NULL,
  `Date_of_upload` date NOT NULL,
  `Machine_statues` varchar(100) NOT NULL,
  `Usage_fees` float NOT NULL,
  `Machine_returns_money` float NOT NULL,
  `Total_time_of_use` float DEFAULT NULL,
  `Corner_Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `machine`
--

INSERT INTO `machine` (`Machine_ID`, `Machine_name`, `Machine_type`, `Machine_price`, `Total_number_of_prizes`, `Date_of_entry`, `Date_of_upload`, `Machine_statues`, `Usage_fees`, `Machine_returns_money`, `Total_time_of_use`, `Corner_Number`) VALUES
(1, 'MachineA', 'J', 25000, 8, '2022-12-01', '0000-00-00', '89', 40, 200000, 0, 1),
(2, 'Machineb', 'K', 45000, 9, '2022-12-01', '0000-00-00', '92', 50, 450000, 0, 2),
(3, 'Machinec', 'A', 20000, 10, '2022-12-01', '0000-00-00', '99', 40, 100000, 0, 3),
(4, 'Machinedd', 'B', 10000, 1, '2022-12-01', '0000-00-00', '98', 50, 150000, 0, 6),
(5, 'Machinede', 'C', 30000, 5, '2022-12-01', '0000-00-00', '85', 50, 170000, 0, 5),
(6, 'Machinef', 'D', 15000, 9, '2022-12-01', '0000-00-00', '19', 30, 250000, 0, 4),
(7, 'Machineg', 'E', 11000, 2, '2022-12-01', '0000-00-00', '65', 45, 250000, 0, 1),
(8, 'Machineh', 'F', 12000, 6, '2022-12-01', '0000-00-00', '98', 30, 350000, 0, 8),
(9, 'Machinei', 'G', 15000, 8, '2022-12-01', '0000-00-00', '100', 40, 159000, 0, 9),
(10, 'Machinej', 'H', 17000, 4, '2022-12-01', '0000-00-00', '90', 50, 156000, 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `make_contract`
--

CREATE TABLE `make_contract` (
  `Work_end_date` date DEFAULT NULL,
  `Work_start_date` date NOT NULL,
  `Contract_Id` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `make_contract`
--

INSERT INTO `make_contract` (`Work_end_date`, `Work_start_date`, `Contract_Id`, `EmployeeID`) VALUES
('0000-00-00', '2021-01-22', 1, 1),
('0000-00-00', '2022-02-22', 2, 2),
('0000-00-00', '2022-03-22', 3, 3),
('0000-00-00', '2022-04-22', 4, 4),
('0000-00-00', '2021-05-22', 5, 5),
('0000-00-00', '2022-06-22', 6, 6),
('0000-00-00', '2021-05-22', 7, 7),
('0000-00-00', '2022-08-22', 8, 8),
('0000-00-00', '2022-11-22', 9, 9),
('0000-00-00', '2022-02-22', 10, 10),
('0000-00-00', '2021-01-22', 11, 11),
('0000-00-00', '2022-02-22', 12, 12),
('0000-00-00', '2022-03-22', 13, 13),
('0000-00-00', '2022-04-22', 14, 14),
('0000-00-00', '2021-05-22', 15, 15);

-- --------------------------------------------------------

--
-- Table structure for table `permitted_machine`
--

CREATE TABLE `permitted_machine` (
  `Package_ID` int(11) NOT NULL,
  `Machine_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `permitted_machine`
--

INSERT INTO `permitted_machine` (`Package_ID`, `Machine_ID`) VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 5),
(2, 6),
(3, 7),
(3, 1),
(3, 9),
(4, 8),
(4, 10),
(4, 7),
(4, 9),
(4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `prizes`
--

CREATE TABLE `prizes` (
  `Prize_ID` int(11) NOT NULL,
  `Prize Name` varchar(45) DEFAULT NULL,
  `Prize_type` varchar(45) DEFAULT NULL,
  `Prize_price` float DEFAULT NULL,
  `Machine_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `prizes`
--

INSERT INTO `prizes` (`Prize_ID`, `Prize Name`, `Prize_type`, `Prize_price`, `Machine_ID`) VALUES
(1, 'iphone', 'gold', 25, 1),
(2, 'dabdob', 'silver', 25, 2),
(3, 'Kotchyna', 'silver', 25, 3),
(4, 'Kotchyna', 'silver', 25, 4),
(5, 'dabdob', 'silver', 25, 5),
(6, 'iphone', 'gold', 25, 6),
(7, 'Kotchyna', 'gold', 25, 7),
(8, 'Kotchyna', 'silver', 25, 8),
(9, 'Ibad', 'gold', 25, 9),
(10, 'labtop', 'gold', 25, 10),
(11, 'Kotchyna', 'silver', 25, 6),
(12, 'gun game ', 'silver', 200, 7),
(13, 'iphone', 'gold', 25000, 8),
(14, 'Kotchyna', 'silver', 25, 9),
(15, 'phone', 'gold', 5000, 10);

-- --------------------------------------------------------

--
-- Table structure for table `repair`
--

CREATE TABLE `repair` (
  `Repair_date_time` datetime NOT NULL,
  `Repairs_cost` float NOT NULL,
  `Malfunction` varchar(100) NOT NULL,
  `Machine_ID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `ShiftID` int(11) NOT NULL,
  `Shift_Name` varchar(45) NOT NULL,
  `Shift_Start_Time` time NOT NULL,
  `Shift_End_Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`ShiftID`, `Shift_Name`, `Shift_Start_Time`, `Shift_End_Time`) VALUES
(1, 'Morning', '08:00:00', '16:00:00'),
(2, 'day', '16:00:00', '24:00:00'),
(3, 'evening', '24:00:00', '08:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_package`
--

CREATE TABLE `subscription_package` (
  ` Package_ID` int(11) NOT NULL,
  `Package_name` varchar(45) NOT NULL,
  `Package_price` float NOT NULL,
  `Package_Duration` int(11) NOT NULL COMMENT 'The duration in days',
  `Package_limits` int(11) NOT NULL COMMENT 'Package limits is times of use the machiens'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `subscription_package`
--

INSERT INTO `subscription_package` (` Package_ID`, `Package_name`, `Package_price`, `Package_Duration`, `Package_limits`) VALUES
(1, 'family package ', 1000, 2, 10),
(2, 'el sohab package', 1500, 1, 15),
(3, 'arcyed package', 700, 2, 9),
(4, 'al lama package', 2000, 5, 22);

-- --------------------------------------------------------

--
-- Table structure for table `tak_ salary`
--

CREATE TABLE `tak_ salary` (
  `Total_salary` float DEFAULT NULL,
  `Date_of_receipt` date NOT NULL,
  `Contract_Id` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `User_name` varchar(50) NOT NULL,
  `User_gender` varchar(30) NOT NULL,
  `Birth_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `User_name`, `User_gender`, `Birth_date`) VALUES
(1, 'ahmed', 'male', '2009-09-07'),
(2, 'ahmed ', 'male', '2000-09-07'),
(3, 'hassan', 'male', '2009-10-01'),
(4, 'ali', 'male', '2002-02-07'),
(5, 'maha', 'famale', '2008-09-30'),
(6, 'nada', 'famale', '2001-06-07'),
(7, 'mohamed', 'male', '2000-09-11'),
(8, 'mostafa', 'male', '2009-07-01'),
(9, 'fatma', 'famale', '2010-10-07'),
(10, 'amira', 'famale', '2011-09-22');

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `Streat` varchar(60) NOT NULL,
  `City` varchar(45) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user_address`
--

INSERT INTO `user_address` (`Streat`, `City`, `UserID`) VALUES
('abo madyn street', 'abshawy', 1),
('dala street', 'fayoum', 3),
('el harm street ', 'giza', 5),
('nasser street', 'maadi', 2),
('abbod street ', 'october', 4),
('abo madyn street', 'abshawy', 1),
('nasser street', 'maadi', 2),
('dala street', 'fayoum', 3),
('abbod street ', 'october', 4),
('el harm street ', 'giza', 5),
('el harm street', 'giza', 6),
('sfarat street', 'cairo', 7),
('ahmed street', 'cairo', 8),
('abdo street', 'el sharaya', 9),
('mohamed street', 'fayoum', 10);

-- --------------------------------------------------------

--
-- Table structure for table `user_phon_ number`
--

CREATE TABLE `user_phon_ number` (
  `Phone_number` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user_phon_ number`
--

INSERT INTO `user_phon_ number` (`Phone_number`, `UserID`) VALUES
(1022555555, 1),
(1000222222, 2),
(1023253669, 3),
(1026956633, 4),
(1011111522, 5),
(1000659699, 6),
(1023536269, 7),
(1205621622, 8),
(1023568779, 9),
(1150171408, 10);

-- --------------------------------------------------------

--
-- Table structure for table `user_subscription`
--

CREATE TABLE `user_subscription` (
  `Subscription_date` datetime NOT NULL,
  `UserID` int(11) NOT NULL,
  `Package_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user_subscription`
--

INSERT INTO `user_subscription` (`Subscription_date`, `UserID`, `Package_ID`) VALUES
('2022-12-01 07:55:00', 1, 1),
('2022-12-10 16:03:00', 2, 3),
('2022-12-03 12:11:00', 3, 2),
('2022-12-08 22:15:00', 4, 4),
('2022-12-22 08:00:00', 9, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_use_machine`
--

CREATE TABLE `user_use_machine` (
  `Time_of_use` datetime NOT NULL,
  `Machine_ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user_use_machine`
--

INSERT INTO `user_use_machine` (`Time_of_use`, `Machine_ID`, `UserID`) VALUES
('2022-12-01 07:55:00', 1, 1),
('2022-12-10 16:03:00', 2, 2),
('2022-12-03 12:11:00', 3, 3),
('2022-12-08 22:15:00', 4, 4),
('2022-12-22 08:00:00', 5, 5),
('2022-12-01 07:55:00', 6, 6),
('2022-12-10 16:03:00', 7, 7),
('2022-12-03 12:11:00', 8, 8),
('2022-12-08 22:15:00', 9, 9),
('2022-12-22 08:00:00', 10, 10),
('2022-12-29 09:30:39', 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `user_win_competition`
--

CREATE TABLE `user_win_competition` (
  `Rank` int(11) NOT NULL,
  `Competition_Id` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user_win_competition`
--

INSERT INTO `user_win_competition` (`Rank`, `Competition_Id`, `UserID`) VALUES
(1, 1, 1),
(2, 3, 10),
(3, 1, 9),
(1, 3, 7),
(2, 2, 9),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_win_prize`
--

CREATE TABLE `user_win_prize` (
  `Draw_timing` datetime DEFAULT NULL,
  `Prize_ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user_win_prize`
--

INSERT INTO `user_win_prize` (`Draw_timing`, `Prize_ID`, `UserID`) VALUES
('2022-12-01 07:55:00', 1, 1),
('2022-12-10 16:03:00', 2, 10),
('2022-12-03 12:11:00', 3, 9),
('2022-12-08 22:15:00', 4, 7),
('2022-12-22 08:00:00', 5, 9),
('2022-12-08 22:15:00', 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `visit_branch`
--

CREATE TABLE `visit_branch` (
  `Time_of_entry` datetime NOT NULL,
  `Time_of_go` datetime DEFAULT NULL,
  `Branch_ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `visit_branch`
--

INSERT INTO `visit_branch` (`Time_of_entry`, `Time_of_go`, `Branch_ID`, `UserID`) VALUES
('2022-12-01 07:55:00', '2022-12-01 08:55:00', 1, 1),
('2022-12-08 22:15:00', '2022-12-01 22:55:00', 3, 2),
('2022-12-08 22:15:00', '2022-12-01 22:55:00', 3, 3),
('2022-12-08 22:15:00', '2022-12-01 22:55:00', 2, 4),
('2022-12-08 22:15:00', '2022-12-01 22:55:00', 1, 5),
('2022-12-08 22:15:00', '2022-12-01 22:55:00', 3, 6),
('2022-12-08 22:15:00', '2022-12-01 22:55:00', 1, 7),
('2022-12-22 08:00:00', '2022-12-01 11:55:00', 2, 8),
('2022-12-03 12:11:00', '2022-12-01 13:55:00', 3, 9),
('2022-12-10 16:03:00', '2022-12-01 19:55:00', 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `visit_corner`
--

CREATE TABLE `visit_corner` (
  `Time_of_entry` datetime NOT NULL,
  `Time_of_go` datetime DEFAULT NULL,
  `Corner_Number` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `visit_corner`
--

INSERT INTO `visit_corner` (`Time_of_entry`, `Time_of_go`, `Corner_Number`, `UserID`) VALUES
('2022-12-01 07:55:00', '2022-12-01 08:55:00', 1, 1),
('2022-12-08 22:15:00', '2022-12-01 22:55:00', 3, 2),
('2022-12-08 22:15:00', '2022-12-01 22:55:00', 3, 3),
('2022-12-08 22:15:00', '2022-12-01 22:55:00', 2, 4),
('2022-12-08 22:15:00', '2022-12-01 22:55:00', 1, 5),
('2022-12-08 22:15:00', '2022-12-01 22:55:00', 3, 6),
('2022-12-08 22:15:00', '2022-12-01 22:55:00', 1, 7),
('2022-12-22 08:00:00', '2022-12-01 11:55:00', 2, 8),
('2022-12-03 12:11:00', '2022-12-01 13:55:00', 3, 9),
('2022-12-10 16:03:00', '2022-12-01 19:55:00', 2, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branche`
--
ALTER TABLE `branche`
  ADD PRIMARY KEY (`Branch_ID`);

--
-- Indexes for table `branche_address`
--
ALTER TABLE `branche_address`
  ADD KEY `fk_Branches_Adress_Branches1_idx` (`Branch_ID`);

--
-- Indexes for table `branche_days`
--
ALTER TABLE `branche_days`
  ADD KEY `fk_Branches_days_Branches1_idx` (`Branch_ID`);

--
-- Indexes for table `branch_phone_numbers`
--
ALTER TABLE `branch_phone_numbers`
  ADD UNIQUE KEY `Branch Phone Number_UNIQUE` (`Branch_Phone_Number`),
  ADD KEY `fk_Branch Phone Numbers_Branches1_idx` (`Branch_ID`);

--
-- Indexes for table `competition`
--
ALTER TABLE `competition`
  ADD PRIMARY KEY (`Competition_Id`),
  ADD KEY `fk_Competition_Employee1_idx` (`EmployeeID`);

--
-- Indexes for table `competition_prizes`
--
ALTER TABLE `competition_prizes`
  ADD KEY `fk_Competition_Prizes_Competition1_idx` (`Competition_Id`),
  ADD KEY `fk_Competition_Prizes_Prizes1_idx` (`Prize_ID`);

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`Contract_Id`);

--
-- Indexes for table `cornars`
--
ALTER TABLE `cornars`
  ADD PRIMARY KEY (`Corner_Number`),
  ADD KEY `fk_Cornars_Branches1_idx` (`Branch_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD UNIQUE KEY `National number_UNIQUE` (`National_number`),
  ADD KEY `fk_Employee_Jobs1_idx` (`JobId`),
  ADD KEY `fk_Employee_Shift1_idx` (`ShiftID`),
  ADD KEY `fk_Employee_Branche1_idx` (`Branch_ID`);

--
-- Indexes for table `employee_address`
--
ALTER TABLE `employee_address`
  ADD KEY `fk_Employee Address_Employee1_idx` (`EmployeeID`);

--
-- Indexes for table `employee_attendance_time`
--
ALTER TABLE `employee_attendance_time`
  ADD KEY `fk_Employee Attendance_Shift2_idx` (`ShiftID`),
  ADD KEY `fk_Employee_Attendance_Time_Employee1_idx` (`EmployeeID`);

--
-- Indexes for table `employee_phone_numbers`
--
ALTER TABLE `employee_phone_numbers`
  ADD UNIQUE KEY `Phone number_UNIQUE` (`Phone_number`),
  ADD KEY `fk_Employee_Phone_Numbers_Employee1_idx` (`EmployeeID`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`JobId`),
  ADD UNIQUE KEY `Job title_UNIQUE` (`Job_title`);

--
-- Indexes for table `joined_user`
--
ALTER TABLE `joined_user`
  ADD KEY `fk_Joined User_Competition1_idx` (`Competition_Id`),
  ADD KEY `fk_Joined User_User1_idx` (`UserID`);

--
-- Indexes for table `ls_lifted`
--
ALTER TABLE `ls_lifted`
  ADD UNIQUE KEY ` Lifted reason_UNIQUE` (` Lifted_reason`),
  ADD KEY `fk_ls Lifted_Machine1_idx` (`Machine_ID`);

--
-- Indexes for table `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`Machine_ID`),
  ADD UNIQUE KEY `Machine name_UNIQUE` (`Machine_name`),
  ADD UNIQUE KEY `Machine type_UNIQUE` (`Machine_type`),
  ADD KEY `fk_Machine_Cornars1_idx` (`Corner_Number`);

--
-- Indexes for table `make_contract`
--
ALTER TABLE `make_contract`
  ADD KEY `fk_Make Contract_Contract1_idx` (`Contract_Id`),
  ADD KEY `fk_Make Contract_Employee1_idx` (`EmployeeID`);

--
-- Indexes for table `permitted_machine`
--
ALTER TABLE `permitted_machine`
  ADD KEY `fk_Permitted Machine_Subscription Package1_idx` (`Package_ID`),
  ADD KEY `fk_Permitted Machine_Machine1_idx` (`Machine_ID`);

--
-- Indexes for table `prizes`
--
ALTER TABLE `prizes`
  ADD PRIMARY KEY (`Prize_ID`),
  ADD KEY `fk_Prizes_Machine1_idx` (`Machine_ID`);

--
-- Indexes for table `repair`
--
ALTER TABLE `repair`
  ADD KEY `fk_Repair_Machine1_idx` (`Machine_ID`),
  ADD KEY `fk_Repair_Employee1_idx` (`EmployeeID`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`ShiftID`),
  ADD UNIQUE KEY `Shift Name_UNIQUE` (`Shift_Name`);

--
-- Indexes for table `subscription_package`
--
ALTER TABLE `subscription_package`
  ADD PRIMARY KEY (` Package_ID`),
  ADD UNIQUE KEY `Packadge name_UNIQUE` (`Package_name`);

--
-- Indexes for table `tak_ salary`
--
ALTER TABLE `tak_ salary`
  ADD KEY `fk_Take Salary_Contract1_idx` (`Contract_Id`),
  ADD KEY `fk_Tak_ Salary_Employee1_idx` (`EmployeeID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD KEY `fk_User Address_User11_idx` (`UserID`);

--
-- Indexes for table `user_phon_ number`
--
ALTER TABLE `user_phon_ number`
  ADD UNIQUE KEY `Phone_number_UNIQUE` (`Phone_number`),
  ADD KEY `fk_User phone number_User11_idx` (`UserID`);

--
-- Indexes for table `user_subscription`
--
ALTER TABLE `user_subscription`
  ADD KEY `fk_User Subscription_User11_idx` (`UserID`),
  ADD KEY `fk_User Subscription_Subscription Package2_idx` (`Package_ID`);

--
-- Indexes for table `user_use_machine`
--
ALTER TABLE `user_use_machine`
  ADD KEY `fk_Use_copy1_Machine1_idx` (`Machine_ID`),
  ADD KEY `fk_Use_copy1_User1_idx` (`UserID`);

--
-- Indexes for table `user_win_competition`
--
ALTER TABLE `user_win_competition`
  ADD KEY `fk_Win_Competition1_idx` (`Competition_Id`),
  ADD KEY `fk_Win_User1_idx` (`UserID`);

--
-- Indexes for table `user_win_prize`
--
ALTER TABLE `user_win_prize`
  ADD KEY `fk_User_Win_Prize_Prizes1_idx` (`Prize_ID`),
  ADD KEY `fk_User_Win_Prize_User1_idx` (`UserID`);

--
-- Indexes for table `visit_branch`
--
ALTER TABLE `visit_branch`
  ADD KEY `fk_visit_Branches1_idx` (`Branch_ID`),
  ADD KEY `fk_visit_User1_idx` (`UserID`);

--
-- Indexes for table `visit_corner`
--
ALTER TABLE `visit_corner`
  ADD KEY `fk_visit_copy1_Cornars1_idx` (`Corner_Number`),
  ADD KEY `fk_visit_User2_idx` (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branche`
--
ALTER TABLE `branche`
  MODIFY `Branch_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `competition`
--
ALTER TABLE `competition`
  MODIFY `Competition_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contract`
--
ALTER TABLE `contract`
  MODIFY `Contract_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cornars`
--
ALTER TABLE `cornars`
  MODIFY `Corner_Number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `JobId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `machine`
--
ALTER TABLE `machine`
  MODIFY `Machine_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `ShiftID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscription_package`
--
ALTER TABLE `subscription_package`
  MODIFY ` Package_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branche_address`
--
ALTER TABLE `branche_address`
  ADD CONSTRAINT `fk_Branches_Adress_Branches1` FOREIGN KEY (`Branch_ID`) REFERENCES `branche` (`Branch_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `branche_days`
--
ALTER TABLE `branche_days`
  ADD CONSTRAINT `fk_Branches_days_Branches1` FOREIGN KEY (`Branch_ID`) REFERENCES `branche` (`Branch_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `branch_phone_numbers`
--
ALTER TABLE `branch_phone_numbers`
  ADD CONSTRAINT `fk_Branch Phone Numbers_Branches1` FOREIGN KEY (`Branch_ID`) REFERENCES `branche` (`Branch_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `competition`
--
ALTER TABLE `competition`
  ADD CONSTRAINT `fk_Competition_Employee1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `competition_prizes`
--
ALTER TABLE `competition_prizes`
  ADD CONSTRAINT `fk_Competition_Prizes_Competition1` FOREIGN KEY (`Competition_Id`) REFERENCES `competition` (`Competition_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Competition_Prizes_Prizes1` FOREIGN KEY (`Prize_ID`) REFERENCES `prizes` (`Prize_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cornars`
--
ALTER TABLE `cornars`
  ADD CONSTRAINT `fk_Cornars_Branches1` FOREIGN KEY (`Branch_ID`) REFERENCES `branche` (`Branch_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_Employee_Branche1` FOREIGN KEY (`Branch_ID`) REFERENCES `branche` (`Branch_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Employee_Jobs1` FOREIGN KEY (`JobId`) REFERENCES `jobs` (`JobId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Employee_Shift1` FOREIGN KEY (`ShiftID`) REFERENCES `shift` (`ShiftID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee_address`
--
ALTER TABLE `employee_address`
  ADD CONSTRAINT `fk_Employee Address_Employee1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee_attendance_time`
--
ALTER TABLE `employee_attendance_time`
  ADD CONSTRAINT `fk_Employee Attendance_Shift2` FOREIGN KEY (`ShiftID`) REFERENCES `shift` (`ShiftID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Employee_Attendance_Time_Employee1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee_phone_numbers`
--
ALTER TABLE `employee_phone_numbers`
  ADD CONSTRAINT `fk_Employee_Phone_Numbers_Employee1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `joined_user`
--
ALTER TABLE `joined_user`
  ADD CONSTRAINT `fk_Joined User_Competition1` FOREIGN KEY (`Competition_Id`) REFERENCES `competition` (`Competition_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Joined User_User1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ls_lifted`
--
ALTER TABLE `ls_lifted`
  ADD CONSTRAINT `fk_ls Lifted_Machine1` FOREIGN KEY (`Machine_ID`) REFERENCES `machine` (`Machine_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `machine`
--
ALTER TABLE `machine`
  ADD CONSTRAINT `fk_Machine_Cornars1` FOREIGN KEY (`Corner_Number`) REFERENCES `cornars` (`Corner_Number`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `make_contract`
--
ALTER TABLE `make_contract`
  ADD CONSTRAINT `fk_Make Contract_Contract1` FOREIGN KEY (`Contract_Id`) REFERENCES `contract` (`Contract_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Make Contract_Employee1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `permitted_machine`
--
ALTER TABLE `permitted_machine`
  ADD CONSTRAINT `fk_Permitted Machine_Machine1` FOREIGN KEY (`Machine_ID`) REFERENCES `machine` (`Machine_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Permitted Machine_Subscription Package1` FOREIGN KEY (`Package_ID`) REFERENCES `subscription_package` (`Package_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `prizes`
--
ALTER TABLE `prizes`
  ADD CONSTRAINT `fk_Prizes_Machine1` FOREIGN KEY (`Machine_ID`) REFERENCES `machine` (`Machine_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `repair`
--
ALTER TABLE `repair`
  ADD CONSTRAINT `fk_Repair_Employee1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Repair_Machine1` FOREIGN KEY (`Machine_ID`) REFERENCES `machine` (`Machine_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tak_ salary`
--
ALTER TABLE `tak_ salary`
  ADD CONSTRAINT `fk_Tak_ Salary_Employee1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Take Salary_Contract1` FOREIGN KEY (`Contract_Id`) REFERENCES `contract` (`Contract_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `fk_User Address_User11` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_phon_ number`
--
ALTER TABLE `user_phon_ number`
  ADD CONSTRAINT `fk_User phone number_User11` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_subscription`
--
ALTER TABLE `user_subscription`
  ADD CONSTRAINT `fk_User Subscription_Subscription Package2` FOREIGN KEY (`Package_ID`) REFERENCES `subscription_package` (`Package_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_User Subscription_User11` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_use_machine`
--
ALTER TABLE `user_use_machine`
  ADD CONSTRAINT `fk_Use_copy1_Machine1` FOREIGN KEY (`Machine_ID`) REFERENCES `machine` (`Machine_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Use_copy1_User1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_win_competition`
--
ALTER TABLE `user_win_competition`
  ADD CONSTRAINT `fk_Win_Competition1` FOREIGN KEY (`Competition_Id`) REFERENCES `competition` (`Competition_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Win_User1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_win_prize`
--
ALTER TABLE `user_win_prize`
  ADD CONSTRAINT `fk_User_Win_Prize_Prizes1` FOREIGN KEY (`Prize_ID`) REFERENCES `prizes` (`Prize_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_User_Win_Prize_User1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `visit_branch`
--
ALTER TABLE `visit_branch`
  ADD CONSTRAINT `fk_visit_Branches1` FOREIGN KEY (`Branch_ID`) REFERENCES `branche` (`Branch_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_visit_User1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `visit_corner`
--
ALTER TABLE `visit_corner`
  ADD CONSTRAINT `fk_visit_User2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_visit_copy1_Cornars1` FOREIGN KEY (`Corner_Number`) REFERENCES `cornars` (`Corner_Number`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
