import 'dart:math';

class Choice {
  int? value;
  bool? answer;

  Choice({this.value, this.answer});
}

divHelper(int a, int b) {
  var choice = new Choice();
  choice.value = (a / b).round();
  choice.answer = true;
  return choice;
}

divHelperA(int a, int b) {
  var choice = new Choice();
  var random = new Random();
  int randomNumber = random.nextInt(6) + 1;
  choice.value = (a / b).round() + randomNumber;
  choice.answer = false;
  return choice;
}

divHelperB(int a, int b) {
  var choice = new Choice();
  var random = new Random();
  int randomNumber = random.nextInt(3) + 1;
  choice.value = (a / b).round() - randomNumber;
  choice.answer = false;
  return choice;
}

divHelperC(int a, int b) {
  var choice = new Choice();
  var random = new Random();
  int randomNumber = random.nextInt(5) + 1;
  choice.value = ((a + randomNumber) / b).round() + randomNumber;
  choice.answer = false;
  return choice;
}
