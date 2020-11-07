```
# Dependencies
import pandas as pd
import numpy as np
import requests
import json

# Google API Key
from config import gkey
```


```
# Import cities file as DataFrame
cities_pd = pd.read_csv("../Resources/cities.csv")
cities_pd.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>City</th>
      <th>State</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>0</td>
      <td>New York City</td>
      <td>New York</td>
    </tr>
    <tr>
      <td>1</td>
      <td>Los Angeles</td>
      <td>California</td>
    </tr>
    <tr>
      <td>2</td>
      <td>Chicago</td>
      <td>Illinois</td>
    </tr>
    <tr>
      <td>3</td>
      <td>Houston</td>
      <td>Texas</td>
    </tr>
    <tr>
      <td>4</td>
      <td>Philadelphia</td>
      <td>Pennsylvania</td>
    </tr>
  </tbody>
</table>
</div>




```
# Add columns for lat, lng, airport name, airport address, airport rating
# Note that we used "" to specify initial entry.
cities_pd["Lat"] = ""
cities_pd["Lng"] = ""
cities_pd["Airport Name"] = ""
cities_pd["Airport Address"] = ""
cities_pd["Airport Rating"] = ""
cities_pd.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>City</th>
      <th>State</th>
      <th>Lat</th>
      <th>Lng</th>
      <th>Airport Name</th>
      <th>Airport Address</th>
      <th>Airport Rating</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>0</td>
      <td>New York City</td>
      <td>New York</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>1</td>
      <td>Los Angeles</td>
      <td>California</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>2</td>
      <td>Chicago</td>
      <td>Illinois</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>3</td>
      <td>Houston</td>
      <td>Texas</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>4</td>
      <td>Philadelphia</td>
      <td>Pennsylvania</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>




```
# create a params dict that will be updated with new city each iteration
params = {"key": gkey}

# Loop through the cities_pd and run a lat/long search for each city
for index, row in cities_pd[:10].iterrows():
    base_url = "https://maps.googleapis.com/maps/api/geocode/json"

    city = row['City']
    state = row['State']

    # update address key value
    params['address'] = f"{city},{state}"

    # make request
    cities_lat_lng = requests.get(base_url, params=params)
    
    # print the cities_lat_lng url, avoid doing for public github repos in order to avoid exposing key
    # print(cities_lat_lng.url)
    
    # convert to json
    cities_lat_lng = cities_lat_lng.json()

    cities_pd.loc[index, "Lat"] = cities_lat_lng["results"][0]["geometry"]["location"]["lat"]
    cities_pd.loc[index, "Lng"] = cities_lat_lng["results"][0]["geometry"]["location"]["lng"]

# Visualize to confirm lat lng appear
cities_pd.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>City</th>
      <th>State</th>
      <th>Lat</th>
      <th>Lng</th>
      <th>Airport Name</th>
      <th>Airport Address</th>
      <th>Airport Rating</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>0</td>
      <td>New York City</td>
      <td>New York</td>
      <td>40.7128</td>
      <td>-74.006</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>1</td>
      <td>Los Angeles</td>
      <td>California</td>
      <td>34.0522</td>
      <td>-118.244</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>2</td>
      <td>Chicago</td>
      <td>Illinois</td>
      <td>41.8781</td>
      <td>-87.6298</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>3</td>
      <td>Houston</td>
      <td>Texas</td>
      <td>29.7604</td>
      <td>-95.3698</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>4</td>
      <td>Philadelphia</td>
      <td>Pennsylvania</td>
      <td>39.9526</td>
      <td>-75.1652</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>




```
# params dictionary to update each iteration
params = {
    "radius": 50000,
    "types": "airport",
    "keyword": "international airport",
    "key": gkey
}

# Use the lat/lng we recovered to identify airports
for index, row in cities_pd[:10].iterrows():
    # get lat, lng from df
    lat = row["Lat"]
    lng = row["Lng"]

    # change location each iteration while leaving original params in place
    params["location"] = f"{lat},{lng}"

    # Use the search term: "International Airport" and our lat/lng
    base_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"

    # make request and print url
    name_address = requests.get(base_url, params=params)
    
