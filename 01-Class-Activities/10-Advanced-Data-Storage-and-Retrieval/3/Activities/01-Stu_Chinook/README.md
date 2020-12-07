# Chinook Database Analysis

* In this activity, you will complete some exploratory analysis of the [chinook](https://chinookdatabase.codeplex.com/wikipage?title=Chinook_Schema&referringTitle=Home) database.

## Instructions

* Create a Jupyter Notebook for your analysis.

* Create a SQLAlchemy engine to the database `chinook.sqlite`.

* Design a query that lists all of the billing countries found in the invoices table.

* Design a query that lists the invoices totals for each billing country and sort the output in descending order.

* Design a query that lists all of the Billing Postal Codes for the USA.

* Calculate the Item Totals **sum(UnitPrice \* Quantity)** for the USA.

  * Return the value as a scalar floating point number.

* Calculate the invoice items totals **sum(UnitPrice \* Quantity)** for each Billing Postal Code for the USA.

* Expose the invoice item totals by zip code as a new endpoint using Flask. Call the endpoint whatever you'd like.

**Use Pandas to query the data.**
