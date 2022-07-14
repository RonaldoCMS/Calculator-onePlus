import 'dart:developer';

import 'package:calculator_bloc/app/exception/ExpressionException.dart';
import 'package:calculator_bloc/app/model/expression.dart';

class CalculatorService {
  Expression expression;

  CalculatorService({required this.expression});

  CalculatorService.empty()
      : expression = Expression(expView: "", expCal: "", total: 0);

  void addValue(String value) {
    switch (value) {
      case "1":
      case "2":
      case "3":
      case "4":
      case "5":
      case "6":
      case "7":
      case "8":
      case "9":
      case "0":
        _addNumber(value);
        break;

      case "x":
        _addOperator("x", "*");
        break;

      case "+":
        _addOperator("+", "+", firstValid: true);
        break;

      case "-":
        _addOperator("-", "-", firstValid: true);
        break;

      case "=":
        _result();
        break;

      case "%":
        percent();
        break;

      case ",":
        addComma();
        break;

      case "div":
        _addOperator("/", "/");
        break;

      case "back":
        _backValue();
        break;

      case "AC":
        _clean();
        break;
      default:
        throw const ExpressionNotValid(message: "Character not valid");
    }
  }

  void _clean() {
    expression = Expression.empty(message: "Calculator");
  }

  void _addNumber(String value) {
    if (expression.expView == "Calculator") {
      expression.expView = "";
    }
    expression.expView += value;
    expression.expCal += value;
  }

  void _addOperator(String stringView, String stringValue,
      {bool firstValid = false}) {
    //if (expression.expCal.isEmpty && firstValid) {
    String view = expression.expView;
    //else if (view == "Calculator" && !firstValid) {}

    if (view.isNotEmpty || firstValid && view.isEmpty) {
      if (expression.expView == "Calculator") {
        if (firstValid) {
          expression.expView = "";
        } else {
          return;
        }
      }
      String lastChar = view.substring(view.length - 1);
      if (int.tryParse(lastChar) == null) {
        //TO-DO
        return;
      }
      expression.expView += stringView;
      expression.expCal += stringValue;
    } else {
      expression.expCal = "Calculator";
    }
    //}
  }

  void _result() {
    try {
      expression.generatTotal();
      expression.expView = expression.total.toString();
      expression.expCal = expression.total.toString();
    } on ExpressionNotValid {
      //TO-DO
      log("Exception");
    } on RangeError {
      //TO-DO
      log("rangeError");
    }
  }

  void _backValue() {
    if (expression.expCal.isEmpty) {
      expression.expCal = "Calculator";
    } else {
      expression.expView =
          expression.expView.substring(0, expression.expView.length - 1);
      expression.expCal =
          expression.expCal.substring(0, expression.expView.length - 1);
      if (expression.expCal.isEmpty) _backValue();
    }
  }

  void percent() {
    log(expression.expView);
    double result = double.parse(expression.expView) / 100;
    expression.expView = result.toString();
    expression.expCal = result.toString();
    // (expression.expView as double) / 100;
  }

  void addComma() {
    // TO-DO
    /*RegExp regex = RegExp(r"/([+, \-, \/, *])");
    Iterator<RegExpMatch> it =
        regex.allMatches(expression.expCal).iterator;
    while (it.moveNext()) {
      RegExpMatch match = it.current;
      log("${match.input}\n");
    } */
  }
}
