# Take input of you and your classmate
your_first_name = input("What is your name? ")
classmate_first_name = input("Name someone from your study group ")

# Take how long each of you have been coding
months_you_coded = int(input("How many months have you been coding? "))
months_classmate_coded = int(input(f"How many months has your classmate {classmate_first_name} been coding? "))

# Add total months
total_months_coded = months_you_coded + months_classmate_coded

# Print results
print("I am " + your_first_name + " and my classmate is " + classmate_first_name)
print("Together we have been coding for " + str(total_months_coded) + " months!")

# Print results in f-string
print(f"I am {your_first_name} and my classmate is {classmate_first_name}")
print(f"Together we have been coding for {total_months_coded} months!")