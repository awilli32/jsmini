// An array of cities and their locations
var cities1 = [
  {
    name: "Paris",
    location: [48.8566, 2.3522]
  },
  {
    name: "Lyon",
    location: [45.7640, 4.8357]
  },
];

var cities2 = [
  {
    name: "Cannes",
    location: [43.5528, 7.0174]
  },
  {
    name: "Nantes",
    location: [47.2184, -1.5536]
  }
]

// An array which will be used to store created cityMarkers
var cityMarkers = [];
var cityMarkers2 = [];

cities1.forEach(city => {
  cityMarkers.push(
    L.marker(city['location']).bindPopup("<h1>" + city['name'] + "</h1>")
  );
});

cities2.forEach(city => {
  cityMarkers2.push(
    L.marker(city['location']).bindPopup("<h1>" + city['name'] + "</h1>")
  );
});

// Add all the cityMarkers to a new layer group.
// Now we can handle them as one group instead of referencing each individually
var cityLayer1 = L.layerGroup(cityMarkers);
var cityLayer2 = L.layerGroup(cityMarkers2);

// Define variables for our tile layers
var light = L.tileLayer("https://api.mapbox.com/styles/v1/mapbox/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}", {
  attribution: "Map data &copy; <a href=\"https://www.openstreetmap.org/\">OpenStreetMap</a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA</a>, Imagery © <a href=\"https://www.mapbox.com/\">Mapbox</a>",
  maxZoom: 18,
  id: "light-v10",
  accessToken: API_KEY
});

var dark = L.tileLayer("https://api.mapbox.com/styles/v1/mapbox/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}", {
  attribution: "Map data &copy; <a href=\"https://www.openstreetmap.org/\">OpenStreetMap</a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA</a>, Imagery © <a href=\"https://www.mapbox.com/\">Mapbox</a>",
  maxZoom: 18,
  id: "dark-v10",
  accessToken: API_KEY
});

// Only one base layer can be shown at a time
var baseMaps = {
  'Light base map': light,
  'Dark base map': dark
};

// Overlays that may be toggled on or off
var overlayMaps = {
  'Cities 1': cityLayer1,
  'Cities 2': cityLayer2
};

// Create map object and set default layers
var myMap = L.map("map", {
  center: [46.2276, 2.2137],
  zoom: 6,
  layers: [light, cityLayer1]
});

// Pass our map layers into our layer control
// Add the layer control to the map
L.control.layers(baseMaps, overlayMaps).addTo(myMap);
