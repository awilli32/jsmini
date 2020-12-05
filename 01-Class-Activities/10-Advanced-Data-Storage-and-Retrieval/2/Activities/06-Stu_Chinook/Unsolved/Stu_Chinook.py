#!/usr/bin/env python
# coding: utf-8

# In[ ]:

# Ignore SQLITE warnings related to Decimal numbers in the Chinook database
import warnings
warnings.filterwarnings('ignore')

# In[1]:
# Import Dependencies
import sqlalchemy
from sqlalchemy import create_engine
import pandas as pd

# In[24]:

# Create an engine for the chinook.sqlite database
engine = create_engine('sqlite:///../Resources/chinook.sqlite')
conn = engine.connect()

# In[25]:

billing_country_df = pd.read_sql('SELECT DISTINCT BillingCountry FROM Invoices', conn)
billing_country_df.head()

# In[26]:

# Design a query that lists the invoices totals for each billing country 
# and sort the output in descending order.

query = '''
    SELECT
        BillingCountry,
        SUM(Total) AS Total
    FROM
        Invoices
    GROUP BY
        BillingCountry
    ORDER BY
        SUM(Total) DESC
'''

invoice_ttl_by_country_df = pd.read_sql(query, conn)
invoice_ttl_by_country_df.head(20)

# In[13]:

# Example of achieving the same result in Pandas
invoices_group = invoice_ttl_by_country_df.groupby('BillingCountry')
invoices_group['Total'].sum().sort_values(ascending=False)

# In[27]:

# List all of the Billing Postal Codes for the USA.

invoices_df = pd.read_sql('SELECT DISTINCT BillingPostalCode FROM Invoices', conn)
invoices_df.head()

# In[28]:

# Calculate the Item Totals (sum(UnitPrice * Quantity)) for the USA

query = '''
    SELECT
        BillingCountry,
        SUM(UnitPrice * Quantity) AS Calculated_Total
    FROM
        invoice_items ii
        INNER JOIN invoices i
        ON ii.InvoiceId = i.InvoiceId
    WHERE	
        BillingCountry = 'USA'
    GROUP BY
        BillingCountry 
'''

usa_totals = pd.read_sql(query, conn)
usa_totals

# In[29]:

# Calculate the Item Totals `sum(UnitPrice * Quantity)` for each Billing Postal Code in the USA
# Sort the results in descending order by Total

query = '''
    SELECT
        BillingCountry,
        BillingPostalCode,
        SUM(UnitPrice * Quantity) AS Calculated_Total
    FROM
        invoice_items ii
        INNER JOIN invoices i
        ON ii.InvoiceId = i.InvoiceId
    WHERE	
        BillingCountry = 'USA'
    GROUP BY
        BillingCountry ,
        BillingPostalCode
'''

usa_zipcode_totals = pd.read_sql(query, conn)
usa_zipcode_totals


# In[35]:

import json
import flask
from flask import Flask, jsonify

# In[46]:

app = Flask(__name__)

# In[ ]:

@app.route('/')
def welcome():
    welcome = 'Welcome! Navigate to our /usaziptotals route to see data!'
    return(welcome)

# In[47]:

@app.route('/usaziptotals')
def usaziptotals():
    data_json = usa_zipcode_totals.to_json(orient='records')
    return(data_json)


# In[49]:

if __name__ == '__main__':
    app.run(debug=True)
