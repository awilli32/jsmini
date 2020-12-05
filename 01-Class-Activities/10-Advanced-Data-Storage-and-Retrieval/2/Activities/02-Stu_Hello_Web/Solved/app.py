# 1. Import Flask
from flask import Flask

#%%

# 2. Create an app
yasir = Flask(__name__)

#%%

# 3. Define static routes
@yasir.route("/")
def index():
    return "Hello, world!"

#%%
    
@yasir.route("/about")
def about():
    name = "Dartanion"
    location = "Chicago, IL"

    return f"My name is {name}, and I live in {location}."

#%%

@yasir.route("/contact")
def c():
    email = "dartanion@dartanion.net"

    return f"Questions? Comments? Complaints? Shoot an email to {email}."

#%%

# 4. Define main behavior
if __name__ == "__main__":
    yasir.run(debug=True)