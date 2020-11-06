```python
import json
import requests
import pandas as pd
```


```python
# List of character
search_characters = ['R2-D2', 'Darth Vader', 'Godzilla', 'Luke Skywalker', 'Frodo', \
              'Boba Fett', 'Iron Man', 'Jon Snow', 'Han Solo']

# Set url for API
url = 'https://swapi.dev/api/people/?search='

# Set empty lists to hold characters height and mass
height = []
mass = []
starwars_characters = []

# Loop through each character
for character in search_characters:
    
    # Create search query, make request and store in json
    query = url + character
    response = requests.get(query)
    response_json = response.json()
    
    # Try to grab the height and mass of characters if they are available in the Star Wars API
    try:
        height.append(response_json['results'][0]['height'])
        mass.append(response_json['results'][0]['mass'])
        starwars_characters.append(character)
        print(f"{character} found! Appending stats")
        
    # Handle exceptions for a character that is not available in the Star Wars API
    except:
        # Append null values
        print(f"Character {character} not found")
        pass
```

    R2-D2 found! Appending stats
    Darth Vader found! Appending stats
    Character Godzilla not found
    Luke Skywalker found! Appending stats
    Character Frodo not found
    Boba Fett found! Appending stats
    Character Iron Man not found
    Character Jon Snow not found
    Han Solo found! Appending stats
    


```python
# Create DataFrame
character_height = pd.DataFrame({
    'character': starwars_characters,
    'height': height,
    'mass': mass
})
character_height
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
      <th>character</th>
      <th>height</th>
      <th>mass</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>0</td>
      <td>R2-D2</td>
      <td>96</td>
      <td>32</td>
    </tr>
    <tr>
      <td>1</td>
      <td>Darth Vader</td>
      <td>202</td>
      <td>136</td>
    </tr>
    <tr>
      <td>2</td>
      <td>Luke Skywalker</td>
      <td>172</td>
      <td>77</td>
    </tr>
    <tr>
      <td>3</td>
      <td>Boba Fett</td>
      <td>183</td>
      <td>78.2</td>
    </tr>
    <tr>
      <td>4</td>
      <td>Han Solo</td>
      <td>180</td>
      <td>80</td>
    </tr>
  </tbody>
</table>
</div>




```python

```
