-- MySQL Workbench Forward Engineering
DROP DATABASE IF EXISTS mydb;
CREATE DATABASE mydb;
USE mydb;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Users` (
  `user_ID` BIGINT(255) ZEROFILL NOT NULL,
  `firstName` VARCHAR(500) NOT NULL,
  `lastName` VARCHAR(500) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phoneNumber` VARCHAR(45) NOT NULL,
  `dateOfBirth` DATE NOT NULL,
  `createdAt` DATETIME NOT NULL,
  PRIMARY KEY (`user_ID`),
  UNIQUE INDEX `idUser_UNIQUE` (`user_ID` ASC) INVISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Flights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Flights` (
  `flight_ID` BIGINT(255) NOT NULL,
  `airline` VARCHAR(45) NOT NULL,
  `departureAirport` VARCHAR(45) NOT NULL,
  `arrivalAirport` VARCHAR(45) NOT NULL,
  `departureDate` DATE NOT NULL,
  `arrivalDate` DATE NOT NULL,
  `directFlight` TINYINT NOT NULL,
  `ticketPrice` DOUBLE NOT NULL,
  `createdAt` DATETIME NOT NULL,
  PRIMARY KEY (`flight_ID`),
  UNIQUE INDEX `idFlights_UNIQUE` (`flight_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Transports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Transports` (
  `transport_ID` BIGINT(255) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `capacity` INT NOT NULL,
  `available` TINYINT NOT NULL,
  `transportPrice` DOUBLE NOT NULL,
  `createdAt` DATETIME NOT NULL,
  PRIMARY KEY (`transport_ID`),
  UNIQUE INDEX `idTransports_UNIQUE` (`transport_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TravelPackages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TravelPackages` (
  `travelPackage_ID` BIGINT(255) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `packagePrice` DOUBLE NOT NULL,
  `active` TINYINT NOT NULL,
  `startDate` DATE NOT NULL,
  `endDate` DATE NOT NULL,
  `createdAt` DATETIME NOT NULL,
  PRIMARY KEY (`travelPackage_ID`),
  UNIQUE INDEX `idTravelPackage_UNIQUE` (`travelPackage_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Trips`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Trips` (
  `trip_ID` BIGINT(255) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `price` DOUBLE NOT NULL,
  `availabe` TINYINT NOT NULL,
  `departureDate` DATETIME NOT NULL,
  `returnDate` DATETIME NOT NULL,
  `createdAt` DATE NOT NULL,
  `flight_ID` BIGINT(255) NOT NULL,
  `transport_ID` BIGINT(255) NOT NULL,
  `travelPackage_ID` BIGINT(255) NOT NULL,
  PRIMARY KEY (`trip_ID`),
  UNIQUE INDEX `idTrips_UNIQUE` (`trip_ID` ASC) VISIBLE,
  INDEX `fk_Trips_Flights1_idx` (`flight_ID` ASC) VISIBLE,
  INDEX `fk_Trips_Transports1_idx` (`transport_ID` ASC) VISIBLE,
  INDEX `fk_Trips_TravelPackage1_idx` (`travelPackage_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Trips_Flights1`
    FOREIGN KEY (`flight_ID`)
    REFERENCES `mydb`.`Flights` (`flight_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trips_Transports1`
    FOREIGN KEY (`transport_ID`)
    REFERENCES `mydb`.`Transports` (`transport_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trips_TravelPackage1`
    FOREIGN KEY (`travelPackage_ID`)
    REFERENCES `mydb`.`TravelPackages` (`travelPackage_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payments` (
  `payment_ID` BIGINT(255) NOT NULL,
  `paymentMethod` VARCHAR(45) NOT NULL,
  `amount` DOUBLE NOT NULL,
  `successful` TINYINT NOT NULL,
  `paymentDate` DATE NOT NULL,
  `createdAt` DATETIME NOT NULL,
  PRIMARY KEY (`payment_ID`),
  UNIQUE INDEX `idPayments_UNIQUE` (`payment_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bookings` (
  `booking_ID` BIGINT(255) NOT NULL,
  `totalPrice` DOUBLE NOT NULL,
  `confirmed` TINYINT NOT NULL,
  `bookingDate` DATE NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `user_ID` BIGINT(255) ZEROFILL NOT NULL,
  `trip_ID` BIGINT(255) NOT NULL,
  `payment_ID` BIGINT(255) NOT NULL,
  PRIMARY KEY (`booking_ID`),
  UNIQUE INDEX `idBookings_UNIQUE` (`booking_ID` ASC) VISIBLE,
  INDEX `fk_Bookings_Users_idx` (`user_ID` ASC) VISIBLE,
  INDEX `fk_Bookings_Trips1_idx` (`trip_ID` ASC) VISIBLE,
  INDEX `fk_Bookings_Payments1_idx` (`payment_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_Users`
    FOREIGN KEY (`user_ID`)
    REFERENCES `mydb`.`Users` (`user_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bookings_Trips1`
    FOREIGN KEY (`trip_ID`)
    REFERENCES `mydb`.`Trips` (`trip_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bookings_Payments1`
    FOREIGN KEY (`payment_ID`)
    REFERENCES `mydb`.`Payments` (`payment_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Destinations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Destinations` (
  `destination_ID` BIGINT(255) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `visaRequired` TINYINT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  PRIMARY KEY (`destination_ID`),
  UNIQUE INDEX `idDestinations_UNIQUE` (`destination_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Hotels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Hotels` (
  `hotel_ID` BIGINT(255) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `starRating` INT NOT NULL,
  `breakfastIncluded` TINYINT NOT NULL,
  `pricePerNight` DOUBLE NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `Trips_idTrips` INT NOT NULL,
  PRIMARY KEY (`hotel_ID`),
  UNIQUE INDEX `idHotels_UNIQUE` (`hotel_ID` ASC) VISIBLE,
  INDEX `fk_Hotels_Trips1_idx` (`Trips_idTrips` ASC) VISIBLE,
  CONSTRAINT `fk_Hotels_Trips1`
    FOREIGN KEY (`Trips_idTrips`)
    REFERENCES `mydb`.`Trips` (`trip_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reviews` (
  `review_ID` BIGINT(255) NOT NULL,
  `rating` INT NOT NULL,
  `comment` VARCHAR(45) NOT NULL,
  `recommended` TINYINT NOT NULL,
  `reviewDate` DATETIME NOT NULL,
  `createdAt` DATE NOT NULL,
  `user_ID` INT ZEROFILL NOT NULL,
  `trip_ID` INT NOT NULL,
  PRIMARY KEY (`review_ID`),
  UNIQUE INDEX `idReviews_UNIQUE` (`review_ID` ASC) VISIBLE,
  INDEX `fk_Reviews_Users1_idx` (`user_ID` ASC) VISIBLE,
  INDEX `fk_Reviews_Trips1_idx` (`trip_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Reviews_Users1`
    FOREIGN KEY (`user_ID`)
    REFERENCES `mydb`.`Users` (`user_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reviews_Trips1`
    FOREIGN KEY (`trip_ID`)
    REFERENCES `mydb`.`Trips` (`trip_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Destinations_has_Trips`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Destinations_has_Trips` (
  `destination_ID` BIGINT(255) NOT NULL,
  `trip_ID` BIGINT(255) NOT NULL,
  PRIMARY KEY (`destination_ID`, `trip_ID`),
  INDEX `fk_Destinations_has_Trips_Trips1_idx` (`trip_ID` ASC) VISIBLE,
  INDEX `fk_Destinations_has_Trips_Destinations1_idx` (`destination_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Destinations_has_Trips_Destinations1`
    FOREIGN KEY (`destination_ID`)
    REFERENCES `mydb`.`Destinations` (`destination_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Destinations_has_Trips_Trips1`
    FOREIGN KEY (`trip_ID`)
    REFERENCES `mydb`.`Trips` (`trip_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
