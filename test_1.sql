use sakila;
select * from film limit 100, 110;

# 자료 개수 세기
select count(*)
from film;

# 중복 제거 -> 컬럼 분류
select distinct rating
from film;

select distinct release_year
from film;

select *
from rental limit 10;

select *
from rental
where inventory_id = 367;

select count(*)
from customer;

select sum(amount), avg(amount), max(amount), min(amount)
from payment;

# 8
select *
from rental
where inventory_id = 367 and staff_id = 1;

# 9
select rating
from film
group by rating;

# 10
select count(*) as total_movie, rating
from film
group by rating;

# 11
select count(*) as total_movie, rating
from film
where rating = 'PG' or rating = 'G' 
group by rating;

# 12
select title
from film
where rating = 'G';

# 13
select title
from film
where rating = 'G' or rating = 'PG';

# 14
select title
from film
where (release_year = '2006' or release_year = '2007')
and (rating = 'PG' or rating = 'G') ;


# 15
select count(*) as total_movie
from film
group by rating;

# 16
select count(*) as total_movie, rating
from film
group by rating;
select *
from film;

# 17
select count(*) as total_movie, rating, 
		avg(rental_rate) as avg_rental_rate
from film
group by rating;

# 18
select count(*) as total_movie, rating, 
		avg(rental_rate) as avg_rental_rate
from film
group by rating
order by avg_rental_rate desc;

# 19, 20
select count(*) as total_films, rating, 
		avg(rental_rate) as avg_rental_rate
from film
group by rating
order by avg_rental_rate desc;

select count(*), rating, length
from film
where length > 130
group by rating;

use wolrd;
show tables;
select * from city;
select database();

# 1 
select count(*)
from city;

# 2
select count(distinct countrycode)
from city;

# 3
select name
from city
where countrycode = 'KOR';

# 4
select count(*)
from city
where countrycode = 'KOR';

#5 
select count(*)
from city
where population > 100*10000;

# 6
select count(distinct language)
from countrylanguage;

# 7
select sum(population), max(population), min(population)
		, avg(population), name
from city
group by name;

# 8
select sum(population)
from city
where countrycode = 'KOR';

# 9, 10
SELECT countrycode, MAX(population)
FROM city
group by countrycode;

# 11
select continent, sum(surfacearea)
from country
group by continent;

# 12
select region, avg(GNP)
from country
group by region;

# 13
select region, avg(lifeexpectancy)
from country
group by region;

# 14
select region, min(indepyear)
from country
group by region;

# 15
SELECT Region, AVG(GNP) as AvgGNP
FROM country
WHERE IndepYear >= 1900
GROUP BY Region
ORDER BY AVG(GNP)
LIMIT 5;

# 16
SELECT Name
FROM country
WHERE IndepYear >= 1900;

# 17
SELECT AVG(GNP), Region
FROM country
WHERE IndepYear >= 1900
GROUP BY Region;

# 18
SELECT Region, AVG(GNP)
FROM country
WHERE IndepYear >= 1900
GROUP BY Region
ORDER BY AVG(GNP);

# 19
SELECT Region, AVG(GNP)
FROM country
WHERE IndepYear >= 1900
GROUP BY Region
ORDER BY AVG(GNP)
LIMIT 5;

# 20
SELECT Region, AVG(GNP) as AvgGNP
FROM country
WHERE IndepYear >= 1900
GROUP BY Region
ORDER BY AVG(GNP)
LIMIT 5;

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

show index from userTbl;

CREATE TABLE buyTbl (
    num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userID CHAR(8) NOT NULL,
    prodName CHAR(4),
    groupName CHAR(4),
    price  INT NOT NULL,
    amount  SMALLINT NOT NULL,
    FOREIGN KEY (userID) REFERENCES userTbl(userID)
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

show index from buyTbl;

ALTER TABLE userTbl ADD CONSTRAINT TESTDate UNIQUE(mDate);
show index from buyTbl;

desc userTbl;

# create로 인덱스 생성
create index inx_name on userTbl(name);

show index from userTbl;
desc userTbl;

# alter로 인덱스 생성
ALTER TABLE userTbl ADD INDEX idx_addr(addr);

show index from userTbl;
show index from buyTbl;

ALTER TABLE buyTbl ADD INDEX idx_groupName(groupName);
show index from buyTbl;
desc buyTbl;
ALTER TABLE buyTbl ADD INDEX idx_prodName(prodName);

alter table buyTbl drop index idx_groupName;
alter table buyTbl drop index idx_prodName;
