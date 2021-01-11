var apiKey = "wJwp9NFb-QWNy3d1f9_w";
var startDate = '2017-10-01'
var endDate = '2018-04-01'
var stockSymbol = 'AMZN'

/* Quandl endpoint */
var url =
  `https://www.quandl.com/api/v3/datasets/WIKI/${stockSymbol}.json?start_date=${startDate}&end_date=${endDate}&api_key=${apiKey}`;

/**
 * Helper reference to select stock data
 * Returns an array of values
 *  index 0 - Date
 *  index 1 - Open
 *  index 2 - High
 *  index 3 - Low
 *  index 4 - Close
 *  index 5 - Volume
 */
function unpack(rows, index) {
  return rows.map(function(row) {
    return row[index];
  });
}

function buildPlot() {
  d3.json(url).then(function(data) {

    // Grab values from the data json object to build the plots

    console.log('Previewing the data JSON');
    console.log(data);
    console.log('- - -');

    var dataset = data['dataset'];

    console.log('Previewing the dataset JSON');
    console.log(dataset);
    console.log('- - -');

    var name = dataset['name'];
    var stock = dataset['dataset_code'];
    var startDate = dataset['start_date'];
    var endDate = dataset['end_date'];

    var dates = dataset['data'].map(d => d[0]);
    var closingPrices = dataset['data'].map(d => d[4]);

    var trace1 = {
      type: "scatter",
      mode: "lines",
      name: name,
      x: dates,
      y: closingPrices,
      line: {
        color: "#17BECF"
      }
    };

    var data = [trace1];

    var layout = {
      title: `${stock} closing prices`,
      xaxis: {
        range: [startDate, endDate],
        type: "date"
      },
      yaxis: {
        autorange: true,
        type: "linear"
      }
    };

    Plotly.newPlot("plot", data, layout);

  });
}

buildPlot();