SELECT category_id
FROM category
WHERE name = 'Comedy' OR
	name = 'Sports' OR
    name = 'Family';

SELECT category_id
FROM film_category
WHERE film_id =2;

SELECT COUNT(*), category_id
FROM film_category
GROUP BY category_id;

SELECT *
FROM category;

SELECT *
FROM film_category;

SELECT name, COUNT(*)
FROM film_category f
INNER JOIN category c
ON f.category_id = c.category_id
WHERE c.name = 'Comedy'
GROUP BY c.name;

SELECT c.name, COUNT(*)
FROM film_category f
INNER JOIN category c
ON f.category_id = c.category_id
WHERE c.name = 'Comedy' OR
	c.name = 'Sports' OR
    c.name = 'Family'
GROUP BY c.category_id;

SELECT c.name, COUNT(*)
FROM film_category f
INNER JOIN category c
ON f.category_id = c.category_id
GROUP BY c.category_id
HAVING COUNT(*) > 70;

SELECT C.name, COUNT(*)
FROM rental R
JOIN inventory I
ON R.inventory_id = I.inventory_id
JOIN film_category F
ON F.film_id = I.film_id
JOIN category C
ON C.category_id = F.category_id
GROUP BY C.category_id;

SELECT C.name, COUNT(*)
FROM rental R
JOIN inventory I
ON R.inventory_id = I.inventory_id
JOIN film_category F
ON F.film_id = I.film_id
JOIN category C
ON C.category_id = F.category_id
WHERE C.name = 'Comedy' OR C.name = 'Sports' OR
		C.name = 'Family'
GROUP BY C.category_id;

SELECT COUNT(*)
FROM rental WHERE inventory_id IN 
	(SELECT inventory_id FROM inventory WHERE film_id IN 
		(SELECT film_id FROM film_category WHERE category_id IN
			(SELECT category_id FROM category WHERE name = 'Comedy')));
            
SELECT COUNT(*)
FROM film_category f
JOIN category c
ON c.category_id = f.category_id
WHERE c.name = 'Comedy';

SELECT COUNT(*)
FROM film_category WHERE category_id IN
	(SELECT category_id FROM category
	WHERE name = 'Comedy');
    
SELECT COUNT(*)
FROM customer c
RIGHT OUTER JOIN address a
ON a.address_id = c.address_id;

SELECT COUNT(*)
FROM address a
RIGHT JOIN customer c
ON c.address_id = a.address_id;

SELECT first_name, last_name, email
FROM customer c
JOIN address a ON a.address_id = c.address_id
JOIN city cy ON cy.city_id = a.city_id
JOIN country cou ON cou.country_id = cy.country_id
WHERE cou.country = 'canada';

SELECT distinct name FROM category;

SELECT title, name
FROM film F 
JOIN film_category FC ON FC.film_id = F.film_id
JOIN category C ON C.category_id = FC.category_id
WHERE name = 'Family';

SELECT title, COUNT(*) AS 'Rentals'
FROM rental R
JOIN inventory I ON I.inventory_id = R.inventory_id
JOIN film F ON F.film_id = I.film_id
GROUP BY title
ORDER BY COUNT(*) DESC
LIMIT 100;

SELECT 
	CONCAT(C.city, ', ', CY.country) AS 'Store',
    S.store_id AS 'Store ID',
    SUM(P.amount) AS 'Total Sales'
FROM Payment P
JOIN rental R ON P.rental_id = R.rental_id
JOIN inventory I ON I.inventory_id = R.inventory_id
JOIN store S ON S.store_id = I.store_id
JOIN address A ON A.address_id = S.address_id
JOIN city C ON C.city_id = A.city_id
JOIN country CY ON CY.country_id = C.country_id
GROUP BY S.store_id;
