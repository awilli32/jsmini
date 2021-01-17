// from data.js
var tableData = data;

// Identify the table and tbody
//var tbody = d3.select('#ufo-tbody');

// Create function to generate and populate the table
function buildTable(tableData){

    // Dynamically build table
    tableData.forEach(record => {
        var row = tbody.append('tr');

            row.append('td').text(record['datetime']);
            // what else?
    })
}

function filterTable(){
    // Create a copy of tableData specifically for filtering
    var filteredData = tableData;

    // capture value for all search fields */
    var datetime = d3.select('#datetime').property('value');
    // what else?

    // Build an object of fields to run through 
    var filterFields = {
        // think about how we should populate this and why
    }

    // Remove empty keys from the list of filters to search
    Object.entries(filterFields).forEach(([key, val]) => {
        
        // Use !val to check for empty strings or nulls
        if(!val) { 
            delete filterFields[key];
        }
    });

    // Loop through each of the filter keys and return records from filteredData that match 
    Object.entries(filterFields).forEach(([key, value]) => {
        // Continue to refine the filteredData array 
        // filteredData = filteredData.filter(row => row[key] == value);
        // if the line above works, think about why!!
      });    

    // Clear out the tbody
    tbody.html('');

    // Rebuild the filtered table using the buildTable function 
    buildTable(filteredData);    
}

// Identify web elements on the page
btn = d3.select('#filter-btn');
btn.on('click', filterTable);
datetimefield.on('change', filterTable);

// Attach an event listener to the fields attached to the .filter class 
// your-code here

// Call the function to initially load the table and pass the tableData to that function
buildTable(tableData);