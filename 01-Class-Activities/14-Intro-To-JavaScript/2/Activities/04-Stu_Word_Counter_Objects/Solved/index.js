function wordCount(myString) {

  //myString = "I yam what I yam and always will be what I yam"

  // Convert string to an array of words
  var stringArray = myString.split(" ");

  // stringArray = ['I','yam','what','I','yam','and',...]
  
  // An object to hold word frequency
  var wordFrequency = {};

  // Iterate through the array

  // USING TRADITIONAL FOR LOOP
  for (var i = 0; i < stringArray.length; i++) {
    var currentWord = stringArray[i];
    // If the word has been seen before...
    if (currentWord in wordFrequency) {
      // Add one to the counter
      wordFrequency[currentWord] += 1;
      // wordFrequency["I"]
    }
    else {
      // Set the counter at 1
      wordFrequency[currentWord] = 1;
    }
  }

  // USING FOREACH
  /*
  stringArray.forEach(function(currentWord){
        // If the word has been seen before...
        if (currentWord in wordFrequency) {
          // Add one to the counter
          wordFrequency[currentWord] += 1;
          // wordFrequency["I"]
        }
        else {
          // Set the counter at 1
          wordFrequency[currentWord] = 1;
        }
  });
  */

  console.log(wordFrequency);
  return wordFrequency;
}
wordCount("I yam what I yam and always will be what I yam");
wordCount("Valerie plays the violin and also plays the guitar and Valerie is also versatile with music.")