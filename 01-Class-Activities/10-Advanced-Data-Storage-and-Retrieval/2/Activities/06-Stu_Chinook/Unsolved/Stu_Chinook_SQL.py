#!/usr/bin/env python
# coding: utf-8

# In[ ]:


# Ignore SQLITE warnings related to Decimal numbers in the Chinook database
import warnings
warnings.filterwarnings('ignore')


# In[ ]:


# Import Dependencies
import sqlalchemy
from sqlalchemy import create_engine
import pandas as pd


# In[ ]:


# Create an engine for the chinook.sqlite database
engine = create_engine("sqlite:///../Resources/chinook.sqlite", echo=False)
conn = engine.connect()


# In[ ]:





# In[ ]:





# In[ ]:


# Design a query that lists the invoices totals for each billing country 
# and sort the output in descending order.

# it is possible to design a query on multiple lines to enhance readability
query = '''
SELECT
    BillingCountry
    ,SUM(Total) AS Total
FROM
    invoices
GROUP BY
    BillingCountry
    ORDER BY Total DESC
'''

total_df = pd.read_sql(query, conn)
total_df.head()


# In[ ]:





# In[ ]:


# List all of the Billing Postal Codes for the USA.

pd.read_sql("SELECT DISTINCT BillingPostalCode FROM invoices WHERE BillingCountry = 'USA'", conn)


# In[ ]:


# Calculate the Item Totals (sum(UnitPrice * Quantity)) for the USA
query = '''
SELECT
    SUM(UnitPrice * Quantity) AS ItemTotal
FROM
    invoices i
    INNER JOIN invoice_items ii
    ON i.InvoiceId = ii.InvoiceId
WHERE
    BillingCountry = "USA"
'''

ttl_df = pd.read_sql(query, conn)
ttl_df


# In[ ]:


# Calculate the Item Totals `sum(UnitPrice * Quantity)` for each Billing Postal Code in the USA
# Sort the results in descending order by Total

query = '''
SELECT
    BillingPostalCode
    ,SUM(UnitPrice * Quantity) AS ItemTotal
FROM
    invoices i
    INNER JOIN invoice_items ii
    ON i.InvoiceId = ii.InvoiceId
WHERE
    BillingCountry = "USA"
GROUP BY
    BillingPostalCode
ORDER BY
    ItemTotal DESC
'''

ttl_df = pd.read_sql(query, conn)
ttl_df


# In[ ]:




