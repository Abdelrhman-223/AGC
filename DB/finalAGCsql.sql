-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema arcade game center db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema arcade game center db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `arcade game center db` DEFAULT CHARACTER SET utf8 ;

-- -----------------------------------------------------
-- Table `arcade game center db`.`branche`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`branche` (
  `Branch_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Branche_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Branch_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`branch_phone_numbers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`branch_phone_numbers` (
  `Branch_Phone_Number` INT(11) NOT NULL,
  `Branch_ID` INT(11) NOT NULL,
  UNIQUE INDEX `Branch Phone Number_UNIQUE` (`Branch_Phone_Number` ASC),
  INDEX `fk_Branch Phone Numbers_Branches1_idx` (`Branch_ID` ASC),
  CONSTRAINT `fk_Branch Phone Numbers_Branches1`
    FOREIGN KEY (`Branch_ID`)
    REFERENCES `arcade game center db`.`branche` (`Branch_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`branche_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`branche_address` (
  `Building` VARCHAR(100) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Branch_ID` INT(11) NOT NULL,
  INDEX `fk_Branches_Adress_Branches1_idx` (`Branch_ID` ASC),
  CONSTRAINT `fk_Branches_Adress_Branches1`
    FOREIGN KEY (`Branch_ID`)
    REFERENCES `arcade game center db`.`branche` (`Branch_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`branche_days`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`branche_days` (
  `Branch_ID` INT(11) NOT NULL,
  `day` VARCHAR(20) NOT NULL,
  INDEX `fk_Branches_days_Branches1_idx` (`Branch_ID` ASC),
  CONSTRAINT `fk_Branches_days_Branches1`
    FOREIGN KEY (`Branch_ID`)
    REFERENCES `arcade game center db`.`branche` (`Branch_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`jobs` (
  `JobId` INT(11) NOT NULL AUTO_INCREMENT,
  `Job_title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`JobId`),
  UNIQUE INDEX `Job title_UNIQUE` (`Job_title` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`shift`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`shift` (
  `ShiftID` INT(11) NOT NULL AUTO_INCREMENT,
  `Shift_Name` VARCHAR(45) NOT NULL,
  `Shift_Start_Time` TIME NOT NULL,
  `Shift_End_Time` TIME NOT NULL,
  PRIMARY KEY (`ShiftID`),
  UNIQUE INDEX `Shift Name_UNIQUE` (`Shift_Name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`employee` (
  `EmployeeID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) NOT NULL,
  `Date_of_birth` DATE NOT NULL,
  `National_number` INT(11) NOT NULL,
  `JobId` INT(11) NOT NULL,
  `ShiftID` INT(11) NOT NULL,
  `Branch_ID` INT(11) NOT NULL,
  `employee_image` BLOB NULL,
  `employee_password` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE INDEX `National number_UNIQUE` (`National_number` ASC),
  INDEX `fk_Employee_Jobs1_idx` (`JobId` ASC),
  INDEX `fk_Employee_Shift1_idx` (`ShiftID` ASC),
  INDEX `fk_Employee_Branche1_idx` (`Branch_ID` ASC),
  CONSTRAINT `fk_Employee_Branche1`
    FOREIGN KEY (`Branch_ID`)
    REFERENCES `arcade game center db`.`branche` (`Branch_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Jobs1`
    FOREIGN KEY (`JobId`)
    REFERENCES `arcade game center db`.`jobs` (`JobId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Shift1`
    FOREIGN KEY (`ShiftID`)
    REFERENCES `arcade game center db`.`shift` (`ShiftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`competition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`competition` (
  `Competition_Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Competition_name` VARCHAR(45) NULL DEFAULT NULL,
  `Start_date` DATE NULL DEFAULT NULL,
  `End_date` DATE NULL DEFAULT NULL,
  `EmployeeID` INT(11) NOT NULL,
  PRIMARY KEY (`Competition_Id`),
  INDEX `fk_Competition_Employee1_idx` (`EmployeeID` ASC),
  CONSTRAINT `fk_Competition_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `arcade game center db`.`employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`cornars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`cornars` (
  `Corner_Number` INT(11) NOT NULL AUTO_INCREMENT,
  `Games_type` VARCHAR(45) NOT NULL,
  `Corner_Name` VARCHAR(45) NOT NULL,
  `Required_age` INT(11) NOT NULL,
  `Num_of_machines` INT(11) NULL DEFAULT NULL,
  `visitors_num` INT(11) NULL DEFAULT NULL,
  `Branch_ID` INT(11) NOT NULL,
  PRIMARY KEY (`Corner_Number`),
  INDEX `fk_Cornars_Branches1_idx` (`Branch_ID` ASC),
  CONSTRAINT `fk_Cornars_Branches1`
    FOREIGN KEY (`Branch_ID`)
    REFERENCES `arcade game center db`.`branche` (`Branch_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`machine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`machine` (
  `Machine_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Machine_name` VARCHAR(45) NOT NULL,
  `Machine_type` VARCHAR(45) NOT NULL,
  `Machine_price` FLOAT NOT NULL,
  `Total_number_of_prizes` INT(11) NOT NULL,
  `Date_of_entry` DATE NOT NULL,
  `Date_of_upload` DATE NOT NULL,
  `Machine_statues` VARCHAR(100) NOT NULL,
  `Usage_fees` FLOAT NOT NULL,
  `Machine_returns_money` FLOAT NOT NULL,
  `Total_time_of_use` FLOAT NULL DEFAULT NULL,
  `Corner_Number` INT(11) NOT NULL,
  PRIMARY KEY (`Machine_ID`),
  UNIQUE INDEX `Machine name_UNIQUE` (`Machine_name` ASC),
  UNIQUE INDEX `Machine type_UNIQUE` (`Machine_type` ASC),
  INDEX `fk_Machine_Cornars1_idx` (`Corner_Number` ASC),
  CONSTRAINT `fk_Machine_Cornars1`
    FOREIGN KEY (`Corner_Number`)
    REFERENCES `arcade game center db`.`cornars` (`Corner_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`prizes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`prizes` (
  `Prize_ID` INT(11) NOT NULL,
  `Prize Name` VARCHAR(45) NULL DEFAULT NULL,
  `Prize_type` VARCHAR(45) NULL DEFAULT NULL,
  `Prize_price` FLOAT NULL DEFAULT NULL,
  `Machine_ID` INT(11) NOT NULL,
  PRIMARY KEY (`Prize_ID`),
  INDEX `fk_Prizes_Machine1_idx` (`Machine_ID` ASC),
  CONSTRAINT `fk_Prizes_Machine1`
    FOREIGN KEY (`Machine_ID`)
    REFERENCES `arcade game center db`.`machine` (`Machine_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`competition_prizes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`competition_prizes` (
  `Prize_Rank` INT(11) NOT NULL,
  `Competition_Id` INT(11) NOT NULL,
  `Prize_ID` INT(11) NOT NULL,
  INDEX `fk_Competition_Prizes_Competition1_idx` (`Competition_Id` ASC),
  INDEX `fk_Competition_Prizes_Prizes1_idx` (`Prize_ID` ASC),
  CONSTRAINT `fk_Competition_Prizes_Competition1`
    FOREIGN KEY (`Competition_Id`)
    REFERENCES `arcade game center db`.`competition` (`Competition_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Competition_Prizes_Prizes1`
    FOREIGN KEY (`Prize_ID`)
    REFERENCES `arcade game center db`.`prizes` (`Prize_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`contract`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`contract` (
  `Contract_Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Employment_contract_status` ENUM('Ongoing', 'Rejected', 'Temporarily Suspended') NOT NULL,
  `Employment_status` ENUM('Temporary', 'Permanent') NOT NULL,
  `Main_salary` FLOAT NOT NULL,
  `Annual_salary_increase_rate` FLOAT NOT NULL,
  `Salary_after_Increase` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`Contract_Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`employee_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`employee_address` (
  `Street` VARCHAR(50) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `EmployeeID` INT(11) NOT NULL,
  INDEX `fk_Employee Address_Employee1_idx` (`EmployeeID` ASC),
  CONSTRAINT `fk_Employee Address_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `arcade game center db`.`employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`employee_attendance_time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`employee_attendance_time` (
  `Attendance_status` ENUM('Attend', 'Absent') NOT NULL DEFAULT 'Absent',
  `Attendance_date_time` DATETIME NOT NULL,
  `Departure_date_time` DATETIME NOT NULL,
  `ShiftID` INT(11) NOT NULL,
  `EmployeeID` INT(11) NOT NULL,
  INDEX `fk_Employee Attendance_Shift2_idx` (`ShiftID` ASC),
  INDEX `fk_Employee_Attendance_Time_Employee1_idx` (`EmployeeID` ASC),
  CONSTRAINT `fk_Employee Attendance_Shift2`
    FOREIGN KEY (`ShiftID`)
    REFERENCES `arcade game center db`.`shift` (`ShiftID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Attendance_Time_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `arcade game center db`.`employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`employee_phone_numbers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`employee_phone_numbers` (
  `Phone_number` INT(11) NOT NULL,
  `EmployeeID` INT(11) NOT NULL,
  UNIQUE INDEX `Phone number_UNIQUE` (`Phone_number` ASC),
  INDEX `fk_Employee_Phone_Numbers_Employee1_idx` (`EmployeeID` ASC),
  CONSTRAINT `fk_Employee_Phone_Numbers_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `arcade game center db`.`employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`user` (
  `UserID` INT(11) NOT NULL AUTO_INCREMENT,
  `User_name` VARCHAR(50) NOT NULL,
  `User_gender` VARCHAR(30) NOT NULL,
  `Birth_date` DATE NOT NULL,
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`joined_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`joined_user` (
  `Join_Date` DATETIME NULL DEFAULT NULL,
  `Competition_Id` INT(11) NOT NULL,
  `UserID` INT(11) NOT NULL,
  INDEX `fk_Joined User_Competition1_idx` (`Competition_Id` ASC),
  INDEX `fk_Joined User_User1_idx` (`UserID` ASC),
  CONSTRAINT `fk_Joined User_Competition1`
    FOREIGN KEY (`Competition_Id`)
    REFERENCES `arcade game center db`.`competition` (`Competition_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Joined User_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `arcade game center db`.`user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`ls_lifted`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`ls_lifted` (
  `Lifted_Data` DATE NOT NULL,
  ` Lifted_reason` VARCHAR(250) NOT NULL,
  `Machine_ID` INT(11) NOT NULL,
  UNIQUE INDEX ` Lifted reason_UNIQUE` (` Lifted_reason` ASC),
  INDEX `fk_ls Lifted_Machine1_idx` (`Machine_ID` ASC),
  CONSTRAINT `fk_ls Lifted_Machine1`
    FOREIGN KEY (`Machine_ID`)
    REFERENCES `arcade game center db`.`machine` (`Machine_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`make_contract`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`make_contract` (
  `Work_end_date` DATE NULL DEFAULT NULL,
  `Work_start_date` DATE NOT NULL,
  `Contract_Id` INT(11) NOT NULL,
  `EmployeeID` INT(11) NOT NULL,
  INDEX `fk_Make Contract_Contract1_idx` (`Contract_Id` ASC),
  INDEX `fk_Make Contract_Employee1_idx` (`EmployeeID` ASC),
  CONSTRAINT `fk_Make Contract_Contract1`
    FOREIGN KEY (`Contract_Id`)
    REFERENCES `arcade game center db`.`contract` (`Contract_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Make Contract_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `arcade game center db`.`employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`subscription_package`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`subscription_package` (
  ` Package_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Package_name` VARCHAR(45) NOT NULL,
  `Package_price` FLOAT NOT NULL,
  `Package_Duration` INT(11) NOT NULL COMMENT 'The duration in days',
  `Package_limits` INT(11) NOT NULL COMMENT 'Package limits is times of use the machiens',
  PRIMARY KEY (` Package_ID`),
  UNIQUE INDEX `Packadge name_UNIQUE` (`Package_name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`permitted_machine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`permitted_machine` (
  `Package_ID` INT(11) NOT NULL,
  `Machine_ID` INT(11) NOT NULL,
  INDEX `fk_Permitted Machine_Subscription Package1_idx` (`Package_ID` ASC),
  INDEX `fk_Permitted Machine_Machine1_idx` (`Machine_ID` ASC),
  CONSTRAINT `fk_Permitted Machine_Machine1`
    FOREIGN KEY (`Machine_ID`)
    REFERENCES `arcade game center db`.`machine` (`Machine_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Permitted Machine_Subscription Package1`
    FOREIGN KEY (`Package_ID`)
    REFERENCES `arcade game center db`.`subscription_package` (` Package_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`repair`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`repair` (
  `Repair_date_time` DATETIME NOT NULL,
  `Repairs_cost` FLOAT NOT NULL,
  `Malfunction` VARCHAR(100) NOT NULL,
  `Machine_ID` INT(11) NOT NULL,
  `EmployeeID` INT(11) NOT NULL,
  INDEX `fk_Repair_Machine1_idx` (`Machine_ID` ASC),
  INDEX `fk_Repair_Employee1_idx` (`EmployeeID` ASC),
  CONSTRAINT `fk_Repair_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `arcade game center db`.`employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Repair_Machine1`
    FOREIGN KEY (`Machine_ID`)
    REFERENCES `arcade game center db`.`machine` (`Machine_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`tak_ salary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`tak_ salary` (
  `Total_salary` FLOAT NULL DEFAULT NULL,
  `Date_of_receipt` DATE NOT NULL,
  `Contract_Id` INT(11) NOT NULL,
  `EmployeeID` INT(11) NOT NULL,
  INDEX `fk_Take Salary_Contract1_idx` (`Contract_Id` ASC),
  INDEX `fk_Tak_ Salary_Employee1_idx` (`EmployeeID` ASC),
  CONSTRAINT `fk_Tak_ Salary_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `arcade game center db`.`employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Take Salary_Contract1`
    FOREIGN KEY (`Contract_Id`)
    REFERENCES `arcade game center db`.`contract` (`Contract_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`tasks` (
  `Task_id` INT(11) NOT NULL,
  `Task_description` LONGTEXT NOT NULL,
  `starting_date` DATETIME NOT NULL,
  `Finishing_date` DATETIME NOT NULL,
  `Duration` INT(11) NOT NULL,
  `Task_title` VARCHAR(150) NOT NULL,
  `Employee_EmployeeID` INT(11) NOT NULL,
  `Task_statues` ENUM('Completed', 'In Progress', 'On Hold') NOT NULL,
  PRIMARY KEY (`Task_id`),
  INDEX `fk_Tasks_Employee1_idx` (`Employee_EmployeeID` ASC),
  CONSTRAINT `fk_Tasks_Employee1`
    FOREIGN KEY (`Employee_EmployeeID`)
    REFERENCES `arcade game center db`.`employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`user_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`user_address` (
  `Streat` VARCHAR(60) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `UserID` INT(11) NOT NULL,
  INDEX `fk_User Address_User11_idx` (`UserID` ASC),
  CONSTRAINT `fk_User Address_User11`
    FOREIGN KEY (`UserID`)
    REFERENCES `arcade game center db`.`user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`user_phon_ number`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`user_phon_ number` (
  `Phone_number` INT(11) NOT NULL,
  `UserID` INT(11) NOT NULL,
  UNIQUE INDEX `Phone_number_UNIQUE` (`Phone_number` ASC),
  INDEX `fk_User phone number_User11_idx` (`UserID` ASC),
  CONSTRAINT `fk_User phone number_User11`
    FOREIGN KEY (`UserID`)
    REFERENCES `arcade game center db`.`user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`user_subscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`user_subscription` (
  `Subscription_date` DATETIME NOT NULL,
  `UserID` INT(11) NOT NULL,
  `Package_ID` INT(11) NOT NULL,
  INDEX `fk_User Subscription_User11_idx` (`UserID` ASC),
  INDEX `fk_User Subscription_Subscription Package2_idx` (`Package_ID` ASC),
  CONSTRAINT `fk_User Subscription_Subscription Package2`
    FOREIGN KEY (`Package_ID`)
    REFERENCES `arcade game center db`.`subscription_package` (` Package_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User Subscription_User11`
    FOREIGN KEY (`UserID`)
    REFERENCES `arcade game center db`.`user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`user_use_machine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`user_use_machine` (
  `Time_of_use` DATETIME NOT NULL,
  `Machine_ID` INT(11) NOT NULL,
  `UserID` INT(11) NOT NULL,
  INDEX `fk_Use_copy1_Machine1_idx` (`Machine_ID` ASC),
  INDEX `fk_Use_copy1_User1_idx` (`UserID` ASC),
  CONSTRAINT `fk_Use_copy1_Machine1`
    FOREIGN KEY (`Machine_ID`)
    REFERENCES `arcade game center db`.`machine` (`Machine_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Use_copy1_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `arcade game center db`.`user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`user_win_competition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`user_win_competition` (
  `Rank` INT(11) NOT NULL,
  `Competition_Id` INT(11) NOT NULL,
  `UserID` INT(11) NOT NULL,
  INDEX `fk_Win_Competition1_idx` (`Competition_Id` ASC),
  INDEX `fk_Win_User1_idx` (`UserID` ASC),
  CONSTRAINT `fk_Win_Competition1`
    FOREIGN KEY (`Competition_Id`)
    REFERENCES `arcade game center db`.`competition` (`Competition_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Win_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `arcade game center db`.`user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`user_win_prize`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`user_win_prize` (
  `Draw_timing` DATETIME NULL DEFAULT NULL,
  `Prize_ID` INT(11) NOT NULL,
  `UserID` INT(11) NOT NULL,
  INDEX `fk_User_Win_Prize_Prizes1_idx` (`Prize_ID` ASC),
  INDEX `fk_User_Win_Prize_User1_idx` (`UserID` ASC),
  CONSTRAINT `fk_User_Win_Prize_Prizes1`
    FOREIGN KEY (`Prize_ID`)
    REFERENCES `arcade game center db`.`prizes` (`Prize_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Win_Prize_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `arcade game center db`.`user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`visit_branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`visit_branch` (
  `Time_of_entry` DATETIME NOT NULL,
  `Time_of_go` DATETIME NULL DEFAULT NULL,
  `Branch_ID` INT(11) NOT NULL,
  `UserID` INT(11) NOT NULL,
  INDEX `fk_visit_Branches1_idx` (`Branch_ID` ASC),
  INDEX `fk_visit_User1_idx` (`UserID` ASC),
  CONSTRAINT `fk_visit_Branches1`
    FOREIGN KEY (`Branch_ID`)
    REFERENCES `arcade game center db`.`branche` (`Branch_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_visit_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `arcade game center db`.`user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `arcade game center db`.`visit_corner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `arcade game center db`.`visit_corner` (
  `Time_of_entry` DATETIME NOT NULL,
  `Time_of_go` DATETIME NULL DEFAULT NULL,
  `Corner_Number` INT(11) NOT NULL,
  `UserID` INT(11) NOT NULL,
  INDEX `fk_visit_copy1_Cornars1_idx` (`Corner_Number` ASC),
  INDEX `fk_visit_User2_idx` (`UserID` ASC),
  CONSTRAINT `fk_visit_User2`
    FOREIGN KEY (`UserID`)
    REFERENCES `arcade game center db`.`user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_visit_copy1_Cornars1`
    FOREIGN KEY (`Corner_Number`)
    REFERENCES `arcade game center db`.`cornars` (`Corner_Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
