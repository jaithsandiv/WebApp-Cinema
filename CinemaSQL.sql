-- Select your database from the Connection drop-down above, usually it's "jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=CONVERT_TO_NULL [root on Default schema]"
-- Highlight the specific query or queries you want to execute
-- Right-click on the selected query and choose Run Selection


-- CREATE TABLE
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20)
);

CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    release_date DATE NOT NULL,
    status ENUM('Now Showing', 'Coming Soon') NOT NULL,
    genre VARCHAR(255),
    duration TIME,
    image_path VARCHAR(255) NOT NULL,
    imdb_rating FLOAT(2, 1) DEFAULT NULL,
    last_updated DATETIME
);

CREATE TABLE theatres (
    theatre_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    image_path VARCHAR(255) NOT NULL
);

CREATE TABLE showtimes (
    showtime_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    theatre_id INT,
    show_date DATE,
    show_time TIME,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (theatre_id) REFERENCES theatres(theatre_id)
);

CREATE TABLE feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    rating INT NOT NULL,
    comments TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE seat_booked_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    seat_number VARCHAR(10),
    showtime_id INT,
    seat_status ENUM('Booked', 'Temp Booked'),
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (showtime_id) REFERENCES showtimes(showtime_id)
);

-- Add trigger to remove "Temp Booked" seats after 5 minutes if not finalized
DELIMITER //

CREATE EVENT remove_temp_bookings
ON SCHEDULE EVERY 1 MINUTE
DO
BEGIN
    DELETE FROM seat_booked_details
    WHERE seat_status = 'Temp Booked' AND booking_time < NOW() - INTERVAL 5 MINUTE;
END //

DELIMITER ;


-- INSERT TEST DATA
INSERT INTO users (user_id, firstname, lastname, email, phone, password, role) VALUES 
(1, 'admin', 'joe', 'admin@abc.com', '1231231234', 'admin', 'admin'),
(2, 'user', 'joe', 'user@gmail.com', '7897897890', 'user', 'user');

INSERT INTO movies (movie_id, title, description, release_date, status, genre, duration, image_path, imdb_rating, last_updated) VALUES 
(1, 'Gladiator II', 'After his home is conquered by the tyrannical emperors who now lead Rome, Lucius is forced to enter the Colosseum and must look to his past to find strength to return the glory of Rome to its people.', '2024-11-15', 'Now Showing', 'Action/Adventure', '02:28:00', './images/gladiator_ii_.jpg', 6.9, NOW()),
(2, 'Wicked', 'Wicked tells the story of Elphaba, the future Wicked Witch of the West and her relationship with Glinda, the Good Witch of the North. Their friendship struggles through their opposing personalities and viewpoints, rivalry over the same love-interest, their reactions to the Wizard''s corrupt government, and, ultimately, Elphaba''s public fall from grace. The plot is set mostly before Dorothy''s arrival from Kansas, and includes several references to well-known scenes and dialogue in the 1939 film The Wizard of Oz as a backstory.', '2024-11-23', 'Now Showing', 'Musical/Fantasy', '02:40:00', './images/wicked.jpg', 8.1,NOW()),
(3, 'Moana 2', 'Moana journeys to the far seas of Oceania after receiving an unexpected call from her wayfinding ancestors.', '2024-11-27', 'Now Showing', 'Family/Adventure', '01:40:00', './images/moana_2.jpg', 7.1, NOW()),
(4, 'Kraven the Hunter', 'Kraven''s complex relationship with his ruthless father starts him down a path of vengeance, motivating him to become not only the greatest hunter in the world, but also one of its most feared.', '2024-12-13', 'Coming Soon', 'Action/Sci-Fi', '02:07:00', './images/kraven_the_hunter.jpg', 0.0, NOW());

INSERT INTO theatres (theatre_id, name, location, image_path) VALUES
(1, 'The Grand Picture Palace', '42 Main Street, Downtown','./images/theatre1.jpg'),
(2, 'The Silver Screen', '42 Main Street, Uptown','./images/theatre2.jpg');

