-- Using joins, identify all actors who appear in the film _Alter Victory_ in the `pagila` database.

CREATE VIEW film_actors
AS
SELECT
	f.title
	,a.first_name || ' ' || a.last_name AS actor_full_name
FROM
	film_actor fa
	INNER JOIN film f
	ON fa.film_id = f.film_id
	INNER JOIN actor a 
	ON fa.actor_id = a.actor_id;
	
	
SELECT * FROM film_actors
WHERE title = 'ALTER VICTORY'

-- Using subqueries, identify all actors who appear in the film _Alter Victory_ in the `pagila` database.

SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
  SELECT actor_id
  FROM film_actor
  WHERE film_id IN
  (
    SELECT film_id
    FROM film
    WHERE title = 'ALTER VICTORY'
  )
);

-- Using subqueries, display the titles of films that were rented out by an employee named Jon Stephens.

SELECT title
FROM film
WHERE film_id
IN (
  SELECT film_id
    FROM inventory
    WHERE inventory_id
    IN (
        SELECT inventory_id
        FROM rental
        WHERE staff_id
        IN (
              SELECT staff_id
              FROM staff
              WHERE last_name = 'Stephens' AND first_name = 'Jon'
            )
        )
  );
