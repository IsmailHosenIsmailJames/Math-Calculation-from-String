import 'dart:math';

const List list_of_opr = ['+', '-', '/', '*'];
void main() {
  String inputStr = 'tan45*(45+1)+(34)';
  inputStr = inputStr.replaceAll(" ", "");
  try {
    calculate(inputStr);
  } catch (e) {
    print(e);
  }
}

String calculate(String inputStr) {
  for (int i = 0; i < 100; i++) {
    String withoutB = '';
    int lastRange = 0;
    if (inputStr.lastIndexOf(r'(') != -1) {
      int idex = inputStr.lastIndexOf(r'(') + 1;
      for (int i = idex; i < inputStr.length; i++) {
        lastRange = i;
        if (inputStr[i] == r')') {
          break;
        }
        withoutB = withoutB + inputStr[i];
      }
      for (int j = 0; j < 100; j++) {
        withoutB = withoutBraket(withoutB);
        if (double.tryParse(withoutB) != null) {
          break;
        }
      }
      inputStr = inputStr.replaceRange(idex - 1, lastRange + 1, withoutB);
    }

    if (inputStr.indexOf(r'(') == -1) {
      break;
    }
  }
  for (int j = 0; j < 100; j++) {
    inputStr = withoutBraket(inputStr);
    if (double.tryParse(inputStr) != null) {
      break;
    }
  }

  print(inputStr);
  //sparate braket
  return inputStr;
}

String withoutBraket(String withoutB) {
  if (withoutB.indexOf(r'atan') != -1) {
    int idex = withoutB.indexOf(r'atan');
    String num2 = last(withoutB, idex + 3);
    String ans = (180 * atan(double.parse(num2)) / pi).toString();
    withoutB = withoutB.replaceRange(idex, idex + num2.length + 4, ans);
  }
  if (withoutB.indexOf(r'asin') != -1) {
    int idex = withoutB.indexOf(r'asin');
    String num2 = last(withoutB, idex + 3);
    String ans = (180 * asin(double.parse(num2)) / pi).toString();
    withoutB = withoutB.replaceRange(idex, idex + num2.length + 4, ans);
  }
  if (withoutB.indexOf(r'acos') != -1) {
    int idex = withoutB.indexOf(r'atan');
    String num2 = last(withoutB, idex + 3);
    String ans = (180 * acos(double.parse(num2)) / pi).toString();
    withoutB = withoutB.replaceRange(idex, idex + num2.length + 4, ans);
  }
  if (withoutB.indexOf(r'tan') != -1) {
    int idex = withoutB.indexOf(r'tan');
    String num2 = last(withoutB, idex + 2);
    String ans = (tan(double.parse(num2) / 180 * pi)).toString();
    withoutB = withoutB.replaceRange(idex, idex + num2.length + 3, ans);
  }
  if (withoutB.indexOf(r'sin') != -1) {
    int idex = withoutB.indexOf(r'sin');
    String num2 = last(withoutB, idex + 2);
    String ans = (sin(double.parse(num2) / 180 * pi)).toString();
    withoutB = withoutB.replaceRange(idex, idex + num2.length + 3, ans);
  }
  if (withoutB.indexOf(r'cos') != -1) {
    int idex = withoutB.indexOf(r'cos');
    String num2 = last(withoutB, idex + 2);
    String ans = (cos(double.parse(num2) / 180 * pi)).toString();
    withoutB = withoutB.replaceRange(idex, idex + num2.length + 3, ans);
  }
  if (withoutB.indexOf(r'fact') != -1) {
    int idex = withoutB.indexOf(r'fact');
    String num2 = last(withoutB, idex + 3);
    double fact = 1;
    for (int i = 1; i < double.parse(num2); i++) {
      fact = fact * i;
    }

    withoutB =
        withoutB.replaceRange(idex, idex + num2.length + 4, fact.toString());
  }

  if (withoutB.indexOf(r'pow') != -1) {
    int idex = withoutB.indexOf(r'pow');
    String num1 = first(withoutB, idex);
    String num2 = last(withoutB, idex + 2);
    String ans = pow(double.parse(num1), double.parse(num2)).toString();
    withoutB =
        withoutB.replaceRange(idex - num1.length, idex + num2.length + 3, ans);
  }
  if (withoutB.indexOf(r'root') != -1) {
    int idex = withoutB.indexOf(r'root');
    String num1 = first(withoutB, idex);
    String num2 = last(withoutB, idex + 3);
    String ans = pow(double.parse(num1), 1 / double.parse(num2)).toString();
    withoutB =
        withoutB.replaceRange(idex - num1.length, idex + num2.length + 4, ans);
  }

  if (withoutB.indexOf(r'/') != -1) {
    int idex = withoutB.indexOf(r'/');
    String num1 = first(withoutB, idex);
    String num2 = last(withoutB, idex);
    String ans = (double.parse(num1) / double.parse(num2)).toString();
    withoutB =
        withoutB.replaceRange(idex - num1.length, idex + num2.length + 1, ans);
  }
  if (withoutB.indexOf(r'*') != -1) {
    int idex = withoutB.indexOf(r'*');
    String num1 = first(withoutB, idex);
    String num2 = last(withoutB, idex);
    String ans = (double.parse(num1) * double.parse(num2)).toString();
    withoutB =
        withoutB.replaceRange(idex - num1.length, idex + num2.length + 1, ans);
  }
  if (withoutB.indexOf(r'+') != -1) {
    int idex = withoutB.indexOf(r'+');
    String num1 = first(withoutB, idex);
    String num2 = last(withoutB, idex);
    String ans = (double.parse(num1) + double.parse(num2)).toString();
    withoutB =
        withoutB.replaceRange(idex - num1.length, idex + num2.length + 1, ans);
  }
  if (withoutB.indexOf(r'-') != -1) {
    int idex = withoutB.indexOf(r'-');
    String num1 = first(withoutB, idex);
    String num2 = last(withoutB, idex);
    String ans = (double.parse(num1) - double.parse(num2)).toString();
    withoutB =
        withoutB.replaceRange(idex - num1.length, idex + num2.length + 1, ans);
  }

  return withoutB;
}
// Get frist and last number of opration

String first(String str, int pos) {
  String number = '';
  for (int i = pos - 1; i >= 0; i--) {
    if (list_of_opr.indexOf(str[i]) != -1) {
      break;
    }
    number = str[i] + number;
  }
  return number;
}

String last(String str, int pos) {
  String number = '';
  for (int i = pos + 1; i < str.length; i++) {
    if (list_of_opr.indexOf(str[i]) != -1) {
      break;
    }
    number = number + str[i];
  }

  return number;
}
