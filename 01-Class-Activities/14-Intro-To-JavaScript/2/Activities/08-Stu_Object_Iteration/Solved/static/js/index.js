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
  { dish: "Hot chicken", spice: "Boldo" }
];

// Create empty arrays to store the dish and spice values
var dishes = [];
var spices = [];

// MAP -- most simple
dishes = recipes.map(recipe => recipe['dish']);
spices = recipes.map(recipe => recipe['spice']);

console.log(dishes);
console.log(spices);

// FOREACH -- second most simple
// Iterate through each recipe object
recipes.forEach(recipe => {
  console.log(recipe);
  dishes.push(recipe['dish']);
  spices.push(recipe['spice']);
});

console.log(dishes);
console.log(spices);

// OBJECT.ENTRIES -- most complicated
Object.entries(recipes).forEach(([key, recipe]) => {
  console.log(recipe);
  dishes.push(recipe['dish'])
  spices.push(recipe['dish'])
});

console.log(dishes);
console.log(spices);