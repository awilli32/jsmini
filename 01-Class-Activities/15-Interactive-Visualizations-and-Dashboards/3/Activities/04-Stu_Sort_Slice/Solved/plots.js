// Sort the data by Greek search results
var sortedByGreekSearch = data.sort((a, b) => b['greekSearchResults'] - a['greekSearchResults']);

// Slice the first 10 objects for plotting
slicedData = sortedByGreekSearch.slice(0, 10);

// Reverse the array to accommodate Plotly's defaults
reversedData = slicedData.reverse();

// Trace1 for the Greek Data
var trace1 = {
  x: reversedData.map(object => object.greekSearchResults),
  y: reversedData.map(object => object.greekName),
  text: reversedData.map(object => object.greekName),
  name: "Greek",
  type: "bar",
  orientation: 'h'
};

// data
var data = [trace1];

// Apply the group bar mode to the layout
var layout = {
  title: "Greek gods search results",
  xaxis: {title: '# of Search Results'},
  yaxis: {title: 'Greek God Name'}
};

// Render the plot to the div tag with id "plot"
Plotly.newPlot("plot", data, layout);
