-- Select your database from the Connection drop-down above, usually it's "jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=CONVERT_TO_NULL [root on Default schema]"
-- Highlight the specific query or queries you want to execute
-- Right-click on the selected query and choose Run Selection


-- CREATE TABLE
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20)
);

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
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
    last_updated DATETIME
);

CREATE TABLE theatres (
    theatre_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    image_path VARCHAR(255) NOT NULL
);

CREATE TABLE showtimes (
    showtime_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    theatre_id INT,
    show_date DATE,
    show_time TIME,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (theatre_id) REFERENCES theatres(theatre_id)
);


-- INSERT TEST DATA
INSERT INTO movies (movie_id, title, description, release_date, status, genre, duration, image_path, imdb_rating, last_updated) VALUES 
(1, 'Inception', 'A thief who enters the dreams of others to steal their secrets gets a chance to regain his old life in exchange for planting an idea in a CEO\'s mind.', '2010-07-16', 'Now Showing', 'Sci-Fi/Action', '02:28:00', './images/inception.jpg', 8.8, NOW()),
(2, 'The Dark Knight', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', '2008-07-18', 'Now Showing', 'Action/Crime/Drama', '02:32:00', './images/dark_knight.jpg', 9.0, NOW()),
(3, 'Interstellar', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.', '2014-11-07', 'Now Showing', 'Sci-Fi/Adventure', '02:49:00', './images/interstellar.jpg', 8.6, NOW()),
(4, 'Dune: Part Two', 'A mythic and emotionally charged hero’s journey, Dune: Part Two will explore the mythic dimensions of Denis Villeneuve’s universe.', '2024-12-15', 'Coming Soon', 'Sci-Fi/Adventure', '02:30:00', './images/dune_part_two.jpg', 0.0, NOW());

INSERT INTO theatres (theatre_id, name, location, image_path) VALUES
(1, 'Cinema City', '123 Main Street, Downtown','./images/theatre1.jpg'),
(2, 'Starlight Theatre', '456 Park Avenue, Uptown','./images/theatre2.jpg');

INSERT INTO showtimes (movie_id, theatre_id, show_date, show_time)
VALUES
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
