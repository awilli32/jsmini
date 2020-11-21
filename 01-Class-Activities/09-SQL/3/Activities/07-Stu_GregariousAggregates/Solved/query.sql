-- 1. What is the average cost to rent a film in the pagila stores?
SELECT
	ROUND(AVG(rental_rate),2) AS "Average rental rate"
FROM
	film;

-- 2. What is the average rental cost of films by rating? On average, what is the cheapest rating of films to rent? Most expensive?
SELECT
	rating,
	ROUND(AVG(rental_rate),2) AS "Average rental rate"
FROM
	film
GROUP BY
	rating
ORDER BY 
	rating;

-- 3. How much would it cost to replace all the films in the database (not taking inventory into account)
SELECT
	ROUND(SUM(replacement_cost),2) AS "Total replacement cost"
FROM
	film;

-- 3b. Compute replacement cost for ALL films (MUCH BETTER WAY to do this)
-- Using joins
SELECT
	SUM(replacement_cost) AS "Total replacement cost"
FROM
	inventory i
	INNER JOIN film f
	ON i.film_id = f.film_id;

-- Using subquery
SELECT
	SUM(replacement_cost * film_count) AS "Total replacement cost"
FROM
	film f
	INNER JOIN 
	(
		SELECT
			film_id
			,COUNT(film_id) AS film_count
		FROM
			inventory
		GROUP BY
			film_id
	) AS fi
	ON f.film_id = fi.film_id

-- 4. How much would it cost to replace all the films in each ratings category?
SELECT
	rating
	,SUM(replacement_cost) AS "Replacement cost"
FROM
	film
GROUP BY
	rating;

-- 4b. Now compute the cost by category while also taking inventory into account

-- 5. How long is the longest movie in the database? The shortest?
SELECT
	MAX(length)
FROM
	film;

SELECT
	MIN(length)
FROM
	film;

SELECT 
	* 
FROM 
	film
WHERE
	length in (SELECT MAX(length) FROM film);
	
SELECT 
	* 
FROM 
	film
WHERE
	length in (SELECT MIN(length) FROM film);
	
	
SELECT 
	f.title,
	f.length
FROM 
	film f
WHERE
	f.length in (SELECT MAX(length) FROM film)
	OR f.length in (SELECT MIN(length) FROM film)
ORDER BY
	f.length,
	f.title
