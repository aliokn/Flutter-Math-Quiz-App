scoreHelper(int score) {
  var starRate;
  if (score < 10) {
    starRate = 0;
    return starRate.toDouble();
  }
  if (score <= 30 && score >= 10) {
    starRate = 1;
    return starRate.toDouble();
  }
  if (score > 30 && score < 70) {
    starRate = 2;
    return starRate.toDouble();
  }
  if (score >= 70) {
    starRate = 3;
    return starRate.toDouble();
  }
}
