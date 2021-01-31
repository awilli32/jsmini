// Use D3 to select the dropdown menu
// Use D3 to create an event handler
dropdownMenu = d3.select("#selectOption");

console.log(dropdownMenu);

dropdownMenu.on("change", updatePage);

function updatePage() {

  console.log('in updatePage() function');

  // Assign the dropdown menu item ID to a variable
  var dropdownMenuID = dropdownMenu.node().id;
  // Assign the dropdown menu option to a variable
  var selectedOption = dropdownMenu.node().value;

  console.log(dropdownMenuID);
  console.log(selectedOption);
}
