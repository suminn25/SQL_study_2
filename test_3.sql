SELECT title FROM film
WHERE rating = 'G';

SELECT *
FROM film;

SELECT title
FROM film
WHERE (release_year = 2006 or 2007) AND
(rating = 'PG' or 'G');

SELECT title
FROM film
WHERE (release_year = 2006 or release_year = 2007) AND
(rating = 'PG' or rating = 'G');

SELECT COUNT(*), rating
FROM film
GROUP BY rating;

SELECT COUNT(*) AS movie, rating, AVG(rental_rate) AS rental_AVG
FROM film
GROUP BY rating;

SELECT 
	COUNT(*) AS movie, rating, AVG(rental_rate) AS rental_AVG
FROM film
GROUP BY rating
ORDER BY rental_AVG DESC;

SELECT 
	COUNT(*) AS total_films, rating, 
    AVG(rental_rate) AS avg_rental_rate
FROM film
GROUP BY rating
ORDER BY avg_rental_rate DESC;

SELECT COUNT(*), rating
FROM film
WHERE length >= 130
GROUP BY rating;

CREATE TABLE userTbl (
    userID CHAR(8) NOT NULL PRIMARY KEY,
    name  VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL,
    addr  CHAR(2) NOT NULL,
    mobile1 CHAR(3),
    mobile2 CHAR(8),
    height SMALLINT,
    mDate  DATE
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE buyTbl (
    num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userID CHAR(8) NOT NULL,
    prodName CHAR(4),
    groupName CHAR(4),
    price  INT NOT NULL,
    amount  SMALLINT NOT NULL,
    FOREIGN KEY (userID) REFERENCES userTbl(userID)
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE userTbl ADD CONSTRAINT TESTDate UNIQUE(mDate);