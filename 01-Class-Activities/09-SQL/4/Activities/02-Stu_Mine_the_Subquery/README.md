## Mine the Subqueries

In this activity, you will continue to practice subqueries. Work individually or in a group. You can use the [ERD](http://www.postgresqltutorial.com/postgresql-sample-database/) for help with the queries.

### Instructions

First, create a view that returns all actors for each film. The view should contain the following columns:
* `film_title`
* `actor_full_name` (be sure to concatenate first and last name from the `actor` table)

Use that view to accomplish the following:

#### With Subqueries
* Using subqueries, identify all actors who appear in the film ALTER VICTORY in the `sakila` database.

* Using subqueries, display the titles of films that the employee Jon Stephens rented to customers.

#### With Joins
* Using a join, identify all actors who appear in the film ALTER VICTORY in the `sakila` database.

* Using a join, display the titles of films that the employee Jon Stephens rented to customers.

#### Discussion
Discuss your preferred method for achieving this result.
