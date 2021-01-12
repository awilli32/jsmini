var theStagesOfJS = ["confidence", "sadness", "confusion", "realization", "debugging", "satisfaction"];
var students = [
  { name: "Malcolm", score: 80 },
  { name: "Zoe", score: 85 },
  { name: "Kaylee", score: 99 },
  { name: "Simon", score: 99 },
  { name: "Wash", score: 79 }
];

// An Arrow function is a new concise syntax for function
// Arrow functions allow us to drop the `function` keyword and just show the parameters.
// Note: The fat arrow `=>` that was added to indicate an arrow function.
var mapSimpleArray = theStagesOfJS.map(function(item) {
  return item.toUpperCase();
  //return `Dart feels ${item}`;
});
console.log(mapSimpleArray);

temps = [
  ['Chicago', 86],
  ['DC', 81],
  ['San Fran', 78],
]

var newTemps = temps.map(([city, temp]) => `In ${city}, the temperature is ${temp} degrees.`)
console.log(newTemps);

var mapArrow1 = theStagesOfJS.map((item) => {
  return item.toUpperCase();
});
console.log(mapArrow1);

// We can drop the parentheses around the parameter if there's only one of them,
// but if we include the return keyword we must surround the return statement with curly braces.
var mapArrow2 = theStagesOfJS.map(item => { 
  output = `Meakin feels ${item}`;
  upperOutput = output.toUpperCase();

  return upperOutput; 
});

console.log(mapArrow2);

// And finally, we can just drop the `return` keyword. The return is implied.
var mapArrow3 = theStagesOfJS.map(item => item.toUpperCase);
console.log(mapArrow3);

// Functions with more than one parameter still need the parenthesis
var mapReturn2 = theStagesOfJS.map((item, index) => {
  return `Stage ${index}: ${item}`;
});

// We can also drop the curly braces here
var mapReturn2 = theStagesOfJS.map((item, index) => `Stage ${index + 1}: ${item}`);
console.log(mapReturn2);

var students = [
  { name: "Malcolm", score: 80 },
  { name: "Zoe", score: 85 },
  { name: "Kaylee", score: 99 },
  { name: "Simon", score: 99 },
  { name: "Wash", score: 79 }
];

// Map and Arrow makes it really easy to build an array of values for an
// array of objects
var names = students.map(student => student['name']);
console.log(names);
//var names = students.map(student => student.name];

var scores = students.map(score => score['score']);
console.log(scores);

var arrayOfArrays = students.map(student => [student['name'], student['score']]);
console.log(arrayOfArrays);

// Challenge Activity!
var princesses = [
  { name: "Rapunzel", age: 18 },
  { name: "Mulan", age: 16 },
  { name: "Anna", age: 18 },
  { name: "Moana", age: 16 }
];

// log the name of each princess, follow by a colon, followed by their age
// forEach: executes a provided function once for each array element
princesses.forEach(princess => console.log(`${princess['name']}: ${princess['age']}`));

// create an array of just the names from the princesses array
// map: creates a new array with the results of calling a provided function on every element in the calling array
var names = princesses.map(princess => princess.name);
console.log("names: ", names);
