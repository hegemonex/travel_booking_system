UPDATE users
SET email = 'updated@gmail.com'
WHERE id = 1;

UPDATE trips
SET price = 2200
WHERE id = 2;

UPDATE hotels
SET id = 10
WHERE id = 1;

UPDATE travel_booking_system
SET system_name = 'Welcome to the hotel california'
WHERE system_name = 'Merryweather Tourism';

UPDATE payments
SET paymentMethod = 'cash'
WHERE paymentMethod = 'card';

UPDATE flights
SET directFlight = 0
WHERE directFlight = 1;

UPDATE transports
SET type = 'bullet train'
WHERE type = 'train';

UPDATE travel_booking_system
SET system_name = 'Party Party Party I wanna have a Party'
WHERE system_name = 'Global Travel';

UPDATE users
SET email = 'updated@gmail.com'
WHERE id = 4;

UPDATE trips
SET price = 2200
WHERE id = 2;


DELETE FROM reviews
WHERE id = 1;

DELETE FROM reviews
WHERE user_id = 2;

DELETE FROM bookings
WHERE id = 1;

DELETE FROM bookings
WHERE totalPrice > 2000;

DELETE FROM payments
WHERE paymentMethod = 'Cash';

DELETE FROM trips
WHERE available = 0;

DELETE FROM hotels
WHERE city = 'Paris';

DELETE FROM destinations
WHERE visaRequired = 1;

DELETE FROM users
WHERE firstName = 'Baby';

DELETE FROM travel_packages
WHERE active = 0;


SELECT *
FROM users u
         INNER JOIN bookings b ON u.id = b.user_id
         INNER JOIN trips t ON b.trip_id = t.id
         INNER JOIN payments p ON b.payments_id = p.id
         INNER JOIN flights f ON t.flight_id = f.id
         INNER JOIN transports tr ON t.transport_id = tr.id
         INNER JOIN travel_packages tp ON t.travel_package_id = tp.id
         INNER JOIN reviews r ON u.id = r.user_id
         INNER JOIN destinations_has_trips dt ON t.id = dt.trip_id
         INNER JOIN destinations d ON dt.destination_id = d.id;

SELECT users.firstName, bookings.totalPrice
FROM users
         INNER JOIN bookings
                    ON users.id = bookings.user_id;

SELECT users.firstName, reviews.comment
FROM users
         LEFT JOIN reviews
                   ON users.id = reviews.user_id;

SELECT users.firstName, reviews.comment
FROM users
         LEFT JOIN reviews
                   ON users.id = reviews.user_id;

SELECT *
FROM users
         LEFT JOIN bookings
                   ON users.id = bookings.user_id
UNION

SELECT *
FROM users
         RIGHT JOIN bookings
                    ON users.id = bookings.user_id;



SELECT *
FROM users
         LEFT JOIN bookings
                   ON users.id = bookings.user_id
UNION

SELECT *
FROM users
         RIGHT JOIN bookings
                    ON users.id = bookings.user_id;


SELECT trips.title, flights.airline
FROM trips
         INNER JOIN flights
                    ON trips.flight_id = flights.id;


SELECT COUNT(*) FROM users;

SELECT AVG(price) FROM trips;

SELECT MAX(ticketPrice) FROM flights;

SELECT MIN(pricePerNight) FROM hotels;

SELECT SUM(amount) FROM payments;

SELECT transport_id, COUNT(*)
FROM trips
GROUP BY transport_id;

SELECT recommended, COUNT(*)
FROM reviews
GROUP BY recommended;

SELECT transport_id, COUNT(*)
FROM trips
GROUP BY transport_id
HAVING COUNT(*) > 0;


SELECT user_id, SUM(totalPrice)
FROM bookings
GROUP BY user_id
HAVING SUM(totalPrice) > 1000;


SELECT recommended, COUNT(*)
FROM reviews
GROUP BY recommended
HAVING COUNT(*) >= 1;


SELECT trip_id, AVG(rating)
FROM reviews
GROUP BY trip_id
HAVING AVG(rating) > 3;


SELECT airline, COUNT(*)
FROM flights
GROUP BY airline
HAVING COUNT(*) >= 1;


SELECT city, AVG(pricePerNight)
FROM hotels
GROUP BY city
HAVING AVG(pricePerNight) > 100;


SELECT active, COUNT(*)
FROM travel_packages
GROUP BY active
HAVING COUNT(*) > 0;