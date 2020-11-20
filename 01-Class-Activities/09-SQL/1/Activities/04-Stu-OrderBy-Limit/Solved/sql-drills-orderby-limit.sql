-- # ORDER BY and LIMIT Drills

/*
1.  For your first drill, complete the following:
    * Query the `film` table to return the film `title`, `description`, `release_year`, and `replacement_cost` for films with a `rating` of "R".
    * Sort your result set by `replacement` cost in descending order, followed by title in ascending order.
    * Return the top 20 records, which will represent the 20 most expensive films to replace.
*/

select
	title,
	description,
	release_year,
	replacement_cost
from
	film
where
	rating = 'R'
order by
	replacement_cost desc,
	title
limit 20;

/*
2. For your second drill, complete the following:
    * Query the `film` table to return `title`, `description`, `release_year`, along with the length of each film's `description`.
    * Sort the result by the length of the film `description` in descending order.
    * Return the top 10  records, which will represent the 10 films with the longest descriptions.
*/

select
	title,
	description,
	release_year,
	length(description) as description_length
from
	film
order by
	length(description) desc
limit 10;
