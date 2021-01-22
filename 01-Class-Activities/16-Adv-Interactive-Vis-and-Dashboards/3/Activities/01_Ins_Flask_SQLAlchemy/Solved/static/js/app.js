d3.json('/api/data').then(data => {

    data.forEach(pets => {
        var tbody = d3.select('#pets-tbody');

        row = tbody.append('tr');

        Object.values(pets).forEach(col => {
            row.append('td').text(col);
        }); 
    });
});