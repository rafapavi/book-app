CREATE SCHEMA IF NOT EXISTS `booking_app`;

CREATE TABLE IF NOT EXISTS `booking_app`.`user` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(90) NOT NULL,
    `lastName` VARCHAR(90) NULL,
    `email` VARCHAR(45) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `passport` VARCHAR(45) NULL,
    `passportExpiry` DATETIME NULL,
    `type` CHAR(45) NOT NULL DEFAULT 'customer',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedBy` INT NULL,
    `updatedAt` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `booking_app`.`hotel` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(45) NOT NULL,
    `address` varchar(255) NOT NULL,
    `rating` varchar(45) DEFAULT NULL,
    `checkInTime` char(25) NOT NULL,
    `checkOutTIme` char(25) NOT NULL,
    `amenities` varchar(255) DEFAULT NULL,
    `createdBy` int NOT NULL,
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedBy` int DEFAULT NULL,
    `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `booking_app`.`roomDetail` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(90) NOT NULL,
    `description` varchar(255) DEFAULT NULL,
    `noOfBeds` smallint NOT NULL DEFAULT 1,
    `bedType` CHAR(45) NOT NULL DEFAULT 'single',
    `roomType` char(45) DEFAULT NULL,
    `createdBy` int NOT NULL,
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedBy` int DEFAULT NULL,
    `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `booking_app`.`room` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `hotelId` INT NOT NULL,
    `roomDetailId` INT NOT NULL,
    `price` FLOAT NOT NULL,
    `status` CHAR(45) NULL DEFAULT 'available',
    `createdBy` INT NOT NULL,
    `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedBy` INT NULL,
    `updatedAt` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `f_idx` (`hotelId` ASC) VISIBLE,
    INDEX `room_roomDetail_roomDetailId_idx` (`roomDetailId` ASC) VISIBLE,
    CONSTRAINT `room_hotel_hotelId` FOREIGN KEY (`hotelId`) REFERENCES `booking_app`.`hotel` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `room_roomDetail_roomDetailId` FOREIGN KEY (`roomDetailId`) REFERENCES `booking_app`.`roomDetail` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `booking_app`.`order` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `customerId` INT NOT NULL,
    `hotelId` INT NOT NULL,
    `checkInDate` DATETIME NOT NULL,
    `checkOutDate` DATETIME NOT NULL,
    `status` CHAR(45) NOT NULL DEFAULT 'created',
    `amount` FLOAT NOT NULL,
    `createdBy` INT NOT NULL,
    `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedBy` INT NULL,
    `updatedAt` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `order_user_customerId_idx` (`customerId` ASC) VISIBLE,
    INDEX `order_hotel_hotelId_idx` (`hotelId` ASC) VISIBLE,
    CONSTRAINT `order_user_customerId` FOREIGN KEY (`customerId`) REFERENCES `booking_app`.`user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `order_hotel_hotelId` FOREIGN KEY (`hotelId`) REFERENCES `booking_app`.`hotel` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `booking_app`.`roomOrder` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `orderId` INT NULL,
    `roomId` INT NOT NULL,
    `review` VARCHAR(255) NULL,
    `rating` SMALLINT(4) NULL DEFAULT NULL,
    `createdBy` INT NOT NULL,
    `createdAt` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedBy` INT NULL,
    `updatedAT` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `roomOrder_order_orderId_idx` (`orderId` ASC) VISIBLE,
    INDEX `roomOrder_room_roomId_idx` (`roomId` ASC) VISIBLE,
    CONSTRAINT `roomOrder_order_orderId` FOREIGN KEY (`orderId`) REFERENCES `booking_app`.`order` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `roomOrder_room_roomId` FOREIGN KEY (`roomId`) REFERENCES `booking_app`.`room` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `booking_app`.`payment` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `orderId` INT NOT NULL,
    `paymentMethod` CHAR(45) NOT NULL,
    `amountPaid` FLOAT NULL,
    `status` CHAR(45) NULL,
    `createdBy` INT NOT NULL,
    `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedBy` INT NULL,
    `updatedAt` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `payment_order_orderId_idx` (`orderId` ASC) VISIBLE,
    CONSTRAINT `payment_order_orderId` FOREIGN KEY (`orderId`) REFERENCES `booking_app`.`order` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO
    `booking_app`.`user` (
        `firstName`,
        `lastName`,
        `email`,
        `password`,
        `type`
    )
VALUES
    (
        'Pavi',
        'Admin',
        'pavi_admin@gmail.com',
        'tester',
        'admin'
    );

INSERT INTO
    `booking_app`.`hotel` (
        `name`,
        `address`,
        `rating`,
        `checkInTime`,
        `checkOutTIme`,
        `amenities`,
        `createdBy`
    )
VALUES
    (
        'Hilton PJ',
        '2, Jalan Barat, Pjs 52, 46200 Petaling Jaya, Selangor',
        '5.0',
        '2:00pm',
        '12:00pm',
        'swimming pool, gym, sauna,',
        '1'
    );

INSERT INTO
    `booking_app`.`hotel` (
        `name`,
        `address`,
        `rating`,
        `checkInTime`,
        `checkOutTIme`,
        `amenities`,
        `createdBy`
    )
VALUES
    (
        'Eastin Hotel Kuala Lumpur',
        'Pusat Dagang, 13, Jalan 16/11, Seksyen 16, 46350 Petaling Jaya, Selangor\n',
        '5',
        '3:00pm',
        '2:00pm',
        'gym, sauna, swimming pool, jacuzzi, multipurpose hall',
        '1'
    );

INSERT INTO
    `booking_app`.`hotel` (
        `name`,
        `address`,
        `rating`,
        `checkInTime`,
        `checkOutTIme`,
        `createdBy`
    )
VALUES
    (
        'Le Méridien',
        '2, Jalan Stesen Sentral, Kuala Lumpur Sentral, 50470 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
        '4',
        '1:00pm',
        '11:00am',
        '1'
    );

INSERT INTO
    `booking_app`.`hotel` (
        `name`,
        `address`,
        `rating`,
        `checkInTime`,
        `checkOutTIme`,
        `amenities`,
        `createdBy`
    )
VALUES
    (
        'The Westin Kuala Lumpur',
        '199, Jln Bukit Bintang, Bukit Bintang, 55100 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
        '3',
        '1:00pm',
        '12:00pm',
        'banquet hall, swimming pool, sauna, squash court, badminton court',
        '1'
    );

INSERT INTO
    `booking_app`.`hotel` (
        `name`,
        `address`,
        `rating`,
        `checkInTime`,
        `checkOutTIme`,
        `amenities`,
        `createdBy`
    )
VALUES
    (
        'Shangri-La',
        '11, Jln Sultan Ismail, Kuala Lumpur, 50250 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
        '4',
        '2:00pm',
        '12:00pm',
        'restaurant & bar, swimming pool, gym, free parking',
        '1'
    );

INSERT INTO
    `booking_app`.`hotel` (
        `name`,
        `address`,
        `rating`,
        `checkInTime`,
        `checkOutTIme`,
        `amenities`,
        `createdBy`
    )
VALUES
    (
        'W Kuala Lumpur',
        '121, Jalan Ampang, Kuala Lumpur, 50450 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
        '5',
        '3:00pm',
        '2:00pm',
        'restaurant & bar, swimming pool, gym, free parking, sauna, swimming pool, tennis court, basketball court',
        '1'
    );

INSERT INTO `booking_app`.`roomDetail` (`name`, `description`, `noOfBeds`, `bedType`, `roomType`, `createdBy`) VALUES ('Twin Room', 'This air-conditioned contemporary-style twin room opens up to city views from floor-to-ceiling windows. It is fitted with a flat-screen satellite TV and a desk. Marble bathrooms include a rain shower, a hairdryer and free toiletries.', '2', 'single', 'deluxe', '1');
INSERT INTO `booking_app`.`roomDetail` (`name`, `description`, `noOfBeds`, `bedType`, `roomType`, `createdBy`) VALUES ('Double Room', 'Overlooking the lake, this room features a separate working area with an ergonomic chair. Flat-screen TVs are included in rooms, as well as in the large marble bathrooms.\n\n', '1', 'king', 'deluxe', '1');
INSERT INTO `booking_app`.`roomDetail` (`name`, `description`, `noOfBeds`, `bedType`, `roomType`, `createdBy`) VALUES ('Grand Executive', 'This air-conditioned suite opens up to panoramic lake garden view or city view from floor-to-ceiling windows. It has a separate living room, a dining area and 2 flat-screen TVs with a home theatre system. A nespresso machine is included.', '1', 'king', 'suite', '1');
INSERT INTO `booking_app`.`roomDetail` (`name`, `description`, `noOfBeds`, `bedType`, `roomType`, `createdBy`) VALUES ('Superior Room', 'This double room has a minibar, tea/coffee maker and bathrobe.', '1', 'king', 'standard', '1');
INSERT INTO `booking_app`.`roomDetail` (`name`, `description`, `noOfBeds`, `bedType`, `roomType`, `createdBy`) VALUES ('Twin Room', 'This twin room has a minibar, bathrobe and air conditioning.', '2', 'single', 'standard', '1');
INSERT INTO `booking_app`.`roomDetail` (`name`, `description`, `noOfBeds`, `bedType`, `roomType`, `createdBy`) VALUES ('King Room', 'This double room features a tea/coffee maker, soundproofing and tumble dryer.', '1', 'king', 'standard', '1');
INSERT INTO `booking_app`.`roomDetail` (`name`, `description`, `noOfBeds`, `bedType`, `roomType`, `createdBy`) VALUES ('Eastin Deluxe', 'This spacious studio offers a separate living room and a walk-in wardrobe.', '1', 'king xl', 'studio', '1');
INSERT INTO `booking_app`.`roomDetail` (`name`, `description`, `noOfBeds`, `bedType`, `roomType`, `createdBy`) VALUES ('Executive Room', 'Spacious rooms feature a separate living room and working desk. The rooms amenities include daily newspaper, a flat-screen TV and an alarm clock radio.', '1', 'king', 'deluxe', '1');
INSERT INTO `booking_app`.`roomDetail` (`name`, `description`, `noOfBeds`, `bedType`, `roomType`, `createdBy`) VALUES ('King Room', 'This double room has air conditioning, sofa and tea/coffee maker.', '1', 'queen', 'standard', '1');
INSERT INTO `booking_app`.`roomDetail` (`name`, `description`, `noOfBeds`, `bedType`, `roomType`, `createdBy`) VALUES ('Premium King Room', 'This double room features a tea/coffee maker, satellite TV and private entrance.', '1', 'king', 'deluxe', '1');
INSERT INTO `booking_app`.`roomDetail` (`name`, `description`, `noOfBeds`, `bedType`, `roomType`, `createdBy`) VALUES ('Horizon Club Executive King Room', 'This air-conditioned club executive king room opens up to views of the city. It is fitted with a flat-screen satellite TV, laptop-compatible safe, minibar and complimentary bottled drinking water. The en suite marble bathroom has shower facility.', '1', 'king xl', 'deluxe', '1');
INSERT INTO `booking_app`.`roomDetail` (`name`, `description`, `noOfBeds`, `bedType`, `roomType`, `createdBy`) VALUES ('Premier Selection Suite', 'Featuring red, orange and shimmering gold decor, this spacious air-conditioned suite consists of a separate living area, a flat-screen TV with DVD player and large windows with views of the city.', '1', 'king xl', 'suite', '1');
INSERT INTO `booking_app`.`roomDetail` (`name`, `description`, `noOfBeds`, `bedType`, `roomType`, `createdBy`) VALUES ('Wonderful Room', 'This air-conditioned king room comes with a large king bed and the windows with city view. It is fitted with a flat-screen TV, a seating area and Nespresso machine. The en suite bathroom includes shower facilities, a hairdryer and free toiletries.', '1', 'king', 'deluxe', '1');
INSERT INTO `booking_app`.`roomDetail` (`name`, `description`, `noOfBeds`, `bedType`, `roomType`, `createdBy`) VALUES ('Mega Room', 'Featuring city view, this air-conditioned room comes with a king bed, a flat-screen TV and a seating area. An in-room Bluetooth soundbar is also provided. The en suite bathroom includes shower facilities, a hairdryer and free toiletries.', '2', 'queen', 'deluxe', '1');
INSERT INTO `booking_app`.`roomDetail` (`name`, `description`, `noOfBeds`, `bedType`, `roomType`, `createdBy`) VALUES ('Marvelous Suite', 'Offering large windows, this air-conditioned room has a king bed and flat-screen TVs in the bedroom and separate living area. An in-room Bluetooth soundbar is also provided. The en suite bathroom comes with a rain shower or separate bathtub.', '1', 'king xl', 'deluxe', '1');
INSERT INTO `booking_app`.`roomDetail` (`name`, `description`, `noOfBeds`, `bedType`, `roomType`, `createdBy`) VALUES ('Cool Corner', 'Featuring city view, this air-conditioned room includes a king bed, a flat-screen TV and a seating area. An in-room Bluetooth soundbar is also provided. The en suite bathroom comes with a rain shower or separate bathtub.', '1', 'queen', 'studio', '1');

INSERT INTO `booking_app`.`room` (`hotelId`, `roomDetailId`, `price`, `status`, `createdBy`) VALUES ('1', '1', '400', 'vacant', '1');
INSERT INTO `booking_app`.`room` (`hotelId`, `roomDetailId`, `price`, `status`, `createdBy`) VALUES ('1', '2', '450', 'vacant', '1');
INSERT INTO `booking_app`.`room` (`hotelId`, `roomDetailId`, `price`, `status`, `createdBy`) VALUES ('1', '3', '500', 'vacant', '1');
INSERT INTO `booking_app`.`room` (`hotelId`, `roomDetailId`, `price`, `status`, `createdBy`) VALUES ('1', '4', '350', 'vacant', '1');
INSERT INTO `booking_app`.`room` (`hotelId`, `roomDetailId`, `price`, `status`, `createdBy`) VALUES ('2', '5', '300', 'vacant', '1');
INSERT INTO `booking_app`.`room` (`hotelId`, `roomDetailId`, `price`, `status`, `createdBy`) VALUES ('2', '6', '300', 'occupied', '1');
INSERT INTO `booking_app`.`room` (`hotelId`, `roomDetailId`, `price`, `status`, `createdBy`) VALUES ('2', '7', '700', 'occupied', '1');
INSERT INTO `booking_app`.`room` (`hotelId`, `roomDetailId`, `price`, `status`, `createdBy`) VALUES ('3', '8', '700', 'occupied', '1');
INSERT INTO `booking_app`.`room` (`hotelId`, `roomDetailId`, `price`, `status`, `createdBy`) VALUES ('3', '9', '600', 'occupied', '1');
INSERT INTO `booking_app`.`room` (`hotelId`, `roomDetailId`, `price`, `status`, `createdBy`) VALUES ('3', '10', '850', 'vacant', '1');
INSERT INTO `booking_app`.`room` (`hotelId`, `roomDetailId`, `price`, `status`, `createdBy`) VALUES ('4', '11', '800', 'occupied', '1');
INSERT INTO `booking_app`.`room` (`hotelId`, `roomDetailId`, `price`, `status`, `createdBy`) VALUES ('5', '12', '800', 'occupied', '1');
INSERT INTO `booking_app`.`room` (`hotelId`, `roomDetailId`, `price`, `status`, `createdBy`) VALUES ('6', '13', '600', 'occupied', '1');
INSERT INTO `booking_app`.`room` (`hotelId`, `roomDetailId`, `price`, `status`, `createdBy`) VALUES ('6', '14', '650', 'vacant', '1');
INSERT INTO `booking_app`.`room` (`hotelId`, `roomDetailId`, `price`, `status`, `createdBy`) VALUES ('6', '15', '900', 'vacant', '1');
INSERT INTO `booking_app`.`room` (`hotelId`, `roomDetailId`, `price`, `status`, `createdBy`) VALUES ('6', '16', '1200', 'vacant', '1');
