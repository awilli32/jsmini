#%%
# import json to use json.dumps()
import json

#%%
# ---------------------------------------------------------------
# Unlike lists, dictionaries store information in pairs

# A list of actors
actors = ["Tom Cruise",
          "Angelina Jolie",
          "Kristen Stewart",
          "Denzel Washington"]

# A dictionary of an actor-
actor = {"name": "Tom Cruise"}

#print(actor)
print(json.dumps(actor, indent=4))
#%%
# ---------------------------------------------------------------

# A dictionary can contain multiple pairs of information
actress = {
    "name": "Angelina Jolie",
    "genre": "Action",
    "nationality": "United States"
}

#print(actress)
print(json.dumps(actress, indent=4))
#%%
# ---------------------------------------------------------------

# A dictionary can contain multiple types of information
another_actor = {
    "name": "Sylvester Stallone",
    "age": 62,
    "married": True,
    "best movies": [
        "Rocky",
        "Rocky 2",
        "Rocky 3"]}

print(f'{another_actor["name"]} was in {another_actor["best movies"][2]}')

#print(another_actor)
#print(json.dumps(another_actor, indent=4))
# ---------------------------------------------------------------

#%%
# A dictionary can even contain another dictionary
film = {
    "title": "Interstellar",
    "revenues": {
        "United States": 360,
        "China": 250,
        "United Kingdom": 73
    }
}

print(f'{film["title"]} made {film["revenues"]["United States"]}'" in the US.")

#print(film)
print(json.dumps(film, indent=4))

#%%
# ---------------------------------------------------------------
for k, v in another_actor.items():
    
    if(k == 'name'):
        name = v
    
    if(k == 'best movies'):
        for val in v:
            print(f'{name} was in {val}')