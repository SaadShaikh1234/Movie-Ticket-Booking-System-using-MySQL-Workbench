CREATE Database Movie_Ticket_Booking_System;
Use Movie_Ticket_Booking_System;
-- Table 1: Movies
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    Genre VARCHAR(50),
    ReleaseYear INT,
    Duration INT -- Duration in minutes
);

-- Table 2: Theaters
CREATE TABLE Theaters (
    TheaterID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);

-- Table 3: Screens
CREATE TABLE Screens (
    ScreenID INT PRIMARY KEY AUTO_INCREMENT,
    ScreenNumber INT NOT NULL,
    TheaterID INT,
    FOREIGN KEY (TheaterID) REFERENCES Theaters(TheaterID)
);

-- Table 4: Showtimes
CREATE TABLE Showtimes (
    ShowtimeID INT PRIMARY KEY AUTO_INCREMENT,
    MovieID INT NOT NULL,
    ScreenID INT NOT NULL,
    ShowDate DATE NOT NULL,
    ShowTime TIME NOT NULL,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (ScreenID) REFERENCES Screens(ScreenID)
);

-- Table 5: Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15)
);

-- Table 6: Bookings
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    ShowtimeID INT NOT NULL,
    SeatsBooked INT NOT NULL,
    BookingDate DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ShowtimeID) REFERENCES Showtimes(ShowtimeID)
);

-- Movies
INSERT INTO Movies (Title, Genre, ReleaseYear, Duration) VALUES
('Inception', 'Sci-Fi', 2010, 148),
('The Dark Knight', 'Action', 2008, 152),
('Interstellar', 'Sci-Fi', 2014, 169),
('Titanic', 'Romance', 1997, 195),
('Avengers: Endgame', 'Action', 2019, 181),
('The Lion King', 'Animation', 1994, 88),
('Frozen', 'Animation', 2013, 102),
('Parasite', 'Thriller', 2019, 132),
('Joker', 'Drama', 2019, 122),
('Toy Story', 'Animation', 1995, 81);

-- Theaters
INSERT INTO Theaters (Name, Location) VALUES
('PVR Cinemas', 'New York'),
('Cinepolis', 'Los Angeles'),
('INOX', 'Chicago'),
('AMC Theaters', 'Houston'),
('Regal Cinemas', 'Phoenix'),
('Landmark Cinemas', 'Philadelphia'),
('Cinemark', 'San Antonio'),
('Grand Cinemas', 'San Diego'),
('Vue Cinemas', 'Dallas'),
('Showcase Cinemas', 'San Jose');

-- Screens
INSERT INTO Screens (ScreenNumber, TheaterID) VALUES
(1, 1), (2, 1), (1, 2), (2, 2), (1, 3),
(1, 4), (2, 4), (1, 5), (1, 6), (2, 6);

-- Showtimes
INSERT INTO Showtimes (MovieID, ScreenID, ShowDate, ShowTime) VALUES
(1, 1, '2024-12-05', '18:00:00'),
(2, 1, '2024-12-05', '21:00:00'),
(3, 2, '2024-12-05', '17:00:00'),
(4, 3, '2024-12-05', '20:00:00'),
(5, 4, '2024-12-05', '16:00:00'),
(6, 5, '2024-12-05', '15:00:00'),
(7, 6, '2024-12-05', '19:00:00'),
(8, 7, '2024-12-05', '20:30:00'),
(9, 8, '2024-12-05', '22:00:00'),
(10, 9, '2024-12-05', '14:00:00');

-- Customers
INSERT INTO Customers (Name, Email, PhoneNumber) VALUES
('Alice Johnson', 'alice@example.com', '1234567890'),
('Bob Smith', 'bob@example.com', '2345678901'),
('Charlie Davis', 'charlie@example.com', '3456789012'),
('Diana Moore', 'diana@example.com', '4567890123'),
('Edward Brown', 'edward@example.com', '5678901234'),
('Fiona Clark', 'fiona@example.com', '6789012345'),
('George Wilson', 'george@example.com', '7890123456'),
('Hannah White', 'hannah@example.com', '8901234567'),
('Ian Green', 'ian@example.com', '9012345678'),
('Jane Hall', 'jane@example.com', '0123456789');

