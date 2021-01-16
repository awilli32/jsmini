// from data.js
var tableData = data;
console.log(data);

// Identify the table and tbody
var tbody = d3.select('#ufo-table>tbody');

// Create function to generate and populate the table
function buildTable(tableData){
    // Dynamically build table
    tableData.forEach(record => {
        var row = tbody.append('tr');

        /*
            row.append('td').text(record['datetime']);
            row.append('td').text(record['city']);
            row.append('td').text(record['state']);
            row.append('td').text(record['country']);
            row.append('td').text(record['shape']);
            row.append('td').text(record['durationMinutes']);
            row.append('td').text(record['comments']);
        */

        Object.values(record).forEach(col => {
            row.append('td').text(col);        
        });
    })
}

function filterTable(elem){
    console.log('filter table event');
        
    //var changedElem = d3.event.target;
    var dateElem = d3.select('#datetime');   
    var filterDate = dateElem.property('value'); //DART! Look into this
    
    filteredData = tableData.filter(rec => rec['datetime'] == filterDate);

    console.log(filteredData);

    // Clear out the tbody
    tbody.html('');

    // Rebuild the filtered table using the buildTable function 
    buildTable(filteredData);
}

// Identify web elements on the page
btn = d3.select('#filter-btn');
datetimefield = d3.select('#datetime')

// Add event listeners to the web elements
btn.on('click', filterTable);
datetimefield.on('change', filterTable);

// Call the function to initially load the table
buildTable(tableData);