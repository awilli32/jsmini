# Print Hello User!
print("Hello User!")

# Take in User Input
name = input("What is your name? ")

# Respond Back with User Input
print(f"Hi {name}!")

# Take in the User Age
age = int(input(f"What is your age? "))

# Respond Back with a statement based on age
if (age < 17):
    print("Aww! You are just a baby!")
elif (age >= 17):
    print("Ah... A well traveled soul are ye!")
else:
    print("You are an alien.")