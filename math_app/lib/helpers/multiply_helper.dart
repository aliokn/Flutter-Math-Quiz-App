import 'dart:math';

class Choice {
  int? value;
  bool? answer;

  Choice({this.value, this.answer});
}

multiplyHelper(int a, int b) {
  var choice = new Choice();
  choice.value = a * b;
  choice.answer = true;
  return choice;
}

multiplyHelperA(int a, int b) {
  var random = new Random();
  var choice = new Choice();
  int randomNumber = random.nextInt(6) + 1;
  choice.value = (a * b) + randomNumber;
  choice.answer = false;
  return choice;
}

multiplyHelperB(int a, int b) {
  var random = new Random();
  var choice = new Choice();
  int randomNumber = random.nextInt(5) + 1;
  choice.value = (a * b) - randomNumber;
  choice.answer = false;
  return choice;
}

multiplyHelperC(int a, int b) {
  var random = new Random();
  var choice = new Choice();
  int randomNumber = random.nextInt(3) + 1;
  choice.value = a * (b + randomNumber);
  choice.answer = false;
  return choice;
}
