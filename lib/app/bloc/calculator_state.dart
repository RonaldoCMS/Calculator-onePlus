part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorState {
  final Expression expression;
  const CalculatorState({required this.expression});
}

class CalculatorInitial extends CalculatorState {
  CalculatorInitial()
      : super(
          expression: Expression(expView: "Calculator", expCal: "", total: 0),
        );
}

class CalculatorUpdate extends CalculatorState {
  const CalculatorUpdate({required Expression expression})
      : super(expression: expression);
}

class CalculatorResult extends CalculatorState {
  const CalculatorResult({required Expression expression})
      : super(expression: expression);
}

class CalculatorFailed extends CalculatorState {
  CalculatorFailed({required String message})
      : super(
          expression: Expression(expView: message, expCal: "", total: 0),
        );
}
