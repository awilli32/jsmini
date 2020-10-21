#%%

#Loop through a range of numbers (0 through 4)
for x in range(5):
    print(x)

print("-----------------------------------------")

#%%
# A For loop moves through a given range of numbers
# If only one number is provided it will loop from 0 to that number
for x in range(10):
    print(x)

#%%
# If two numbers are provided then a For loop will loop from the first number up until it reaches the second number
for x in range(20, 30, 2):
    print(x)

#%%
# Loop through a range of numbers (2 through 6 - yes 6! Up to, but not including, 7)
for x in range(2, 7):
    print(x)

print("----------------------------------------")

#%%
# Iterate through letters in a string
word = "Peace"

for l in range(len(word)):
    # print(l)
    
    print(f"{word[l]} is character {l + 1} in the word {word}")
    
    #P is character 1 in the word Peace
    #e is character 2 in the word Peace

print("----------------------------------------")

#%%
# Iterate through a list
zoo = ["cow", "dog", "bee", "zebra"]
for animal in zoo:
    print(animal)

print("----------------------------------------")
#%%
# If a list is provided, then the For loop will loop through each element within the list
words = ["Peanut", "Butter", "Jelly", "Time", "Is", "Now"]
for word in words:
    print(word)