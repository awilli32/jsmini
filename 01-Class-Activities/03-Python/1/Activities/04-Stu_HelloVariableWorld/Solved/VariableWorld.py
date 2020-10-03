# Declare variables
city = "Chicago"
state = "IL"
population = 2716000
covid_cases = 12262

# Perform covid_pct calculation
covid_pct = covid_cases/population

# Print with a traditional string"
print(city + ', ' + state + " has an estimated population of " + str(population) + '. There are ' + str(covid_cases) + ' COVID-19 cases which represents ' + str(covid_pct) + ' of the population.')

# Print with an f-string
print(f'{city}, {state} has an estimated population of {population}. There are {covid_cases} COVID-19 cases which represents {covid_pct} of the population.')

# BONUS: Print with an f-string and numbers formatted
print(f'{city}, {state} has an estimated population of {population:,d}. There are {covid_cases:,d} COVID-19 cases which represents {covid_pct:,.2%} of the population.')