import 'package:calculator_bloc/app/bloc/calculator_bloc.dart';
import 'package:calculator_bloc/app/components/button_custumized.dart';
import 'package:calculator_bloc/app/layout/button_layout.dart';
import 'package:calculator_bloc/app/layout/home_layout.dart';
import 'package:calculator_bloc/app/layout/panel/panel_collapsed_layout.dart';
import 'package:calculator_bloc/app/layout/panel/panel_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return HomeLayout(
        panel: const PanelLayout(),
        collapsed: BlocBuilder<CalculatorBloc, CalculatorState>(
          builder: (BuildContext context, CalculatorState state) {
            return PanelCollapsedLayout(text: state.expression.expView);
          },
        ),
        child: ButtonLayout(
          widgets: [
            ButtomCustomized(
              type: ButtonType.NUMBER,
              function: () =>
                  context.read<CalculatorBloc>().add(CalculatorCancValue()),
              child: const Text("AC"),
            ),
            ButtomCustomized(
                type: ButtonType.NUMBER,
                function: () => context
                    .read<CalculatorBloc>()
                    .add(CalculatorAddValue(text: 'back')),
                child: Text("D")),
            ButtomCustomized(
                type: ButtonType.NUMBER,
                function: () => context
                    .read<CalculatorBloc>()
                    .add(CalculatorAddValue(text: '%')),
                child: Text("%")),
            ButtomCustomized(
                type: ButtonType.OPTION,
                function: () => context
                    .read<CalculatorBloc>()
                    .add(CalculatorAddValue(text: 'div')),
                child: Text("div")),
            ButtomCustomized(
                type: ButtonType.NUMBER,
                function: () => context
                    .read<CalculatorBloc>()
                    .add(CalculatorAddValue(text: '7')),
                child: Text("7")),
            ButtomCustomized(
                type: ButtonType.NUMBER,
                function: () => context
                    .read<CalculatorBloc>()
                    .add(CalculatorAddValue(text: '8')),
                child: Text("8")),
            ButtomCustomized(
                type: ButtonType.NUMBER,
                function: () => context
                    .read<CalculatorBloc>()
                    .add(CalculatorAddValue(text: '9')),
                child: Text("9")),
            ButtomCustomized(
                type: ButtonType.OPTION,
                function: () => context
                    .read<CalculatorBloc>()
                    .add(CalculatorAddValue(text: 'x')),
                child: Text("x")),
            ButtomCustomized(
                type: ButtonType.NUMBER,
                function: () => context
                    .read<CalculatorBloc>()
                    .add(CalculatorAddValue(text: '4')),
                child: Text("4")),
            ButtomCustomized(
                type: ButtonType.NUMBER,
                function: () => context
                    .read<CalculatorBloc>()
                    .add(CalculatorAddValue(text: '5')),
                child: Text("5")),
            ButtomCustomized(
                type: ButtonType.NUMBER,
                function: () => context
                    .read<CalculatorBloc>()
                    .add(CalculatorAddValue(text: '6')),
                child: Text("6")),
            ButtomCustomized(
                type: ButtonType.OPTION,
                function: () => context
                    .read<CalculatorBloc>()
                    .add(CalculatorAddValue(text: '-')),
                child: Text("-")),
            ButtomCustomized(
                type: ButtonType.NUMBER,
                function: () => context
                    .read<CalculatorBloc>()
                    .add(CalculatorAddValue(text: '1')),
                child: Text("1")),
            ButtomCustomized(
                type: ButtonType.NUMBER,
                function: () => context
                    .read<CalculatorBloc>()
                    .add(CalculatorAddValue(text: '2')),
                child: Text("2")),
            ButtomCustomized(
                type: ButtonType.NUMBER,
                function: () => context
                    .read<CalculatorBloc>()
                    .add(CalculatorAddValue(text: '3')),
                child: Text("3")),
            ButtomCustomized(
                type: ButtonType.OPTION,
                function: () => context
                    .read<CalculatorBloc>()
                    .add(CalculatorAddValue(text: '+')),
                child: Text("+")),
            ButtomCustomized(
                type: ButtonType.NUMBER,
                function: () => context
                    .read<CalculatorBloc>()
                    .add(CalculatorAddValue(text: 'D')),
                child: Text("D")),
            ButtomCustomized(
                type: ButtonType.NUMBER,
                function: () => context
                    .read<CalculatorBloc>()
                    .add(CalculatorAddValue(text: '0')),
                child: Text("0")),
            ButtomCustomized(
                type: ButtonType.NUMBER,
                function: () => context
                    .read<CalculatorBloc>()
                    .add(CalculatorAddValue(text: ',')),
                child: Text(",")),
            ButtomCustomized(
                type: ButtonType.RESULT,
                function: () => context
                    .read<CalculatorBloc>()
                    .add(CalculatorAddValue(text: '=')),
                child: Text("=")),
          ],
        ));
  }
}
