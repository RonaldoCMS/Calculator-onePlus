import 'dart:convert';

import 'package:calculator_bloc/app/exception/ExpressionException.dart';
import 'package:function_tree/function_tree.dart';

class Expression {
  String expView;
  String expCal;
  num total;
  Expression({
    required this.expView,
    required this.expCal,
    required this.total,
  });

  Expression.empty({
    required String message,
  })  : expView = message,
        expCal = "",
        total = 0;

  void generatTotal() {
    num valueCalculated = expCal.interpret();
    if (valueCalculated == double.infinity) {
      throw const ExpressionNotValid(message: "Valore diviso in 0");
    } else {
      total = valueCalculated;
    }
  }

  Expression copyWith({
    String? expressionView,
    String? expression,
    num? total,
  }) {
    return Expression(
      expView: expressionView ?? this.expView,
      expCal: expression ?? this.expCal,
      total: total ?? this.total,
    );
  }


  @override
  String toString() =>
      'Expression(expressionView: $expView, expression: $expCal, total: $total)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Expression &&
        other.expView == expView &&
        other.expCal == expCal &&
        other.total == total;
  }

  @override
  int get hashCode =>
      expView.hashCode ^ expCal.hashCode ^ total.hashCode;
}
