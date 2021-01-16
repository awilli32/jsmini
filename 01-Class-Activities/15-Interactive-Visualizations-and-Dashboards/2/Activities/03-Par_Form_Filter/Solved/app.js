// Assign the data from `data.js` to a descriptive variable
var people = data;

// Select the button
var button = d3.select("#button");

// Create event handlers 
button.on("click", loadTable);

// Complete the event handler function for the form
function loadTable() {
 
  // Select the input element and get the raw HTML node
  var inputElement = d3.select("#patient-form-input");

  // Get the value property of the input element
  var inputValue = inputElement.property("value");

  //console.log(inputValue);
  //console.log(people);

  var filteredData = people.filter(person => person['bloodType'] == inputValue);

  // Get a reference to the table body
  var tbody = d3.select("#patient-table").select("tbody");
  tbody.html('');  
  
  // Generate table dynamically
  filteredData.forEach(person => {
    //inspired by Rigby

    var row = tbody.append("tr");

    fullName = person['fullName'];
    age = person['age'];
    bloodType = person['bloodType'];

    var cell = row.append("td");
    cell.text(fullName);

    var cell = row.append("td");
    cell.text(age);

    var cell = row.append("td");
    cell.text(bloodType);

  });

  

  /*
  filteredData.forEach((person) => {
    var row = tbody.append("tr");

    Object.entries(person).forEach(([key, value]) => {
    var cell = row.append("td");
    cell.text(value);
    });
    
  });
  */

  // BONUS: Calculate summary statistics for the age field of the filtered data

  // First, create an array with just the age values
  var ages = filteredData.map(person => person['age']);

  // Next, use math.js to calculate the mean and median of the ages
  var mean = math.round(math.mean(ages),1);
  var median = math.round(math.median(ages),1);
  
  // Then, select the unordered list element by class name
  var list = d3.select("#summary");

  // remove any children from the list to
  list.html("");

  // append stats to the list
  list.append("li").text(`Mean: ${mean}`);
  list.append("li").text(`Median: ${median}`);
};