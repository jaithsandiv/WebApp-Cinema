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
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    release_date DATE NOT NULL,
    status ENUM('Now Showing', 'Coming Soon') NOT NULL,
    genre VARCHAR(255),
    duration TIME,
    image_path VARCHAR(255) NOT NULL,
    imdb_rating FLOAT(2, 1) DEFAULT NULL,
    actors VARCHAR(255),
    characters VARCHAR(255),
    director VARCHAR(100),
    produce VARCHAR(100),
    writer VARCHAR(100),
    music VARCHAR(100),
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
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments VARCHAR(255),
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    showtime_id INT,
    seat_numbers VARCHAR(255),
    amount FLOAT,
    payment_date DATETIME,
    payment_method VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (showtime_id) REFERENCES showtimes(showtime_id)
);

CREATE TABLE temp_seats (
    id INT PRIMARY KEY AUTO_INCREMENT,
    seat_number VARCHAR(10),
    showtime_id INT,
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (showtime_id) REFERENCES showtimes(showtime_id)
);

-- Trigger to remove "Temp Booked" seats after 5 minutes if not finalized
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

INSERT INTO movies (movie_id, title, description, release_date, status, genre, duration, image_path, imdb_rating, actors, characters, director, produce, writer, music, last_updated) VALUES 
(1, 'Gladiator II', 'Years after witnessing the death of Maximus at the hands of his uncle, Lucius must enter the Colosseum after the powerful emperors of Rome conquer his home. With rage in his heart and the future of the empire at stake, he looks to the past to find the strength and honor needed to return the glory of Rome to its people.', '2024-11-15', 'Now Showing', 'Action/Adventure', '02:28:00', './images/gladiator_ii_.jpg', 6.9, 'Paul Mescal, Denzel Washington, Pedro Pascal', 'Lucius, Macrinus, General Acacius', 'Ridley Scott', 'Ridley Scott, Michael Pruss, Douglas Wick, Lucy Fisher, David Franzoni', 'David Scarpa, Peter Craig, David Scarpa, David Franzoni ', 'Harry Gregson-Williams', NOW());
(2, 'Wicked', 'Misunderstood because of her green skin, a young woman named Elphaba forges an unlikely but profound friendship with Glinda, a student with an unflinching desire for popularity. Following an encounter with the Wizard of Oz, their relationship soon reaches a crossroad as their lives begin to take very different paths.', '2024-11-22', 'Now Showing', 'Musical/Fantasy', '02:40:00', './images/wicked.jpg', 8.0, 'Ariana Grande, Cynthia Erivo, Jonathan Bailey', 'Glinda, Elphaba, Prince Fiyero', 'Jon M. Chu', 'Marc Platt, David Stone  ', 'Winnie Holzman, Dana Fox, Gregory Maguire', 'John Powell, Stephen Schwartz', NOW());
(3, 'Interstellar', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity’s survival.', '2014-11-07', 'Now Showing', 'Sci-Fi/Adventure', '02:49:00', './images/interstellar.jpg', 8.6, 'Matthew McConaughey,Anne Hathaway,Jessica Chastain', 'Cooper,Brand,Murph', 'Christopher Nolan', 'Emma Thomas', 'Jonathan Nolan', 'Hans Zimmer', NOW());
(4, 'Moana 2', 'Moana journeys to the far seas of Oceania after receiving an unexpected call from her wayfinding ancestors.', '2024-11-27', 'Now Showing', ' Family/Adventure', '01:40:00', './images/moana_2.jpg', 7.0, 'Dwayne Johnson, Nicole Scherzinger, Awhimai Fraser', 'Maui, Sina, Matangi', ' Dana Ledoux Miller, Jason Hand, David Derrick Jr.', 'Christina Chen, Yvett Merino', '   Jared Bush, Dana Ledoux Miller, Bek Smith', 'Mark Mancina, Opetaia Foaʻi  ', NOW());
(5, 'Kraven the Hunter', 'Kraven''s complex relationship with his ruthless father starts him down a path of vengeance, motivating him to become not only the greatest hunter in the world, but also one of its most feared.', '2024-12-13', 'Coming Soon', ' Action/Sci-fi', '02:07:00', './images/kraven_the_hunter.jpg', 5.5, 'Aaron Taylor-Johnson, Russell Crowe, Ariana DeBose', 'Kraven the Hunter, Nikolai Kravinoff, Calypso', 'J. C. Chandor', 'Avi Arad, Matt Tolmach, David Householter', 'Richard Wenk, Art Marcum, Matt Holloway', 'Benjamin Wallfisch, Evgueni Galperine, Sacha Galperine', NOW());
(6, 'Nosferatu', 'In the 1830s, estate agent Thomas Hutter travels to Transylvania for a fateful meeting with Count Orlok, a prospective client. In his absence, Hutter''s new bride, Ellen, is left under the care of their friends, Friedrich and Anna Harding. Plagued by horrific visions and an increasing sense of dread, Ellen soon encounters an evil force that''s far beyond her control.', '2024-12-25', 'Coming Soon', 'Horror/Drama', '02:12:00', './images/nosferatu.jpg', 0.0, 'Bill Skarsgård, Willem Dafoe, Emma Corrin', 'Count Orlok, Prof. Albin Eberhart von Franz, Anna Harding', 'Robert Eggers', 'Jeff Robinov, John Graham, Chris Columbus, Eleanor Columbus, Robert Eggers', 'Robert Eggers, Henrik Galeen, Bram Stoker', 'Robin Carolan', NOW());
(7, 'Sonic the Hedgehog 3', 'Sonic, Knuckles and Tails reunite to battle Shadow, a mysterious new enemy with powers unlike anything they''ve faced before. With their abilities outmatched in every way, they seek out an unlikely alliance to stop Shadow and protect the planet.', '2024-12-20', 'Coming Soon', 'Action/Adventure', '01:50:00', './images/sonic3.jpg', 0.0, 'Ben Schwartz, Keanu Reeves, Jim Carrey', 'Sonic, Shadow, Doctor Eggman ', 'Jeff Fowler', 'Neal H. Moritz, Toby Ascher, Toru Nakahara, Hitoshi Okuno', 'Pat Casey, Josh Miller, John Whittington', 'Tom Holkenborg', NOW());
(8, 'Solo Leveling - ReAwakening', 'Over a decade after ''gates'' connecting worlds appeared, awakening ''hunters'' with superpowers, weakest hunter Sung Jinwoo encounters a double dungeon and accepts a mysterious quest, becoming the only one able to level up, changing his fate.', '2024-12-06', 'Coming Soon', 'Action/Anime/Dark Fantasy', '02:01:00', './images/sololeveling.jpg', 8.1, 'Taito Ban, Reina Ueda, Daisuke Hirakawa', 'Sung Jinwoo, Cha Hae-in, Choi Jong-in', 'Shunsuke Nakashige', 'Aniplex, Inc. ', 'Chugong', 'Hiroyuki Sawano, TOMORROW X TOGETHER', NOW());


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

INSERT INTO temp_seats (seat_number, showtime_id) VALUES
('L1C2', 1),
('R1C2', 2);

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

SELECT * FROM temp_seats;

SELECT * FROM bookings;

SELECT * FROM feedback;


-- DELETE TABLE
DROP TABLE users;

DROP TABLE movies;

DROP TABLE theatres;

DROP TABLE showtimes;

DROP TABLE temp_seats;

DROP TABLE bookings;

DROP TABLE feedback;

DROP EVENT remove_temp_bookings;



-- DELETE TABLE DATA
TRUNCATE TABLE users;

TRUNCATE TABLE movies;

TRUNCATE TABLE theatres;

TRUNCATE TABLE showtimes;

TRUNCATE TABLE temp_seats;

TRUNCATE TABLE bookings;

TRUNCATE TABLE feedback;
