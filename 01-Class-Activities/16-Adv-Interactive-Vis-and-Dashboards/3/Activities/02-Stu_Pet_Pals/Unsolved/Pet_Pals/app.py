# import necessary libraries
import pandas as pd

from flask import (
    Flask,
    render_template,
    jsonify,
    request,
    redirect)

from sqlalchemy import create_engine

app = Flask(__name__)

engine = create_engine('sqlite:///db/pets.sqlite')

# create route that renders index.html template
@app.route("/")
def home():    
    return render_template("index.html")

# Query the database and send the jsonified results
@app.route("/send", methods=["GET", "POST"])
def send():

    # Create your database connection
    
    # Pull the petName, petType, and petAge from the form POST request
    # Use the an if statement to determine if the method is POST
    # Within the if statement:
        # Write the record to your SQL database
        # Consider storing the post to a DataFrame and using the to_sql method to write to the database
        # Use the redirect function to send the user back to the home page ('/') route

    # Close your database connection
    
    # If this is a GET request (not a POST request), use the render_template function to serve up form.html
    return #your-code-here

@app.route("/api/pals")
def pals():
    
    # connect to the database engine
    conn = engine.connect()
    
    # query all records from the pets table
    # store the records into a DataFrame
    # convert the data into json
    # close your database connection
    # return the json to the client

@app.route("/api/pals-summary")
def pals_summary():
    conn = engine.connect()

    query = '''
        SELECT 
            type,
            COUNT(type) as count
        FROM
            pets
        GROUP BY
            type
    ''' 

    pets_df = pd.read_sql(query, con=conn)

    pets_json = pets_df.to_json(orient='records')

    conn.close()

    return pets_json

if __name__ == "__main__":
    app.run(debug=True)