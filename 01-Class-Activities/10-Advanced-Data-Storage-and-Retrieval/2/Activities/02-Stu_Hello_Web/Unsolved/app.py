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
@app.route('/about')
def about():
    dart_info = 'Dartanion is from the south side of Chicago and loves ice cream.'
    # print(dart_info)
    return dart_info

#%%
# create your "about" routes
@app.route('/contact')
def contact():
    dart_info = 'Dartanion can be reached at (773) 575-7000'
    print('look at me over here!!!!!!!')
    return dart_info

#%%
# 4. Define main behavior
if __name__ == "__main__":
    app.run(debug=True)
