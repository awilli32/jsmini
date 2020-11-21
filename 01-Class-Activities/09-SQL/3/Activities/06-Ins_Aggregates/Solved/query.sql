-- Select everything from film table
SELECT * FROM film;

-- Count the amount of film_id's in film table
SELECT COUNT(film_id) FROM film;

-- Create an alias
SELECT COUNT(film_id) AS "Total films"
FROM film;

-- Group by rating and aggregate the film_id count

-- See counts by rental_rate only
SELECT
	rental_rate,
	COUNT(film_id) AS "Total films"
FROM
	film
GROUP BY
	rental_rate;

-- See counts by rating AND rental_rate 
SELECT
	rating,
	rental_rate,
	COUNT(film_id) AS "Total films"
FROM
	film
GROUP BY
	rating,
	rental_rate
ORDER BY
	rating,
	rental_rate;

-- Select the average rental duration
SELECT AVG(rental_duration)
FROM film;

-- Create an Alias
SELECT AVG(rental_duration) AS "Average rental period"
FROM film;

-- Group by the rating, average the rental rate and give alias
SELECT
	rating,
	AVG(rental_rate) AS "Average rental rate"
FROM
	film
GROUP BY
	rating;

-- Find the movie categories rows with the lowest rental rate
SELECT
	c.name,
	MIN(rental_rate) AS "Min rental rate"
FROM
	film_category fc
	INNER JOIN film f
 	ON fc.film_id = f.film_id
	INNER JOIN category c
	ON fc.category_id = c.category_id
GROUP BY
	c.name;

-- Find the rows with the maximum rental rate
SELECT
	c.name,
	MAX(rental_rate) AS "Max rental rate"
FROM
	film_category fc
	INNER JOIN film f
 	ON fc.film_id = f.film_id
	INNER JOIN category c
	ON fc.category_id = c.category_id
GROUP BY
	c.name;
	
-- Find the count of films by category
SELECT
	c.name,
	COUNT(f.film_id) AS "Film count"
FROM
	category c
	LEFT JOIN film_category fc
	ON c.category_id = fc.category_id
	LEFT JOIN film f
	ON f.film_id = fc.film_id	
GROUP BY
	c.name
ORDER BY 
	c.name;