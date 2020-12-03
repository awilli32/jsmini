# 1. Import Flask
from flask import Flask

#%%
# 2. Create an app
app = Flask(__name__)

#%%
# 3. Define static routes
@app.route("/")
def index():
    return "Hello, world!"

#%%
# create your "about" route

#%%
# create your "about" routes

#%%
# 4. Define main behavior
if __name__ == "__main__":
    app.run(debug=True)
