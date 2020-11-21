-- Create the subquery
SELECT title,
(SELECT COUNT(inventory.film_id)
	FROM inventory
	WHERE film.film_id = inventory.film_id ) AS "Number of Copies"
FROM film
ORDER BY
	title;

-- Retrieve the same resuls using a join 
SELECT
	title,
	COUNT(inventory.film_id) AS "Number of Copies"
FROM
	film
	LEFT JOIN inventory
	ON film.film_id = inventory.film_id
GROUP BY
	title
ORDER BY
	title;

-- Create View
CREATE VIEW title_count AS
SELECT title,
(SELECT COUNT(inventory.film_id)
	FROM inventory
	WHERE film.film_id = inventory.film_id ) AS "Number of Copies"
FROM film;

-- Query the view to the titles with 7 copies
SELECT title, "Number of Copies"
FROM title_count
WHERE "Number of Copies" = 7;