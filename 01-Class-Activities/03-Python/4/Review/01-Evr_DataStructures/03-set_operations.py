# -*- coding: UTF-8 -*-
"""Set Operations."""

#%%

# Declare two `set` objects called `hero1` and `hero2`

print('\n\n************\n   Declare two `set` objects called `hero1` and `hero2`\n************')
hero1 = {"smart", "rich", "armored", "martial_artist", "strong"}
hero2 = {"smart", "fast", "strong", "invulnerable", "antigravity"}

#%%

# Show the data type for the two new sets
print('\n\n************\n   Show the data type for the two new sets\n************')
hero1_type = type(hero1)
hero2_type = type(hero2)

print(f'hero1 is of type: {hero1_type}')
print(f'hero2 is of type: {hero2_type}')

#%%

# Attributes for both heros (union)
print('\n\n************\n   Attributes for both sets\n************')
hero1 | hero2
hero1.union(hero2)

#%%

# Attributes common to both heros (intersection)
print('\n\n************\n   Attributes common to both sets (intersection)\n************')
hero1 & hero2
hero1.intersection(hero2)

#%%

# Attributes in hero1 that are not in hero2 (difference)
print('\n\n************\n   Attributes in hero1 that are not in hero2 (difference)\n************')
hero1 - hero2
hero1.difference(hero2)

#%%

# Attributes in hero2 that are not in hero1 (difference)
print('\n\n************\n   Attributes in hero2 that are not in hero1 (difference)\n************')

hero2 - hero1
hero2.difference(hero1)

#%%

# Attributes for hero1 or hero2 but not both (symmetric difference)
print('\n\n************\n   Attributes for hero1 or hero2 but not both (symmetric difference)\n************')
hero1 ^ hero2
hero1.symmetric_difference(hero2)