INSERT INTO showtimes (movie_id, theatre_id, show_date, show_time) VALUES
    (1, 1, CURRENT_DATE, '10:00:00'),
    (1, 1, CURRENT_DATE, '13:00:00'),
    (1, 1, CURRENT_DATE + INTERVAL 1 DAY, '10:00:00'),
    (1, 1, CURRENT_DATE + INTERVAL 1 DAY, '13:00:00'),
    (1, 1, CURRENT_DATE + INTERVAL 1 DAY, '16:00:00'),
    (1, 1, CURRENT_DATE + INTERVAL 2 DAY, '10:00:00'),
    (1, 2, CURRENT_DATE, '11:00:00'),
    (1, 2, CURRENT_DATE, '14:00:00'),
    (1, 2, CURRENT_DATE + INTERVAL 1 DAY, '11:00:00'),
    (1, 2, CURRENT_DATE + INTERVAL 1 DAY, '14:00:00'),
    (1, 2, CURRENT_DATE + INTERVAL 2 DAY, '11:00:00'),
    (1, 2, CURRENT_DATE + INTERVAL 2 DAY, '14:00:00'),
    (1, 2, CURRENT_DATE + INTERVAL 2 DAY, '17:00:00'),
    (2, 1, CURRENT_DATE, '11:30:00'),
    (2, 1, CURRENT_DATE + INTERVAL 1 DAY, '11:30:00'),
    (2, 1, CURRENT_DATE + INTERVAL 2 DAY, '11:30:00'),
    (2, 1, CURRENT_DATE + INTERVAL 2 DAY, '14:30:00'),
    (2, 2, CURRENT_DATE, '10:30:00'),
    (2, 2, CURRENT_DATE + INTERVAL 1 DAY, '10:30:00'),
    (2, 2, CURRENT_DATE + INTERVAL 1 DAY, '13:30:00'),
    (2, 2, CURRENT_DATE + INTERVAL 2 DAY, '10:30:00'),
    (2, 2, CURRENT_DATE + INTERVAL 2 DAY, '13:30:00'),
    (2, 2, CURRENT_DATE + INTERVAL 2 DAY, '16:30:00'),
    (3, 1, CURRENT_DATE, '12:00:00'),
    (3, 1, CURRENT_DATE, '15:00:00'),
    (3, 1, CURRENT_DATE + INTERVAL 1 DAY, '12:00:00'),
    (3, 1, CURRENT_DATE + INTERVAL 1 DAY, '15:00:00'),
    (3, 1, CURRENT_DATE + INTERVAL 2 DAY, '12:00:00'),
    (3, 1, CURRENT_DATE + INTERVAL 2 DAY, '15:00:00'),
    (3, 1, CURRENT_DATE + INTERVAL 2 DAY, '18:00:00'),
    (3, 2, CURRENT_DATE, '11:00:00'),
    (3, 2, CURRENT_DATE, '14:00:00'),
    (3, 2, CURRENT_DATE + INTERVAL 1 DAY, '11:00:00'),
    (3, 2, CURRENT_DATE + INTERVAL 1 DAY, '14:00:00'),
    (3, 2, CURRENT_DATE + INTERVAL 2 DAY, '11:00:00'),
    (3, 2, CURRENT_DATE + INTERVAL 2 DAY, '14:00:00');

INSERT INTO seat_booked_details (seat_number, showtime_id, seat_status) VALUES
('L1C1', 1, 'Booked'),
('L1C2', 1, 'Temp Booked'),
('R1C1', 2, 'Booked'),
('R1C2', 2, 'Temp Booked');

-- DISPLAY TABLE
SELECT * FROM users;

SELECT * FROM movies;

SELECT * FROM theatres;

SELECT * FROM showtimes;


-- DELETE TABLE
DROP TABLE users;

DROP TABLE movies;

DROP TABLE theatres;

DROP TABLE showtimes;


-- DELETE TABLE DATA
TRUNCATE TABLE users;

TRUNCATE TABLE movies;

TRUNCATE TABLE theatres;

TRUNCATE TABLE showtimes;
