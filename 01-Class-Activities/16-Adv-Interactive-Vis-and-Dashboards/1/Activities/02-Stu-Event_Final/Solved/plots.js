// Create an array of each country's numbers
var us = Object.values(data['us']);
var uk = Object.values(data['uk']);
var canada = Object.values(data['canada']);

// Create an array of music provider labels
var labels = Object.keys(data['us']);

// Display the default plot
var data = [{
    labels: labels,
    values: us,
    type: "pie"
  }];

  var layout = {
    height: 600,
    width: 800
  };

  Plotly.newPlot("pie", data, layout);

// On change to the DOM, call getData()
var dropdownMenu = d3.select("#selDataset");
dropdownMenu.on("change", updateData);

// Function called by DOM changes
function updateData() {

  // Assign the value of the dropdown menu option to a variable
  var dataset = dropdownMenu.property("value");
  
  // Initialize an empty array for the country's data
  var values = [];
  
    if (dataset == 'us') {
      values = us;
    }
    else if (dataset == 'uk') {
      values = uk;
    }
    else if (dataset == 'canada') {
      values = canada;
    }
  

  /* SWITCH CASE EXAMPLE
    switch(dataset) {
      case 'us':
        values = us;
        break;
      case 'uk':
        values = uk;
        break;
      case 'canada':
        values = canada;
        break;
    }
  */
  
  Plotly.restyle("pie", "values", [values]);
}