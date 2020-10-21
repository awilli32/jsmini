#Using a tuple instead of a list can give the programmer and the interpreter a hint that the data should not be changed.

# Creates a tuple, a sequence of immutable Python objects that cannot be changed
thistuple = ("25006607", "Williams", "Dartanion", "Deangelo", "M", "1983")
print(thistuple)

#%%
print(thistuple[1])

#%%
print(thistuple[-1])

#%%
print(thistuple[2:5])

#%%
x_tuple = ("25006607", "Williams", "Dartanion")
x_tuple[0] = "25007301"

#%%
print(x_tuple)

#%%
y_list = list(x_tuple)
y_list[0] = "25007301"
y_list

#%%
z_tuple = tuple(y_list)
print(z_tuple)