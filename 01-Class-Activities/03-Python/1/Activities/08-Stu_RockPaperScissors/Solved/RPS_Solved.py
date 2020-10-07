# Incorporate the random library
import random

# Print Title
print("Let's Play Rock Paper Scissors!")

# Specify the three options
options = ["r", "p", "s"]

# Computer Selection
computer_choice = random.choice(options)
print("Computer Choice:" + computer_choice)

# User Selection
user_choice = input("Make your Choice: (r)ock, (p)aper, (s)cissors? ")
print("User Choice:" + user_choice)

# Run Conditionals
if user_choice == computer_choice:
    print("Its a tie!")
elif user_choice == 'r':
    if computer_choice == 's':
        print("you win!")
    else:
        print("you lose!")
elif user_choice == "p":
    if computer_choice == 'r':
        print("you win!")
    else:
        print("you lose!")
elif user_choice == "s":
    if computer_choice == 'p':
        print("you win!")
    else:
        print("you lose!")