-- Bookings
INSERT INTO Bookings (CustomerID, ShowtimeID, SeatsBooked, BookingDate) VALUES
(1, 1, 2, '2024-12-01'),
(2, 2, 4, '2024-12-01'),
(3, 3, 1, '2024-12-02'),
(4, 4, 3, '2024-12-02'),
(5, 5, 5, '2024-12-03'),
(6, 6, 2, '2024-12-03'),
(7, 7, 1, '2024-12-04'),
(8, 8, 3, '2024-12-04'),
(9, 9, 4, '2024-12-05'),
(10, 10, 2, '2024-12-05');

describe Movies;
describe Theaters;
describe screens;
describe showtimes;
describe customers;
describe bookings;

select * from Movies;
select * from Theaters;
select * from screens;
select * from showtimes;
select * from customers;
select * from bookings;

-- List all customers whose name starts with 'A'
SELECT * 
FROM Customers 
WHERE Name LIKE 'A%';

-- Retrieve all theaters in a specific location (e.g., 'Los Angeles')
SELECT Name, Location FROM Theaters
WHERE Location = 'Los Angeles';

-- Find the total number of movies in the database
SELECT COUNT(*) AS TotalMovies
FROM Movies;

-- Find movies grouped by genre and count the number of movies in each genre
SELECT Genre, COUNT(*) AS NumberOfMovies 
FROM Movies 
GROUP BY Genre 
HAVING COUNT(*) > 1;

-- Show all showtimes with their movie titles and theater names
SELECT M.Title AS MovieTitle, S.ShowDate, S.ShowTime, T.Name AS TheaterName
FROM Showtimes S
INNER JOIN Movies M ON S.MovieID = M.MovieID
INNER JOIN Screens Sc ON S.ScreenID = Sc.ScreenID
INNER JOIN Theaters T ON Sc.TheaterID = T.TheaterID;

-- Display names of all theaters along with their corresponding screen numbers, including theaters without screens
SELECT t.Name, s.ScreenNumber
FROM Theaters t
LEFT JOIN Screens s ON t.TheaterID = s.TheaterID;

-- List all customers and their bookings
SELECT C.Name AS CustomerName, B.BookingID, B.SeatsBooked
FROM Bookings B
RIGHT JOIN Customers C ON B.CustomerID = C.CustomerID;

-- Find all movies and showtimes
SELECT M.Title AS MovieTitle, S.ShowDate, S.ShowTime
FROM Movies M
LEFT JOIN Showtimes S ON M.MovieID = S.MovieID
UNION
SELECT M.Title AS MovieTitle, S.ShowDate, S.ShowTime
FROM Showtimes S
RIGHT JOIN Movies M ON S.MovieID = M.MovieID;

-- Find movies with the highest number of bookings
SELECT Title
FROM Movies
WHERE MovieID = (
    SELECT S.MovieID
    FROM Bookings B
    JOIN Showtimes S ON B.ShowtimeID = S.ShowtimeID
    GROUP BY S.MovieID
    ORDER BY COUNT(B.BookingID) DESC
    LIMIT 1
);

-- List all customers who booked less than 5 seats in total
SELECT Name
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Bookings
    GROUP BY CustomerID
    HAVING SUM(SeatsBooked) < 5
);

-- Find theaters that have no scheduled shows
SELECT Name
FROM Theaters
WHERE TheaterID NOT IN (
    SELECT DISTINCT Sc.TheaterID
    FROM Screens Sc
    JOIN Showtimes S ON Sc.ScreenID = S.ScreenID
);

-- Find the second most booked movie
SELECT Title
FROM Movies
WHERE MovieID = (
    SELECT MovieID
    FROM Showtimes S
    JOIN Bookings B ON S.ShowtimeID = B.ShowtimeID
    GROUP BY MovieID
    ORDER BY COUNT(B.BookingID) DESC
    LIMIT 1 OFFSET 1
);


-- Create a view to show detailed booking information with customer and movie details
CREATE VIEW BookingDetails AS
SELECT B.BookingID, C.Name AS CustomerName, M.Title AS MovieTitle, S.ShowDate, S.ShowTime, B.SeatsBooked
FROM Bookings B
JOIN Customers C ON B.CustomerID = C.CustomerID
JOIN Showtimes S ON B.ShowtimeID = S.ShowtimeID
JOIN Movies M ON S.MovieID = M.MovieID;

select * from bookingdetails;