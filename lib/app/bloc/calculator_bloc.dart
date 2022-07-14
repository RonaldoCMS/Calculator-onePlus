// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:calculator_bloc/app/model/expression.dart';
import 'package:calculator_bloc/app/service/calculator_service.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorInitial()) {
    final CalculatorService service = CalculatorService.empty();

    on<CalculatorEvent>((event, emit) {
      
      if (event is CalculatorAddValue) {
        service.addValue(event.text);
        emit(CalculatorUpdate(expression: service.expression));
      }

      if (event is CalculatorCancValue) {
        service.addValue("AC");
        emit(CalculatorInitial());
      }
      
    });
  }
}
