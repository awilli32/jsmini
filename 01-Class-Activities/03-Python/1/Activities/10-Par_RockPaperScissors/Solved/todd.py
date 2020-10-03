# Incorporate the random library
import random
# Print Title
print("Let's Play Rock Paper Scissors!")

# Specify the three options
options = ["r", "p", "s"]

user_wins = 0
computer_wins = 0
tie = 0

while(True):
    # Computer Selection
    computer_choice = random.choice(options)
    
    # User Selection
    user_choice = input("Make your Choice: (r)ock, (p)aper, (s)cissors?: ").lower()
    
    # Run Conditionals
    if(user_choice in options):
        if computer_choice == user_choice:
            print("TIE: do over!")
            tie += 1
        elif user_choice == "r":
            if computer_choice == "p":
                print("Computer wins with paper!")
                computer_wins += 1
            else:
                print("You win against scissors!")
                user_wins += 1
        elif user_choice == "p":
            if computer_choice == "r":
                print("you win against Rock!")
                user_wins += 1
            else:
                print("Computer wins with scissors")
                computer_wins += 1
        elif user_choice == "s":
            if computer_choice == "r":
                print("Computer wins Rock!")
                computer_wins += 1
            else:
                print("You win against scissors!")
                user_wins += 1
    else:
        print("I pity the fool!!")
        
    playagain = input("Enter [Y]es to play again: ").upper()

    if(playagain == 'Y' or playagain == 'Yes'):
        continue
    else:
        print(f"Your wins: {user_wins}")
        print(f"Computer wins: {computer_wins}")
        print("Thanks for playing!")
        break