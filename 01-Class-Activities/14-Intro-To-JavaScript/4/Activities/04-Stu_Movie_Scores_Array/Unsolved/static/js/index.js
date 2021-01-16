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
  
  console.log('--- DEBUG CODE ---');

  movieScore = movieScores[i];
  sum += movieScore;

  console.log(`The value of i is: ${i}`);
  console.log(`The value of numMovies is : ${numMovies}`);
  console.log(`The value of i is movieScore: ${movieScore}`);
  console.log(`The value of sum is: ${sum}`);

  if (movieScore >= 7) {
    console.log(`${movieScore} is greater than 7`);
    goodMovieScores.push(movieScore);
  }
  else if (movieScore >= 5 && movieScore < 7){
    console.log(`${movieScore} is between 5 and 7`);
    okMovieScores.push(movieScore);
  }
  else {
    console.log(`${movieScore} is less than 5`);
    badMovieScores.push(movieScore);
  }

  console.log(`Good movies: ${goodMovieScores}`);
  console.log(`OK movies: ${okMovieScores}`);
  console.log(`Bad movies: ${badMovieScores}`);

  console.log('---');
}

avgRating = sum/numMovies;

console.log('GOOD LIST');
console.log(goodMovieScores);

console.log('OK LIST')
console.log(okMovieScores);

console.log('BAD MOVIES');
console.log(badMovieScores);

console.log(`Average rating is ${avgRating}`);