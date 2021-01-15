var eyeColor = ["Brown", "Green", "Blue"];
var eyeFlicker = [26.8, 37.9, 13.7];

// Create the Trace
var trace1 = {
  x: eyeColor,
  y: eyeFlicker,
  type: "bar",
  marker: {color: ['rgb(87, 48, 3)','green','blue']}
};

// Create the data array for the plot
var data = [trace1];

// Define the plot layout
var layout = {
  title: "Eye Color vs Flicker",
  xaxis: { title: "Eye Color" },
  yaxis: { title: "Flicker Frequency" }
};

// Plot the chart to a div tag with id "bar-plot"
Plotly.newPlot("bar-plot", data, layout);
