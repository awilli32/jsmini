# %%
# Import Dependencies
import sqlalchemy
from sqlalchemy import create_engine
import pandas as pd

import json
import flask
from flask import Flask, jsonify


#%%

#%%

# Create an engine for the chinook.sqlite database
engine = create_engine('sqlite:///../Resources/chinook.sqlite')
conn = engine.connect()

# %%

# %%

# %%

if __name__ == '__main__':
    app.run(debug=True)