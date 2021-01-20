var apiKey = "CBivvBn54csU-rbfu-KG";
var tickerSymbol = 'FB';
var startDate = '2016-10-01';
var endDate = '2017-10-01';

/* global Plotly */
var url =
  `https://www.quandl.com/api/v3/datasets/WIKI/${tickerSymbol}.json?start_date=${startDate}&end_date=${endDate}&api_key=${apiKey}`;

// console.log(url);

/**
 * Helper function to select stock data
 * Returns an array of values
 * index 0 - Date
 * index 1 - Open
 * index 2 - High
 * index 3 - Low
 * index 4 - Close
 * index 5 - Volume
 * index 11 - Adj. Close
 */

/**
 * Fetch data and build the timeseries plot
 */
d3.json(url).then(function(stocksData) {
    data = stocksData['dataset']['data'];

    dates = data.map(d => d[0]);
    adjClosingPrices = data.map(d => d[11]);
    
    // console.log(dates);
    // console.log(adjClosingPrices);

    var trace1 = {
      x: dates,
      y: adjClosingPrices,
      type: 'line'
    };

    var layout = {
      title: `${tickerSymbol} closing prices`,
      xaxis: {
        title: 'Date'
      },
      yaxis: {
        title: 'Adjusted Closing Price'
      }
    };
    
    var traceData = [trace1];
    
    Plotly.newPlot('plot', traceData);

  });