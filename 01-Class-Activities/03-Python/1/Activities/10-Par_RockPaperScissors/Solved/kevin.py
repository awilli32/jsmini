# Incorporate the random library
import random

# Print title
print("Let's Play Rock Paper Scissors!")
# Specify the three options
options = ["r", "p", "s"]

keep_playing = True

while(keep_playing):
    # Computer Selection
    computer_choice = random.choice(options)

    # User Selection
    user_choice = input("Make your Choice: (r)ock, (p)aper, (s)cissors? OR (q)uit to quit: ").lower()

    # Run Conditionals
    if user_choice == computer_choice: 
        print(f"Tie game. You both chose {computer_choice}")
    elif user_choice == "r":
        if computer_choice == "s":
            print(f"YOU WIN! You chose {user_choice} and the computer chose {computer_choice}")
        else:
            print(f"YOU LOSE! You chose {user_choice} and the computer chose {computer_choice}")
    elif user_choice == "p":
        if computer_choice == "r":
            print(f"YOU WIN! You chose {user_choice} and the computer chose {computer_choice}")
        else:
            print(f"YOU LOSE! You chose {user_choice} and the computer chose {computer_choice}")
    elif user_choice == "s":
        if computer_choice == "p":
            print(f"YOU WIN! You chose {user_choice} and the computer chose {computer_choice}")
        else:
            print(f"YOU LOSE! You chose {user_choice} and the computer chose {computer_choice}")
    elif user_choice == 'q':
        print('Thanks for playing')
        keep_playing = False
    else:
        print("Please enter a valid option")