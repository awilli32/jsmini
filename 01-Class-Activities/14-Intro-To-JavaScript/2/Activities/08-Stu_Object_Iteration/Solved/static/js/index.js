var recipes = [
  { dish: "Fried fish", spice: "Dorrigo" },
  { dish: "Crab Rangoon", spice: "Akudjura" },
  { dish: "Pickled Okra", spice: "Chili pepper" },
  { dish: "Macaroni salad", spice: "Pepper" },
  { dish: "Apple butter", spice: "Avens" },
  { dish: "Pepperoni Pizza", spice: "Asafoetida" },
  { dish: "Hog fry", spice: "Peppermint" },
  { dish: "Corn chowder", spice: "Akudjura" },
  { dish: "Home fries", spice: "Celery leaf" },
  { dish: "Hot chicken", spice: "Boldo" }];

// Create empty arrays to store the dish and spice values
var dishes = [];
var spices = [];

// FOREACH
// Iterate through each recipe object
recipes.forEach(recipe => {
  // console.log(recipe);
  dishes.push(recipe['dish']);
  spices.push(recipe['spice']);
});

console.log(dishes);
console.log(spices);

// OBJECT.ENTRIES
Object.entries(recipes).forEach(recipe => {
  console.log(recipe);
  dishes.push(recipe[1]['dish'])
  spices.push(recipe[1]['dish'])
});

// MAP
dishes = recipes.map(recipe => recipe['dish']);
spices = recipes.map(recipe => recipe['spice']);

console.log(dishes);
console.log(spices);


console.log(dishes)