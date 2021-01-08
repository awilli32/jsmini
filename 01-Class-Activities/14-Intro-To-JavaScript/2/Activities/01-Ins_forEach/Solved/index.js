// Array of student names
var students = ["Brooke", "Meakin", "Sandra", "Vera"];

// This function will be called for each element in the array
function printName(name) {
  console.log(name);
}

// OPTION 1 - TRADITIONAL FOR LOOP
// Loop through each student name and call the printName function
for (var i = 0; i < students.length; i++) {
  printName(students[i]);
}

// OPTION 2 - FOREACH LOOP WITH A DEFINED FUNCTION
// `forEach` automatically iterates (loops) through each item and
// calls the supplied function for that item.
// This is equivalent to the for loop above.
students.forEach(printName);

// OPTION 3 - FOREACH LOOP WITH AN ANONYMOUS FUNCTION
// You can also define an anonymous function inline
students.forEach(function(name) {
  console.log(name);
});