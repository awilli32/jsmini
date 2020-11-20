-- # WHERE, BETWEEN, and LIKE Drills

/*
1.  For your first drill, complete the following:
    * Query the `film` table to return distinct set of ratings from the `rating` column.
    * Sort your result set by `rating` cost in ascending order.
*/
select
	distinct rating
from
	public.film
order by
	rating;

/*
2. For your second drill, complete the following:
    * Query the `film` table to return `title`, `description`, `release_year`, and `rating` for films that are rated "R" or NC-17. Use the `IN` operator to accomplish this.
    * Sort the result by `title`.
*/
select
	title,
	description,
	release_year,
	rating
from
	public.film
where
	rating in ('R','NC-17')
order by
	title;

/*
3. For your second drill, complete the following:
    * Query the `film` table to return `title`, `description`, `release_year`, `rating`, and `replacement_cost` for films that are rated "R" and cost between 20 and 30 dollars to replace.
    * Sort the result by `replacement_cost` in descending order, followed by `title` in ascending order.
*/
select
	title,
	description,
	release_year,
	rating,
	replacement_cost
from
	film
where
	rating = 'R'
	and replacement_cost between 20 and 30
order by
	replacement_cost desc,
	title;

/*
4. For your fourth drill, complete the following:
    * Query the `film` table to return `title`, `description`, `release_year`, `rating`, and `replacement_cost` for films that contain "thrilling" in the description.
    * Your query should be case insensitive.
    * Sort the result set by `title` in ascending order.
*/
select
	title,
	description,
	release_year,
	rating,
	replacement_cost
from
	film
where
	lower(description) like '%thrilling%'
order by
	title;
