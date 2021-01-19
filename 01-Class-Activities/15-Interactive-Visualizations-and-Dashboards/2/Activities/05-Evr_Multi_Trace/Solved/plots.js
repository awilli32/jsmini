// Trace1 for the Greek Data
var trace1 = {
  x: data.map(row => row.greekSearchResults),
  y: data.map(row => row.pair),
  text: data.map(row => row.greekName),
  orientation: 'h',
  name: "Greek",
  type: "bar"
};

// Trace 2 for the Roman Data
var trace2 = {
  x: data.map(row => row.romanSearchResults),
  y: data.map(row => row.pair),
  text: data.map(row => row.romanName),
  orientation: 'h',
  name: "Roman",
  type: "bar"
};

// Combining both traces
var traceData = [trace1, trace2];

// Apply the group barmode to the layout
var layout = {
  xaxis: {
    automargin: true,
    autosize: true
  },
  yaxis: {
    automargin: true,
    autosize: true
  },
  title: "Greek vs Roman gods search results",
  barmode: "group",
  autosize: true,
  height:	trace1.y.length*48
};

var config = {responsive: true}

console.log()

// Render the plot to the div tag with id "plot"
Plotly.newPlot("plot", traceData, layout, config);

function restyle(){
  console.log('test');
  Plotly.update("plot", traceData, layout);
}

d3.select('#plot').on('resize', restyle())