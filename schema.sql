-- SQL Schema for Online Movie Ticket Booking System

-- Users table
CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  password VARCHAR(255)
);

-- Movies table
CREATE TABLE movies (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100),
  language VARCHAR(50),
  genre VARCHAR(50),
  duration INT,
  poster_url TEXT
);

-- Shows table
CREATE TABLE shows (
  id INT PRIMARY KEY AUTO_INCREMENT,
  movie_id INT,
  theatre_name VARCHAR(100),
  show_time DATETIME,
  FOREIGN KEY (movie_id) REFERENCES movies(id)
);

-- Bookings table
CREATE TABLE bookings (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  show_id INT,
  seats VARCHAR(100), -- e.g. "A1,A2,A3"
  status VARCHAR(50),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (show_id) REFERENCES shows(id)
);

-- Sample Data
INSERT INTO users (name, email, password) VALUES
('John Doe', 'john@example.com', '123456'),
('Mary Jane', 'mary@example.com', 'password123');

INSERT INTO movies (title, language, genre, duration, poster_url) VALUES
('Jolly LLB 3', 'Hindi', 'Comedy', 130, 'jolly.jpg'),
('Demon Slayer: Infinity Castle', 'Japanese', 'Anime', 145, 'demon.jpg');

INSERT INTO shows (movie_id, theatre_name, show_time) VALUES
(1, 'PVR Cinemas', '2025-10-05 18:00:00'),
(2, 'INOX', '2025-10-06 21:00:00');

INSERT INTO bookings (user_id, show_id, seats, status) VALUES
(1, 1, 'A1,A2,A3', 'Confirmed'),
(2, 2, 'B5,B6', 'Pending');
