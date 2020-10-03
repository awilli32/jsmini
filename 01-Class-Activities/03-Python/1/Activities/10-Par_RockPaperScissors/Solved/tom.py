# Incorporate the random library
import random
# Print Title
print("Let's Play Rock Paper Scissors!")
# Specify the three options
options = ["r", "p", "s"]

# Computer Selection
computer_choice = random.choice(options)

# User Selection
# user_choice = input("Make your Choice: (r)ock, (p)aper, (s)cissors? x to exit ")
user_choice = ""

# Run Conditionals
usercounter = 0
computercounter = 0

while user_choice != "x" or user_choice == "":
    computer_choice = random.choice(options)
    user_choice = input("Make your Choice:\n\t(r)ock\n\t(p)aper\n\t(s)cissors?\n\tx to exit ")
    
    print("\n")
    print(f"You chose: {user_choice}")
    print(f"Computer chose: {computer_choice}")
    
    if user_choice == computer_choice:
        print("Tie")
    elif user_choice == "r" and computer_choice == "p":
        print("Computer Wins!")
        computercounter += 1
    elif user_choice == "r" and computer_choice == "s":
        print("User Wins!")
        usercounter += 1
    elif user_choice == "p" and computer_choice == "r":
        print("User Wins!")
        usercounter += 1
    elif user_choice == "p" and computer_choice == "s":
        print("Computer Wins!")
        computercounter += 1
    elif user_choice == "s" and computer_choice == "p":
        print("User Wins!")
        usercounter += 1
    elif user_choice == "s" and computer_choice == "r":
        print("Computer Wins!")
        computercounter += 1
    elif user_choice == "x":
        print("Thanks for playing!")
        print(f"User has won {usercounter} times.")
        print(f"Computer has won {computercounter} times.")
        print("")
    else:
        print("")
        print("Try again!")