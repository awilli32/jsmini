# Pet Pal

## Instructions

* Create a full-stack application that allows users to enter information about their pets then renders a chart visualizing the number of pets by type. Also, generate a dynamic table which returns all of the records from the `pets` table.

### Server-side (Python)

* In `app.py`, setup your database. Then create two routes:

  1. '/send': This route will handle both GET and POST requests. If the request method is POST, save the form data to the database. Otherwise, return the `form.html` template.
  2. '/api/pals-summary': This route will query the database and return a summary of all pets by type, then return a jsonified dictionary to the client for plotting. For example, one column should contain the type of pet, and the other should contain the count.
  3. '/api/pals': This route will query the database for all columns for each pet then return a jsonified dictionary to the client for plotting. For example, this route should return the name, type, and age for each pet. 

### Client-side (JavaScript)

* In `/static/js/app.js`, use `d3.json()` to make a request to your API. Build a plot (bar) with the response data.
* Right below the bar graph, include a table that lists out the detail for each pet. 
