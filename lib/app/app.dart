import 'package:calculator_bloc/app/bloc/calculator_bloc.dart';
import 'package:calculator_bloc/app/utils/theme/my_text_theme.dart';
import 'package:calculator_bloc/app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculatorBloc(),
      child: MaterialApp(
        title: 'OnePlus Calculator',
        theme: myTheme,
        home: const HomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
