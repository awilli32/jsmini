# Modules
import os
import csv

# Prompt user for video lookup
video = input("What show or movie are you looking for? ")

# Set path for file
csvpath = os.path.join("..", "Resources", "netflix_ratings.csv")

# Open the CSV
with open(csvpath) as csvfile:
    csvreader = csv.reader(csvfile, delimiter=",")

    found = False
    
    # Loop through looking for the video
    for row in csvreader:
        title = row[0]
        content_rating = row[1]
        user_rating = row[5]
        
        if title == video:
            print(f'{title} is rated {content_rating} with a rating of {user_rating}')
            found = True
            break
            
    if found == False:
        print(f'Sorry. The movie {video} was not found')