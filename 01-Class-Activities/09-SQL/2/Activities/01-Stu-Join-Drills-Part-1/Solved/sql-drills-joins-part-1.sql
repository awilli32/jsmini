-- # JOIN Drills

/*
1.  For your first drill, complete the following:
    * Write a query to return the film title along with all of the actors who played in that film.
      * You will need to join three tables to accomplish this.
      * You should figure out the order for which to join the tables, but the tables are `actor`, `film`, and `film_actor`
    * Your query should return the film title (aliased as film_title) along with the concatenated actor name in a column aliased as `actor_name`
    * Sort your result set by `film_title` and `actor_name`.
*/

select
	f.title,
	a.first_name || ' ' || a.last_name as actor_name
from
	film_actor fa
	inner join film f
	on fa.film_id = f.film_id
	inner join actor a
	on fa.actor_id = a.actor_id
order by
	f.title,
	actor_name;

/*
2.  For your second drill, complete the following:
        * Write a query to return the film category, film title, along with all of the actors who played in that film.
          * You will need to join five tables to accomplish this.
          * You should figure out the order for which to join the tables, but the tables are `actor`, `category` `film`, `film_actor`, and `film_category`
        * Your query should return the film category (aliased as film_category), film title (aliased as film_title) along with the concatenated actor name in a column aliased as `actor_name`
        * Sort your result set by `film_category`,  `film_title` and `actor_name`.
*/

select
	c.name as film_category,
	f.title as film_title,
	a.first_name || ' ' || a.last_name as actor_name
from
	film_actor fa
	inner join film f
	on fa.film_id = f.film_id
	inner join film_category fc
	on f.film_id = fc.film_id
	inner join category c
	on fc.category_id = c.category_id
	inner join actor a
	on fa.actor_id = a.actor_id
order by
	film_category,
	film_title,
	actor_name;
