# Collects the user's input for the prompt "What is your name?"
name = input("What is your name? ")

# Collects the user's input for the prompt "How old are you?" and converts the string to an integer.
age = int(input("How old are you? "))

# Collects the user's input for the prompt "Do you love coding??" and converts it to a boolean.
# Note that when casting to boolean, only non-zero, non-empty values resolve to true.
trueOrFalse = bool(input("Is the input truthy? "))

# Creates three print statements that to respond with the output.
print(f"My name is {name}")
print("I will be " + str(age + 1) + " next year.")
print(f"I will be {age + 2} in the year after next.")
print("I will be {age + 3} in three years.") # what went wrong here?
print("The input was converted to " + str(trueOrFalse))