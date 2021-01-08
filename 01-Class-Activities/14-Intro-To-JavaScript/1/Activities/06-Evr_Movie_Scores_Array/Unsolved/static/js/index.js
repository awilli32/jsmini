// Array of movie ratings
var movieScores = [
  4.4,
  3.3,
  5.9,
  8.8,
  1.2,
  5.2,
  7.4,
  7.5,
  7.2,
  9.7,
  4.2,
  6.9
];

// Starting a rating count
var sum = 0;
var numMovies = movieScores.length;

// Arrays to hold movie scores
var goodMovieScores = [];
var okMovieScores = [];
var badMovieScores = [];

for (var i = 0; i < numMovies; i++) {
  
  movieScore = movieScores[i];
  sum += movieScore;

  if(movieScore > 7) {
    goodMovieScores.push(movieScore);
  }
  else if (movieScore >= 5 && movieScore < 7){
    okMovieScores.push(movieScore);
  }
  else {
    badMovieScores.push(movieScore);
  }

}

avgRating = sum/numMovies;

console.log('GOOD LIST');
console.log(goodMovieScores);

console.log('OK LIST')
console.log(okMovieScores);

console.log('BAD MOVIES');
console.log(badMovieScores);

console.log(`Average rating is ${avgRating}`);