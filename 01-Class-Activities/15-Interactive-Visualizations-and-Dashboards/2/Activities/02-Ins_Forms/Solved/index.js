// Select the button
var button = d3.select("#button");

// Create event handlers for clicking the button or pressing the enter key
button.on("click", runEnter);

// Create the function to run for both events
function runEnter() {

  // Select the input element and get the raw HTML node
  var inputElement = d3.select("#example-form-input");

  // Get the value property of the input element
  var inputValue = inputElement.property("value");

  // Print the value to the console
  console.log(inputValue);

  // Set the span tag in the h1 element to the text
  // that was entered in the form
  d3.select("#outputText").text(inputValue);
}