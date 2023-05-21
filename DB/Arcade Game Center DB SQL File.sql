-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Arcade Game Center DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Arcade Game Center DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Arcade Game Center DB` DEFAULT CHARACTER SET utf8 ;
USE `Arcade Game Center DB` ;

-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Jobs` (
  `JobId` INT NOT NULL AUTO_INCREMENT,
  `Job_title` VARCHAR(45) NOT NULL,
  `Job_place` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`JobId`),
  UNIQUE INDEX `Job title_UNIQUE` (`Job_title` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Shift`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Shift` (
  `ShiftID` INT NOT NULL AUTO_INCREMENT,
  `Shift_Name` VARCHAR(45) NOT NULL,
  `Shift_Start_Time` VARCHAR(45) NOT NULL,
  `Shift_End_Time` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ShiftID`),
  UNIQUE INDEX `Shift Name_UNIQUE` (`Shift_Name` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Branche`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Branche` (
  `Branch_ID` INT NOT NULL AUTO_INCREMENT,
  `Branche_name` VARCHAR(45) NOT NULL,
  `Branche_number` INT NOT NULL,
  PRIMARY KEY (`Branch_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Employee` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) NOT NULL,
  `Date_of_birth` DATE NOT NULL,
  `National_number` INT NOT NULL,
  `JobId` INT NOT NULL,
  `ShiftID` INT NOT NULL,
  `Branch_ID` INT NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE INDEX `National number_UNIQUE` (`National_number` ASC) ,
  INDEX `fk_Employee_Jobs1_idx` (`JobId` ASC) ,
  INDEX `fk_Employee_Shift1_idx` (`ShiftID` ASC) ,
  INDEX `fk_Employee_Branche1_idx` (`Branch_ID` ASC) ,
  CONSTRAINT `fk_Employee_Jobs1`
    FOREIGN KEY (`JobId`)
    REFERENCES `Arcade Game Center DB`.`Jobs` (`JobId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Shift1`
    FOREIGN KEY (`ShiftID`)
    REFERENCES `Arcade Game Center DB`.`Shift` (`ShiftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Branche1`
    FOREIGN KEY (`Branch_ID`)
    REFERENCES `Arcade Game Center DB`.`Branche` (`Branch_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Employee_Phone_Numbers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Employee_Phone_Numbers` (
  `Phone_number` INT NOT NULL,
  `EmployeeID` INT NOT NULL,
  UNIQUE INDEX `Phone number_UNIQUE` (`Phone_number` ASC) ,
  INDEX `fk_Employee_Phone_Numbers_Employee1_idx` (`EmployeeID` ASC) ,
  CONSTRAINT `fk_Employee_Phone_Numbers_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Arcade Game Center DB`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Employee_Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Employee_Address` (
  `Street` VARCHAR(50) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `EmployeeID` INT NOT NULL,
  INDEX `fk_Employee Address_Employee1_idx` (`EmployeeID` ASC) ,
  CONSTRAINT `fk_Employee Address_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Arcade Game Center DB`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Employee_Attendance_Time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Employee_Attendance_Time` (
  `Attendance_status` ENUM('Attend', 'Absent') NOT NULL DEFAULT 'Absent',
  `Attendance_date_time` DATETIME NOT NULL,
  `Departure_date_time` DATETIME NOT NULL,
  `ShiftID` INT NOT NULL,
  `EmployeeID` INT NOT NULL,
  INDEX `fk_Employee Attendance_Shift2_idx` (`ShiftID` ASC) ,
  INDEX `fk_Employee_Attendance_Time_Employee1_idx` (`EmployeeID` ASC) ,
  CONSTRAINT `fk_Employee Attendance_Shift2`
    FOREIGN KEY (`ShiftID`)
    REFERENCES `Arcade Game Center DB`.`Shift` (`ShiftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Attendance_Time_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Arcade Game Center DB`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Contract`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Contract` (
  `Contract_Id` INT NOT NULL AUTO_INCREMENT,
  `Employment_contract_status` ENUM("Ongoing", "Rejected", "Temporarily Suspended") NOT NULL,
  `Employment_status` ENUM("Temporary", "Permanent") NOT NULL,
  `Main_salary` FLOAT NOT NULL,
  `Annual_salary_increase_rate` FLOAT NOT NULL,
  `Salary_after_Increase` FLOAT NULL,
  PRIMARY KEY (`Contract_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Make_Contract`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Make_Contract` (
  `Work end date` DATE NULL,
  `Work_start_date` DATE NOT NULL,
  `Contract_Id` INT NOT NULL,
  `EmployeeID` INT NOT NULL,
  INDEX `fk_Make Contract_Contract1_idx` (`Contract_Id` ASC) ,
  INDEX `fk_Make Contract_Employee1_idx` (`EmployeeID` ASC) ,
  CONSTRAINT `fk_Make Contract_Contract1`
    FOREIGN KEY (`Contract_Id`)
    REFERENCES `Arcade Game Center DB`.`Contract` (`Contract_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Make Contract_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Arcade Game Center DB`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Tak_ Salary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Tak_ Salary` (
  `Total_salary` FLOAT NULL,
  `Date_of_receipt` DATE NOT NULL,
  `Contract_Id` INT NOT NULL,
  `EmployeeID` INT NOT NULL,
  INDEX `fk_Take Salary_Contract1_idx` (`Contract_Id` ASC) ,
  INDEX `fk_Tak_ Salary_Employee1_idx` (`EmployeeID` ASC) ,
  CONSTRAINT `fk_Take Salary_Contract1`
    FOREIGN KEY (`Contract_Id`)
    REFERENCES `Arcade Game Center DB`.`Contract` (`Contract_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tak_ Salary_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Arcade Game Center DB`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`User` (
  `UserID` INT NOT NULL AUTO_INCREMENT,
  `User_name` VARCHAR(50) NOT NULL,
  `User_gender` VARCHAR(30) NOT NULL,
  `Birth_date` DATE NOT NULL,
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Visit_Branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Visit_Branch` (
  `Time_of_entry` DATETIME NOT NULL,
  `Time_of_go` DATETIME NULL,
  `Branch_ID` INT NOT NULL,
  `UserID` INT NOT NULL,
  INDEX `fk_visit_Branches1_idx` (`Branch_ID` ASC) ,
  INDEX `fk_visit_User1_idx` (`UserID` ASC) ,
  CONSTRAINT `fk_visit_Branches1`
    FOREIGN KEY (`Branch_ID`)
    REFERENCES `Arcade Game Center DB`.`Branche` (`Branch_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_visit_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `Arcade Game Center DB`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Branch_Phone_Numbers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Branch_Phone_Numbers` (
  `Branch_Phone_Number` INT NOT NULL,
  `Branch_ID` INT NOT NULL,
  UNIQUE INDEX `Branch Phone Number_UNIQUE` (`Branch_Phone_Number` ASC) ,
  INDEX `fk_Branch Phone Numbers_Branches1_idx` (`Branch_ID` ASC) ,
  CONSTRAINT `fk_Branch Phone Numbers_Branches1`
    FOREIGN KEY (`Branch_ID`)
    REFERENCES `Arcade Game Center DB`.`Branche` (`Branch_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Branche_days`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Branche_days` (
  `work_days` VARCHAR(20) NOT NULL,
  `Branch_ID` INT NOT NULL,
  INDEX `fk_Branches_days_Branches1_idx` (`Branch_ID` ASC) ,
  CONSTRAINT `fk_Branches_days_Branches1`
    FOREIGN KEY (`Branch_ID`)
    REFERENCES `Arcade Game Center DB`.`Branche` (`Branch_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Branche_Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Branche_Address` (
  `Street` VARCHAR(100) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Branch_ID` INT NOT NULL,
  INDEX `fk_Branches_Adress_Branches1_idx` (`Branch_ID` ASC) ,
  CONSTRAINT `fk_Branches_Adress_Branches1`
    FOREIGN KEY (`Branch_ID`)
    REFERENCES `Arcade Game Center DB`.`Branche` (`Branch_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Cornars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Cornars` (
  `Corner_Number` INT NOT NULL AUTO_INCREMENT,
  `Games_type` VARCHAR(45) NOT NULL,
  `Corner_Name` VARCHAR(45) NOT NULL,
  `Required_age` INT NOT NULL,
  `Num_of_machines` INT NULL,
  `visitors_num` INT NULL,
  `Branch_ID` INT NOT NULL,
  PRIMARY KEY (`Corner_Number`),
  INDEX `fk_Cornars_Branches1_idx` (`Branch_ID` ASC) ,
  CONSTRAINT `fk_Cornars_Branches1`
    FOREIGN KEY (`Branch_ID`)
    REFERENCES `Arcade Game Center DB`.`Branche` (`Branch_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Machine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Machine` (
  `Machine_ID` INT NOT NULL AUTO_INCREMENT,
  `Machine_name` VARCHAR(45) NOT NULL,
  `Machine_type` VARCHAR(45) NOT NULL,
  `Machine_price` FLOAT NOT NULL,
  `Total_number_of_prizes` INT NOT NULL,
  `Date_of|_entry` DATE NOT NULL,
  `Date_of_upload` DATE NOT NULL,
  `Machine_statues` VARCHAR(100) NOT NULL,
  `Usage_fees` FLOAT NOT NULL,
  `Machine_returns_money` FLOAT NOT NULL,
  `Total_time_of_use` DATETIME NOT NULL,
  `Corner_Number` INT NOT NULL,
  PRIMARY KEY (`Machine_ID`),
  UNIQUE INDEX `Machine name_UNIQUE` (`Machine_name` ASC) ,
  UNIQUE INDEX `Machine type_UNIQUE` (`Machine_type` ASC) ,
  INDEX `fk_Machine_Cornars1_idx` (`Corner_Number` ASC) ,
  CONSTRAINT `fk_Machine_Cornars1`
    FOREIGN KEY (`Corner_Number`)
    REFERENCES `Arcade Game Center DB`.`Cornars` (`Corner_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Repair`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Repair` (
  `Repair_date_time` DATETIME NOT NULL,
  `Repairs_cost` FLOAT NOT NULL,
  `Malfunction` VARCHAR(100) NOT NULL,
  `Machine_ID` INT NOT NULL,
  `EmployeeID` INT NOT NULL,
  INDEX `fk_Repair_Machine1_idx` (`Machine_ID` ASC) ,
  INDEX `fk_Repair_Employee1_idx` (`EmployeeID` ASC) ,
  CONSTRAINT `fk_Repair_Machine1`
    FOREIGN KEY (`Machine_ID`)
    REFERENCES `Arcade Game Center DB`.`Machine` (`Machine_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Repair_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Arcade Game Center DB`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Prizes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Prizes` (
  `Prize_ID` INT NOT NULL,
  `Prize Name` VARCHAR(45) NULL,
  `Prize_type` VARCHAR(45) NULL,
  `Prize_price` FLOAT NULL,
  `Machine_ID` INT NOT NULL,
  PRIMARY KEY (`Prize_ID`),
  INDEX `fk_Prizes_Machine1_idx` (`Machine_ID` ASC) ,
  CONSTRAINT `fk_Prizes_Machine1`
    FOREIGN KEY (`Machine_ID`)
    REFERENCES `Arcade Game Center DB`.`Machine` (`Machine_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Competition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Competition` (
  `Competition_Id` INT NOT NULL AUTO_INCREMENT,
  `Competition_name` VARCHAR(45) NULL,
  `Start_date` DATE NULL,
  `End_date` DATE NULL,
  `EmployeeID` INT NOT NULL,
  PRIMARY KEY (`Competition_Id`),
  INDEX `fk_Competition_Employee1_idx` (`EmployeeID` ASC) ,
  CONSTRAINT `fk_Competition_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Arcade Game Center DB`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`User_Win_Competition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`User_Win_Competition` (
  `Rank` INT NOT NULL,
  `Competition_Id` INT NOT NULL,
  `UserID` INT NOT NULL,
  INDEX `fk_Win_Competition1_idx` (`Competition_Id` ASC) ,
  INDEX `fk_Win_User1_idx` (`UserID` ASC) ,
  CONSTRAINT `fk_Win_Competition1`
    FOREIGN KEY (`Competition_Id`)
    REFERENCES `Arcade Game Center DB`.`Competition` (`Competition_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Win_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `Arcade Game Center DB`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Joined_User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Joined_User` (
  `Join_Date` DATETIME NULL,
  `Competition_Id` INT NOT NULL,
  `UserID` INT NOT NULL,
  INDEX `fk_Joined User_Competition1_idx` (`Competition_Id` ASC) ,
  INDEX `fk_Joined User_User1_idx` (`UserID` ASC) ,
  CONSTRAINT `fk_Joined User_Competition1`
    FOREIGN KEY (`Competition_Id`)
    REFERENCES `Arcade Game Center DB`.`Competition` (`Competition_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Joined User_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `Arcade Game Center DB`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`User_phon_ number`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`User_phon_ number` (
  `Phone_number` INT NOT NULL,
  `UserID` INT NOT NULL,
  INDEX `fk_User phone number_User11_idx` (`UserID` ASC) ,
  UNIQUE INDEX `Phone_number_UNIQUE` (`Phone_number` ASC) ,
  CONSTRAINT `fk_User phone number_User11`
    FOREIGN KEY (`UserID`)
    REFERENCES `Arcade Game Center DB`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`User_Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`User_Address` (
  `Streat` VARCHAR(60) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `UserID` INT NOT NULL,
  UNIQUE INDEX `Streat_UNIQUE` (`Streat` ASC) ,
  UNIQUE INDEX `City_UNIQUE` (`City` ASC) ,
  INDEX `fk_User Address_User11_idx` (`UserID` ASC) ,
  CONSTRAINT `fk_User Address_User11`
    FOREIGN KEY (`UserID`)
    REFERENCES `Arcade Game Center DB`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Subscription_Package`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Subscription_Package` (
  ` Package_ID` INT NOT NULL AUTO_INCREMENT,
  `Package_name` VARCHAR(45) NOT NULL,
  `Package_price` FLOAT NOT NULL,
  `Package_Duration` INT NOT NULL COMMENT 'The duration in days',
  `Package_limits` INT NOT NULL COMMENT 'Package limits is times of use the machiens',
  PRIMARY KEY (` Package_ID`),
  UNIQUE INDEX `Packadge name_UNIQUE` (`Package_name` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`User_Subscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`User_Subscription` (
  `Subscription_date` DATETIME NOT NULL,
  `UserID` INT NOT NULL,
  `Package_ID` INT NOT NULL,
  INDEX `fk_User Subscription_User11_idx` (`UserID` ASC) ,
  INDEX `fk_User Subscription_Subscription Package2_idx` (`Package_ID` ASC) ,
  CONSTRAINT `fk_User Subscription_User11`
    FOREIGN KEY (`UserID`)
    REFERENCES `Arcade Game Center DB`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User Subscription_Subscription Package2`
    FOREIGN KEY (`Package_ID`)
    REFERENCES `Arcade Game Center DB`.`Subscription_Package` (` Package_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Permitted_Machine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Permitted_Machine` (
  `Package_ID` INT NOT NULL,
  `Machine_ID` INT NOT NULL,
  INDEX `fk_Permitted Machine_Subscription Package1_idx` (`Package_ID` ASC) ,
  INDEX `fk_Permitted Machine_Machine1_idx` (`Machine_ID` ASC) ,
  CONSTRAINT `fk_Permitted Machine_Subscription Package1`
    FOREIGN KEY (`Package_ID`)
    REFERENCES `Arcade Game Center DB`.`Subscription_Package` (` Package_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Permitted Machine_Machine1`
    FOREIGN KEY (`Machine_ID`)
    REFERENCES `Arcade Game Center DB`.`Machine` (`Machine_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`ls_Lifted`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`ls_Lifted` (
  `Lifted_Data` DATETIME NOT NULL,
  ` Lifted_reason` VARCHAR(250) NOT NULL,
  `Machine_ID` INT NOT NULL,
  UNIQUE INDEX ` Lifted reason_UNIQUE` (` Lifted_reason` ASC) ,
  INDEX `fk_ls Lifted_Machine1_idx` (`Machine_ID` ASC) ,
  CONSTRAINT `fk_ls Lifted_Machine1`
    FOREIGN KEY (`Machine_ID`)
    REFERENCES `Arcade Game Center DB`.`Machine` (`Machine_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Visit_Corner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Visit_Corner` (
  `Time_of_entry` DATETIME NOT NULL,
  `Time_of_go` DATETIME NULL,
  `Corner_Number` INT NOT NULL,
  `UserID` INT NOT NULL,
  INDEX `fk_visit_copy1_Cornars1_idx` (`Corner_Number` ASC) ,
  INDEX `fk_visit_User2_idx` (`UserID` ASC) ,
  CONSTRAINT `fk_visit_copy1_Cornars1`
    FOREIGN KEY (`Corner_Number`)
    REFERENCES `Arcade Game Center DB`.`Cornars` (`Corner_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_visit_User2`
    FOREIGN KEY (`UserID`)
    REFERENCES `Arcade Game Center DB`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`User_use_Machine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`User_use_Machine` (
  `Time_of_use` DATETIME NOT NULL,
  `Machine_ID` INT NOT NULL,
  `UserID` INT NOT NULL,
  INDEX `fk_Use_copy1_Machine1_idx` (`Machine_ID` ASC) ,
  INDEX `fk_Use_copy1_User1_idx` (`UserID` ASC) ,
  CONSTRAINT `fk_Use_copy1_Machine1`
    FOREIGN KEY (`Machine_ID`)
    REFERENCES `Arcade Game Center DB`.`Machine` (`Machine_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Use_copy1_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `Arcade Game Center DB`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`User_Win_Prize`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`User_Win_Prize` (
  `Draw_timing` DATETIME NULL,
  `Prize_ID` INT NOT NULL,
  `UserID` INT NOT NULL,
  INDEX `fk_User_Win_Prize_Prizes1_idx` (`Prize_ID` ASC) ,
  INDEX `fk_User_Win_Prize_User1_idx` (`UserID` ASC) ,
  CONSTRAINT `fk_User_Win_Prize_Prizes1`
    FOREIGN KEY (`Prize_ID`)
    REFERENCES `Arcade Game Center DB`.`Prizes` (`Prize_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Win_Prize_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `Arcade Game Center DB`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Arcade Game Center DB`.`Competition_Prizes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Arcade Game Center DB`.`Competition_Prizes` (
  `Prize_Rank` INT NOT NULL,
  `Competition_Id` INT NOT NULL,
  `Prize_ID` INT NOT NULL,
  INDEX `fk_Competition_Prizes_Competition1_idx` (`Competition_Id` ASC) ,
  INDEX `fk_Competition_Prizes_Prizes1_idx` (`Prize_ID` ASC) ,
  CONSTRAINT `fk_Competition_Prizes_Competition1`
    FOREIGN KEY (`Competition_Id`)
    REFERENCES `Arcade Game Center DB`.`Competition` (`Competition_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Competition_Prizes_Prizes1`
    FOREIGN KEY (`Prize_ID`)
    REFERENCES `Arcade Game Center DB`.`Prizes` (`Prize_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
