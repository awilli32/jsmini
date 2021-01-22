# import necessary libraries
import pandas as pd

from flask import (
    Flask,
    render_template,
    jsonify,
    request,
    redirect)

from sqlalchemy import create_engine

# instantiate Flask
app = Flask(__name__)

# connect to the SQLite DB
engine = create_engine('sqlite:///db/db.sqlite')

# create your default route
@app.route("/")
def home():
    return render_template('index.html')

# route to generate the form and/or POST data
@app.route("/send", methods=["GET", "POST"])
def send():
    # connect to db engine
    conn = engine.connect()

    # do this only if the form is POSTing data
    # evaluate if the this is a POST request
    if request.method == "POST":

        # use `request.form` to pull form attributes by their `name` attribute in the HTML
        nickname = request.form["nickname"]
        age = request.form["age"]

        # convert to a DataFrame so that we can use to_sql
        nickname_df = pd.DataFrame({
            'nickname': [nickname],
            'age': [age],
        })

        # post the update to the DB
        nickname_df.to_sql('pets', con=conn, if_exists='append', index=False)

        # send the user to the endpoint that contains the data listing
        return redirect('/')

    # if the method is NOT POST (otherwise, GET, then send the user to the form)
    return render_template("form.html")

# route to view data
@app.route("/api/data")
def list_pets():
    # connect to db engine
    conn = engine.connect()
  
    # query the database using Pandas
    pets_df = pd.read_sql('SELECT * FROM pets', con=conn)

    # convert the result to json
    pets_json = pets_df.to_json(orient='records')

    # close the db connection
    conn.close()

    # return json to the client
    return pets_json

# run the app in debug mode
if __name__ == "__main__":
    app.run(debug=True)