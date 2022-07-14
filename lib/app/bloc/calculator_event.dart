part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class CalculatorAddValue extends CalculatorEvent {
  final String text;
  CalculatorAddValue({required this.text});
}

class CalculatorResultValue extends CalculatorEvent {}

class CalculatorCancValue extends CalculatorEvent {}
