import 'package:math_app/helpers/multiply_helper.dart';
import 'package:math_app/helpers/sub_helper.dart';
import 'package:math_app/helpers/sum_helper.dart';

import 'div_helper.dart';

class Methods {
  static String sum = "sum";
  static String sub = "sub";
  static String multiply = "multiply";
  static String divide = "divide";
  static String mixed = "mixed";
  static String sumSymbol = "+";
  static String subSymbol = "-";
  static String divSymbol = "/";
  static String multiplySymbol = "*";
}

class MixedGenerator {
  var GeneratedNumbers;
  var GeneratedAnswers;
  String? method;
  String? symbol;
}

MixedList(int gradeLevel) {
  List MixedList = [];
  var MixSum = new MixedGenerator();
  var MixSub = new MixedGenerator();
  var MixDiv = new MixedGenerator();
  var MixMultiply = new MixedGenerator();
  MixSum.GeneratedNumbers = RandomSumIntGenerator(gradeLevel);
  MixSum.GeneratedAnswers = RandomSumAnswerGenerator(
      MixSum.GeneratedNumbers[0], MixSum.GeneratedNumbers[1]);
  MixSum.method = Methods.sum;
  MixSum.symbol = Methods.sumSymbol;
  MixedList.add(MixSum);
  MixSub.GeneratedNumbers = RandomSubIntGenerator(gradeLevel);
  MixSub.GeneratedAnswers = RandomSubAnswerGenerator(
      MixSub.GeneratedNumbers[0], MixSub.GeneratedNumbers[1]);
  MixSub.method = Methods.sub;
  MixSub.symbol = Methods.subSymbol;
  MixedList.add(MixSub);
  MixDiv.GeneratedNumbers = RandomDivIntGenerator(gradeLevel);
  MixDiv.GeneratedAnswers = RandomDivAnswerGenerator(
      MixDiv.GeneratedNumbers[0], MixDiv.GeneratedNumbers[1]);
  MixDiv.method = Methods.divide;
  MixDiv.symbol = Methods.divSymbol;
  MixedList.add(MixDiv);
  MixMultiply.GeneratedNumbers = RandomMultiplyIntGenerator(gradeLevel);
  MixMultiply.GeneratedAnswers = RandomMultiplyAnswerGenerator(
      MixMultiply.GeneratedNumbers[0], MixMultiply.GeneratedNumbers[1]);
  MixMultiply.method = Methods.multiply;
  MixMultiply.symbol = Methods.multiplySymbol;
  MixedList.add(MixMultiply);
  MixedList.shuffle();
  return MixedList;
}

RandomSumIntGenerator(int gradeLevel) {
  List<int> Numbers = [];
  var list = new List<int>.generate(10 * gradeLevel, (int index) => index);
  while (true) {
    list.shuffle();
    Numbers.add(list[0]);
    Numbers.add(list[1]);
    if (!Numbers.contains(0)) {
      break;
    } else {
      Numbers = [];
    }
  }
  return Numbers;
}

RandomSubIntGenerator(int gradeLevel) {
  List<int> Numbers = [];
  var list = new List<int>.generate(10 * gradeLevel, (int index) => index);
  while (true) {
    list.shuffle();
    int firstValue = list[0];
    int secondValue = list[1];

    if (!Numbers.contains(0)) {
      if (firstValue < secondValue) {
        Numbers.add(secondValue);
        Numbers.add(firstValue);
      } else {
        Numbers.add(firstValue);
        Numbers.add(secondValue);
      }
      break;
    } else {
      Numbers = [];
    }
  }
  return Numbers;
}

RandomDivIntGenerator(int gradeLevel) {
  List<int> Numbers = [];
  var list = new List<int>.generate(10 * gradeLevel, (int index) => index);
  while (true) {
    list.shuffle();
    if (list[0] == 0 || list[1] == 0) {
      list.shuffle();
    } else {
      int firstValue = list[0];
      int secondValue = list[1];
      if (secondValue % firstValue == 0) {
        Numbers.add(secondValue);
        Numbers.add(firstValue);
        break;
      }
      if (firstValue > secondValue && (firstValue % secondValue == 0)) {
        Numbers.add(firstValue);
        Numbers.add(secondValue);
        break;
      }
    }
  }
  return Numbers;
}

RandomMultiplyIntGenerator(int gradeLevel) {
  List<int> Numbers = [];
  var list = new List<int>.generate(10 * gradeLevel, (int index) => index);
  while (true) {
    list.shuffle();
    if (list[0] == 0 || list[1] == 0) {
      list.shuffle();
    } else {
      Numbers.add(list[0]);
      Numbers.add(list[1]);
      break;
    }
  }
  return Numbers;
}

RandomSumAnswerGenerator(int a, int b) {
  List Answers = [];
  Answers.add(firstGradeHelper(a, b));
  Answers.add(firstGradeARandomHelper(a, b));
  Answers.add(firstGradeBRandomHelper(a, b));
  Answers.add(firstGradeCRandomHelper(a, b));
  if (Answers[1].value == Answers[2].value) {
    Answers[1].value = Answers[1].value! + 1;
  } else if (Answers[1].value == Answers[3].value) {
    Answers[1].value = Answers[1].value! + 1;
  } else if (Answers[2].value == Answers[3].value) {
    Answers[3].value = Answers[3].value! + 1;
  }
  Answers.shuffle();
  return Answers;
}

RandomSubAnswerGenerator(int a, int b) {
  List Answers = [];
  Answers.add(subHelper(a, b));
  Answers.add(subHelperARandomHelper(a, b));
  Answers.add(subHelperBRandomHelper(a, b));
  Answers.add(subHelperCRandomHelper(a, b));
  if (Answers[1].value == Answers[2].value) {
    Answers[1].value = Answers[1].value! + 1;
  } else if (Answers[1].value == Answers[3].value) {
    Answers[1].value = Answers[1].value! + 1;
  } else if (Answers[2].value == Answers[3].value) {
    Answers[3].value = Answers[3].value! + 1;
  }
  Answers.shuffle();
  return Answers;
}

RandomDivAnswerGenerator(int a, int b) {
  List Answers = [];
  Answers.add(divHelper(a, b));
  Answers.add(divHelperA(a, b));
  Answers.add(divHelperB(a, b));
  Answers.add(divHelperC(a, b));
  if (Answers[1].value == Answers[2].value) {
    Answers[1].value = Answers[1].value! + 1;
  } else if (Answers[1].value == Answers[3].value) {
    Answers[1].value = Answers[1].value! + 1;
  } else if (Answers[2].value == Answers[3].value) {
    Answers[3].value = Answers[3].value! + 1;
  }
  Answers.shuffle();
  return Answers;
}

RandomMultiplyAnswerGenerator(int a, int b) {
  List Answers = [];
  Answers.add(multiplyHelper(a, b));
  Answers.add(multiplyHelperA(a, b));
  Answers.add(multiplyHelperB(a, b));
  Answers.add(multiplyHelperC(a, b));
  if (Answers[1].value == Answers[2].value) {
    Answers[1].value = Answers[1].value! + 1;
  } else if (Answers[1].value == Answers[3].value) {
    Answers[1].value = Answers[1].value! + 1;
  } else if (Answers[2].value == Answers[3].value) {
    Answers[3].value = Answers[3].value! + 1;
  }
  Answers.shuffle();
  return Answers;
}
