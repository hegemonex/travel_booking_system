INSERT INTO travel_booking_system
VALUES
    (1, 'Global Travel', '2025-01-01'),
    (2, 'Dream Tours', '2025-02-01'),
    (3, 'Merryweather Tourism', '2025-02-01'),
    (4, 'Party Party Party Travel', '2025-02-01');

INSERT INTO users
VALUES
    (1, 'Jane', 'Doe', 'jane@gmail.com', '555111222', '2005-01-01', NOW(), 1),
    (2, 'John', 'Doe', 'john@gmail.com', '555333444', '2004-03-10', NOW(), 2),
    (3, 'Baby', 'Doe', 'baby@gmail.com', '555666777', '2010-12-11', NOW(), 3),
    (4, 'Richard Doe', 'richard@gmail.com', '555888999', '1967-03-17', NOW(), 4),
    (5, 'Victorine Doe', 'victorine@gmail.com', '666222333', '1967-03-17', NOW(), 4);

INSERT INTO flights
VALUES
    (1, 'Lufthansa', 'Tbilisi Airport', 'Berlin Airport', '2026-06-01', '2026-06-01', 1, 450.0, NOW()),
    (2, 'Turkish Airlines', 'Tbilisi Airport', 'Paris Airport', '2026-07-01', '2026-07-01', 0, 620.0, NOW()),
    (3, 'Spirit Airlines', 'American Airport', 'American Airport', '2026-08-01', '2026-08-01', 0, 340.0, NOW()),
    (4, 'Qatar Airlines', 'Tbilisi Airport', 'UAE Airport', '2026-09-01', '2026-09-01', 0, 1200.0, NOW());

INSERT INTO transports
VALUES
    (1, 'Bus', 40, 1, 50.0, NOW()),
    (2, 'Train', 100, 1, 80.0, NOW()),
    (3, 'Electric Scooter', 1, 20, 10.1, NOW());

INSERT INTO travel_packages
VALUES
    (1, 'Summer Package', 'Europe Tour', 2000, 1, '2026-06-01', '2026-06-10', NOW(), 1),
    (2, 'Winter Package', 'Ski Vacation', 2500, 0, '2026-12-01', '2026-12-15', NOW(), 2),
    (3, 'Spring Package', 'Sakura Viewing', 3000, 1, '2026-12-01', '2026-12-15', NOW(), 3),
    (4, 'Autumn Package', 'Fall Getaway', 1500, 0, '2026-12-01', '2026-12-15', NOW(), 4);

INSERT INTO hotels
VALUES
    (1, 'Radisson', 'Berlin', 'Street 1', 5, 1, 200.0, NOW(), 1),
    (2, 'Marriott', 'Paris', 'Street 2', 4, 1, 180.0, NOW(), 2),
    (3, 'Hilton', 'America', 'Street 3', 5, 1, 550.0, NOW(), 3),
    (4, 'The Ritz', 'Switzerland', 'Street 4', 5, 1, 650.0, NOW(), 4);

INSERT INTO trips
VALUES
    (1, 'Berlin Tour', 'Germany Trip', 1500, 1,
     '2026-06-01', '2026-06-10', NOW(),
     1, 1, 1, 1),

    (2, 'Paris Tour', 'France Trip', 1800, 1,
     '2026-07-01', '2026-07-10', NOW(),
     2, 2, 2, 2),

    (3, 'New York Tour', 'America Trip', 4000, 0,
     '2026-07-01', '2026-07-10', NOW(),
     3, 3, 3, 3),

    (4, 'Japan Tour', 'Japan Trip', 3459.0, 0,
     '2026-07-01', '2026-07-10', NOW(),
     4, 4, 4, 4);

INSERT INTO payments
VALUES
    (1, 'Card', 1500, 1, '2026-05-01', NOW()),
    (2, 'Cash', 1800, 1, '2026-06-01', NOW());

INSERT INTO bookings
VALUES
    (1, 1500, 1, '2026-05-01', NOW(), 1, 1, 1),
    (2, 1800, 1, '2026-06-01', NOW(), 2, 2, 2),
    (3, 2100, 1, '2026-06-01', NOW(), 3, 3, 3),
    (4, 2400, 1, '2026-06-01', NOW(), 4, 4, 4);

INSERT INTO destinations
VALUES
    (1, 'Germany', 'Berlin', 'Capital City', 0, NOW()),
    (2, 'France', 'Paris', 'Romantic City', 0, NOW()),
    (3, 'America', 'New York', 'Big Apple', 1, NOW()),
    (4, 'Japan', 'Tokyo', 'Nihon City', 1, NOW());

INSERT INTO reviews
VALUES
    (1, 5, 'Excellent', 1, NOW(), NOW(), 1, 1),
    (2, 4, 'Very Good', 1, NOW(), NOW(), 2, 2),
    (2, 4, 'Very Good', 1, NOW(), NOW(), 3, 3),
    (2, 4, 'Very Good', 1, NOW(), NOW(), 4, 4);