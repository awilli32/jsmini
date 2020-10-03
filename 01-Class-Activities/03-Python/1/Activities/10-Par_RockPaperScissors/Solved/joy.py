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


if computer_choice == user_choice:
    print("Is a tied!")
elif computer_choice =="r" and user_choice=="s" or computer_choice=="p" and user_choice=="r" or computer_choice=="s" and user_choice=="p":
    print("You have lost :(")
elif computer_choice=="r" and user_choice=="p" or computer_choice=="p" and user_choice=="s" or computer_choice=="s" and user_choice=="r":
    print("You have won :)")