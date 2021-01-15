
var data = [{
  values: [16, 15, 12, 6, 5, 4, 42],
  labels: ['US', 'China', 'European Union', 'Russian Federation', 'Brazil', 'India', 'Rest of World' ],
  domain: {column: 0},
  name: 'GHG Emissions',
  hoverinfo: 'label+percent+name',
  hole: .4,
  type: 'pie'
},{
  values: [27, 11, 25, 8, 1, 3, 25],
  labels: ['US', 'China', 'European Union', 'Russian Federation', 'Brazil', 'India', 'Rest of World' ],
  text: 'CO2',
  textposition: 'inside',
  domain: {column: 1},
  name: 'CO2 Emissions',
  hoverinfo: 'label+percent+name',
  hole: .4,
  type: 'pie'
}];

var layout = {
  title: 'Global Emissions 1990-2011',
  annotations: [
    {
      font: {
        size: 20
      },
      showarrow: false,
      text: 'GHG',
      x: 0.17,
      y: 0.5
    },
    {
      font: {
        size: 20
      },
      showarrow: false,
      text: 'CO2',
      x: 0.82,
      y: 0.5
    }
  ],
  height: 400,
  width: 600,
  showlegend: false,
  grid: {rows: 1, columns: 2}
};

Plotly.newPlot('xtina', data, layout);

var trace1 = {
  x: [1, 2, 3, 4, 5],
  y: [1, 6, 3, 6, 1],
  mode: 'markers',
  type: 'scatter',
  name: 'Team A',
  text: ['A-1', 'A-2', 'A-3', 'A-4', 'A-5'],
  marker: { size: 12 }
};

var trace2 = {
  x: [1.5, 2.5, 3.5, 4.5, 5.5],
  y: [4, 1, 7, 1, 4],
  mode: 'markers',
  type: 'scatter',
  name: 'Team B',
  text: ['B-a', 'B-b', 'B-c', 'B-d', 'B-e'],
  marker: { size: 12 }
};

var data = [ trace1, trace2 ];

var layout = {
  xaxis: {
    range: [ 0.75, 5.25 ]
  },
  yaxis: {
    range: [0, 8]
  },
  title:'Data Labels Hover'
};

Plotly.newPlot('myDiv', data, layout);


// Part 1
var trace1 = {
  x: ["beer", "wine", "martini", "margarita",
    "ice tea", "rum & coke", "mai tai", "gin & tonic"],
  y: [22.7, 17.1, 9.9, 8.7, 7.2, 6.1, 6.0, 4.6],
  type: "bar"
};

var data = [trace1];

var layout = {
  title: "'Bar' Chart"
};

Plotly.newPlot("plot", data, layout);


// // Part 2 - Adding attributes
// var trace1 = {
//   x: ["beer", "wine", "martini", "margarita",
//       "ice tea", "rum & coke", "mai tai", "gin & tonic"],
//   y: [22.7, 17.1, 9.9, 8.7, 7.2, 6.1, 6.0, 4.6],
//   type: "bar"
// };

// var data = [trace1];

// var layout = {
//   title: "'Bar' Chart",
//   xaxis: { title: "Drinks"},
//   yaxis: { title: "% of Drinks Ordered"}
// };

// Plotly.newPlot("plot", data, layout);


// // Part 3 - Line Chart
// var trace1 = {
//   x: ["beer", "wine", "martini", "margarita",
//       "ice tea", "rum & coke", "mai tai", "gin & tonic"],
//   y: [22.7, 17.1, 9.9, 8.7, 7.2, 6.1, 6.0, 4.6],
//   type: "line"
// };

// var data = [trace1];

// var layout = {
//   title: "'Bar' Chart",
// };

// Plotly.newPlot("plot", data, layout);

// // Part 4 - Broken Pie Chart
// var trace1 = {
//   x: ["beer", "wine", "martini", "margarita",
//       "ice tea", "rum & coke", "mai tai", "gin & tonic"],
//   y: [22.7, 17.1, 9.9, 8.7, 7.2, 6.1, 6.0, 4.6],
//   type: "pie"
// };

// var data = [trace1];

// var layout = {
//   title: "'Bar' Chart",
// };

// Plotly.newPlot("plot", data, layout);


// // Part 5 - Working Pie Chart
// var trace1 = {
//   labels: ["beer", "wine", "martini", "margarita",
//       "ice tea", "rum & coke", "mai tai", "gin & tonic"],
//   values: [22.7, 17.1, 9.9, 8.7, 7.2, 6.1, 6.0, 4.6],
//   type: 'pie'
// };

// var data = [trace1];

// var layout = {
//   title: "'Bar' Chart",
// };

// Plotly.newPlot("plot", data, layout);

