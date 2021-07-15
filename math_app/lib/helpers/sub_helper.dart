import 'dart:math';

class Choice {
  int? value;
  bool? answer;

  Choice({this.value, this.answer});
}

subHelper(int a, int b) {
  var choice = new Choice();
  choice.value = a - b;
  choice.answer = true;
  return choice;
}

subHelperARandomHelper(int a, int b) {
  var random = new Random();
  var choice = new Choice();
  int randomNumber = random.nextInt(4) + 1;
  choice.value = a - b + randomNumber;
  choice.answer = false;
  return choice;
}

subHelperBRandomHelper(int a, int b) {
  var random = new Random();
  var choice = new Choice();
  int randomNumber = random.nextInt(3) + 1;
  choice.value = a - b + randomNumber;
  choice.answer = false;
  return choice;
}

subHelperCRandomHelper(int a, int b) {
  Random random = new Random();
  int c = ((a + b) / 3).round();
  int randomNumber = random.nextInt(7) + 1;
  var choice = new Choice();
  int sub = (c - randomNumber).abs();
  if (sub == a - b) sub = sub + 2;
  choice.value = sub;
  choice.answer = false;
  return choice;
}