#     print the name_address url, avoid doing for public github repos in order to avoid exposing key
#     print(name_address.url)

    # convert to json
    name_address = name_address.json()
    # print(json.dumps(name_address, indent=4, sort_keys=True))

    # Since some data may be missing we incorporate a try-except to skip any that are missing a data point.
    try:
        cities_pd.loc[index, "Airport Name"] = name_address["results"][0]["name"]
        cities_pd.loc[index, "Airport Address"] = name_address["results"][0]["vicinity"]
        cities_pd.loc[index, "Airport Rating"] = name_address["results"][0]["rating"]
    except (KeyError, IndexError):
        print("Missing field/result... skipping.")
```


```
# Save Data to csv
cities_pd.to_csv("Airport_Output.csv")

# Visualize to confirm airport data appears
cities_pd.head(10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>City</th>
      <th>State</th>
      <th>Lat</th>
      <th>Lng</th>
      <th>Airport Name</th>
      <th>Airport Address</th>
      <th>Airport Rating</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>0</td>
      <td>New York City</td>
      <td>New York</td>
      <td>40.7128</td>
      <td>-74.006</td>
      <td>John F. Kennedy International Airport</td>
      <td>Queens</td>
      <td>3.8</td>
    </tr>
    <tr>
      <td>1</td>
      <td>Los Angeles</td>
      <td>California</td>
      <td>34.0522</td>
      <td>-118.244</td>
      <td>Los Angeles International Airport</td>
      <td>1 World Way, Los Angeles</td>
      <td>3.7</td>
    </tr>
    <tr>
      <td>2</td>
      <td>Chicago</td>
      <td>Illinois</td>
      <td>41.8781</td>
      <td>-87.6298</td>
      <td>O'Hare International Airport</td>
      <td>10000 W O'Hare Ave, Chicago</td>
      <td>3.8</td>
    </tr>
    <tr>
      <td>3</td>
      <td>Houston</td>
      <td>Texas</td>
      <td>29.7604</td>
      <td>-95.3698</td>
      <td>George Bush Intercontinental Airport</td>
      <td>2800 N Terminal Rd, Houston</td>
      <td>4</td>
    </tr>
    <tr>
      <td>4</td>
      <td>Philadelphia</td>
      <td>Pennsylvania</td>
      <td>39.9526</td>
      <td>-75.1652</td>
      <td>Philadelphia International Airport</td>
      <td>8000 Essington Ave, Philadelphia</td>
      <td>3.6</td>
    </tr>
    <tr>
      <td>5</td>
      <td>Phoenix</td>
      <td>Arizona</td>
      <td>33.4484</td>
      <td>-112.074</td>
      <td>Phoenix Sky Harbor International Airport</td>
      <td>3400 E Sky Harbor Blvd, Phoenix</td>
      <td>4.2</td>
    </tr>
    <tr>
      <td>6</td>
      <td>San Antonio</td>
      <td>Texas</td>
      <td>29.4241</td>
      <td>-98.4936</td>
      <td>San Antonio International Airport</td>
      <td>9800 Airport Blvd, San Antonio</td>
      <td>4.1</td>
    </tr>
    <tr>
      <td>7</td>
      <td>San Diego</td>
      <td>California</td>
      <td>32.7157</td>
      <td>-117.161</td>
      <td>San Diego International Airport</td>
      <td>3225 N Harbor Dr, San Diego</td>
      <td>4.2</td>
    </tr>
    <tr>
      <td>8</td>
      <td>Dallas</td>
      <td>Texas</td>
      <td>32.7767</td>
      <td>-96.797</td>
      <td>Dallas/Fort Worth International Airport</td>
      <td>2400 Aviation Dr, DFW Airport</td>
      <td>4</td>
    </tr>
    <tr>
      <td>9</td>
      <td>San Jose</td>
      <td>California</td>
      <td>37.3382</td>
      <td>-121.886</td>
      <td>San Francisco International Airport</td>
      <td>San Francisco</td>
      <td>4</td>
    </tr>
  </tbody>
</table>
</div>


