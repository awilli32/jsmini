#%%
# Loop while a condition is being met

run = "y"

while run == "y":
    print("Hello World!")
    run = input("To run again. Enter 'y': ")

#%%
# A While Loop will continue to loop through the code contained within it until some condition is met

while(True):
    print("The Great Dartanion!")

    prompt = f"Would you like to honor the great one again?" \
        "\n\t [y]es" \
        "\n\t [n]o" \
        "\n>> "
        
    honorTheGreat = input(prompt)
    
    if(honorTheGreat == 'y'):
        pass
    elif(honorTheGreat == 'n'):
        break
    else:
        print("Whatevs... but we will continue anyway.")
        continue
    
print("Farewell!")