# import necessary libraries
import pandas as pd

from flask import (
    Flask,
    render_template,
    jsonify,
    request,
    redirect)

from sqlalchemy import func, create_engine

app = Flask(__name__)

engine = create_engine('sqlite:///db/db.sqlite')

@app.route("/send", methods=["GET", "POST"])
def send():
    conn = engine.connect()

    if request.method == "POST":
        nickname = request.form["nickname"]
        age = request.form["age"]

        nickname_df = pd.DataFrame({
            'nickname': [nickname],
            'age': [age],
        })

        nickname_df.to_sql('pets', con=conn, if_exists='append', index=False)

        return "Thanks for the form data!"

    return render_template("form.html")


@app.route("/api/data")
def list_pets():
    conn = engine.connect()
  
    pets_df = pd.read_sql('SELECT * FROM pets', con=conn)

    pets_json = pets_df.to_json(orient='records')

    conn.close()

    return pets_json


@app.route("/")
def home():
    return "Welcome!"


if __name__ == "__main__":
    app.run(debug=True)