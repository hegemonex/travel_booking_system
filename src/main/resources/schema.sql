-- MySQL Workbench Forward Engineering

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
-- Table `mydb`.`travel_booking_system`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`travel_booking_system` (
  `id` BIGINT(255) NOT NULL AUTO_INCREMENT,
  `system_name` VARCHAR(45) NOT NULL,
  `created_at` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` BIGINT(255) ZEROFILL NOT NULL,
  `firstName` VARCHAR(500) NOT NULL,
  `lastName` VARCHAR(500) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phoneNumber` VARCHAR(45) NOT NULL,
  `dateOfBirth` DATE NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `travel_booking_system_id` BIGINT(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idUser_UNIQUE` (`id` ASC) INVISIBLE,
  INDEX `fk_users_travel_booking_system1_idx` (`travel_booking_system_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_travel_booking_system1`
    FOREIGN KEY (`travel_booking_system_id`)
    REFERENCES `mydb`.`travel_booking_system` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`flights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`flights` (
  `id` BIGINT(255) NOT NULL,
  `airline` VARCHAR(45) NOT NULL,
  `departureAirport` VARCHAR(45) NOT NULL,
  `arrivalAirport` VARCHAR(45) NOT NULL,
  `departureDate` DATE NOT NULL,
  `arrivalDate` DATE NOT NULL,
  `directFlight` TINYINT NOT NULL,
  `ticketPrice` DOUBLE NOT NULL,
  `createdAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idFlights_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`transports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`transports` (
  `id` BIGINT(255) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `capacity` INT NOT NULL,
  `available` TINYINT NOT NULL,
  `transportPrice` DOUBLE NOT NULL,
  `createdAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idTransports_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`travel_packages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`travel_packages` (
  `id` BIGINT(255) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `packagePrice` DOUBLE NOT NULL,
  `active` TINYINT NOT NULL,
  `startDate` DATE NOT NULL,
  `endDate` DATE NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `travel_booking_system_id` BIGINT(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idTravelPackage_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_travel_packages_travel_booking_system1_idx` (`travel_booking_system_id` ASC) VISIBLE,
  CONSTRAINT `fk_travel_packages_travel_booking_system1`
    FOREIGN KEY (`travel_booking_system_id`)
    REFERENCES `mydb`.`travel_booking_system` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`trips`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`trips` (
  `id` BIGINT(255) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `price` DOUBLE NOT NULL,
  `availabe` TINYINT NOT NULL,
  `departureDate` DATETIME NOT NULL,
  `returnDate` DATETIME NOT NULL,
  `createdAt` DATE NOT NULL,
  `flight_id` BIGINT(255) NOT NULL,
  `transport_id` BIGINT(255) NOT NULL,
  `travelPackage_id` BIGINT(255) NOT NULL,
  `travel_booking_system_id` BIGINT(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idTrips_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Trips_Flights1_idx` (`flight_id` ASC) VISIBLE,
  INDEX `fk_Trips_Transports1_idx` (`transport_id` ASC) VISIBLE,
  INDEX `fk_Trips_TravelPackage1_idx` (`travelPackage_id` ASC) VISIBLE,
  INDEX `fk_trips_travel_booking_system1_idx` (`travel_booking_system_id` ASC) VISIBLE,
  CONSTRAINT `fk_Trips_Flights1`
    FOREIGN KEY (`flight_id`)
    REFERENCES `mydb`.`flights` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trips_Transports1`
    FOREIGN KEY (`transport_id`)
    REFERENCES `mydb`.`transports` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trips_TravelPackage1`
    FOREIGN KEY (`travelPackage_id`)
    REFERENCES `mydb`.`travel_packages` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trips_travel_booking_system1`
    FOREIGN KEY (`travel_booking_system_id`)
    REFERENCES `mydb`.`travel_booking_system` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`bookings` (
  `id` BIGINT(255) NOT NULL,
  `totalPrice` DOUBLE NOT NULL,
  `confirmed` TINYINT NOT NULL,
  `bookingDate` DATE NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `user_id` BIGINT(255) ZEROFILL NOT NULL,
  `trip_id` BIGINT(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idBookings_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Bookings_Users_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_Bookings_Trips1_idx` (`trip_id` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_Users`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bookings_Trips1`
    FOREIGN KEY (`trip_id`)
    REFERENCES `mydb`.`trips` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`destinations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`destinations` (
  `id` BIGINT(255) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `visaRequired` TINYINT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idDestinations_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`hotels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`hotels` (
  `id` BIGINT(255) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `starRating` INT NOT NULL,
  `breakfastIncluded` TINYINT NOT NULL,
  `pricePerNight` DOUBLE NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `Trips_idTrips` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idHotels_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Hotels_Trips1_idx` (`Trips_idTrips` ASC) VISIBLE,
  CONSTRAINT `fk_Hotels_Trips1`
    FOREIGN KEY (`Trips_idTrips`)
    REFERENCES `mydb`.`trips` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`payments` (
  `id` BIGINT(255) NOT NULL,
  `paymentMethod` VARCHAR(45) NOT NULL,
  `amount` DOUBLE NOT NULL,
  `successful` TINYINT NOT NULL,
  `paymentDate` DATE NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `bookings_id` BIGINT(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idPayments_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_payments_bookings1_idx` (`bookings_id` ASC) VISIBLE,
  CONSTRAINT `fk_payments_bookings1`
    FOREIGN KEY (`bookings_id`)
    REFERENCES `mydb`.`bookings` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reviews` (
  `id` BIGINT(255) NOT NULL,
  `rating` INT NOT NULL,
  `comment` VARCHAR(45) NOT NULL,
  `recommended` TINYINT NOT NULL,
  `reviewDate` DATETIME NOT NULL,
  `createdAt` DATE NOT NULL,
  `user_id` INT ZEROFILL NOT NULL,
  `trip_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idReviews_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Reviews_Users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_Reviews_Trips1_idx` (`trip_id` ASC) VISIBLE,
  CONSTRAINT `fk_Reviews_Users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reviews_Trips1`
    FOREIGN KEY (`trip_id`)
    REFERENCES `mydb`.`trips` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`destinations_has_trips`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`destinations_has_trips` (
  `destination_id` BIGINT(255) NOT NULL,
  `trip_id` BIGINT(255) NOT NULL,
  PRIMARY KEY (`destination_id`, `trip_id`),
  INDEX `fk_Destinations_has_Trips_Trips1_idx` (`trip_id` ASC) VISIBLE,
  INDEX `fk_Destinations_has_Trips_Destinations1_idx` (`destination_id` ASC) VISIBLE,
  CONSTRAINT `fk_Destinations_has_Trips_Destinations1`
    FOREIGN KEY (`destination_id`)
    REFERENCES `mydb`.`destinations` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Destinations_has_Trips_Trips1`
    FOREIGN KEY (`trip_id`)
    REFERENCES `mydb`.`trips` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
