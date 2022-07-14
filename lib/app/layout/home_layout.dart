import 'package:calculator_bloc/app/layout/button_layout.dart';
import 'package:calculator_bloc/app/layout/panel/panel_layout.dart';
import 'package:calculator_bloc/app/layout/panel/panel_collapsed_layout.dart';
import 'package:calculator_bloc/app/utils/constant/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

class HomeLayout extends StatefulWidget {
  final BlocBuilder collapsed;
  final PanelLayout panel;
  final ButtonLayout child;
  const HomeLayout(
      {required this.collapsed,
      required this.child,
      required this.panel,
      Key? key})
      : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  double opacity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor().BACKGROUND_OPTION,
      body: Stack(
        children: [
          Column(
            children: [
              const Spacer(flex: 30),
              Expanded(
                flex: 70,
                child: FractionallySizedBox(
                  heightFactor: 0.85,
                  alignment: Alignment.bottomCenter,
                  child: widget.child,
                ),
              ),
            ],
          ),
          SlidingUpPanel(
            panelBuilder: () => Opacity(
              opacity: opacity,
              child: widget.panel,
            ),
            onPanelSlide: (double e) {
              setState(() {
                opacity = e;
              });
            },
            minHeight: MediaQuery.of(context).size.height / 2.55,
            maxHeight: MediaQuery.of(context).size.height / 1.06,
            slideDirection: SlideDirection.DOWN,
            color: MyColor().BACKGROUND_RESULT,
            collapsed: widget.collapsed,
            backdropColor: Colors.red,
            header: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: 7,
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.059,
                    height: 5,
                    decoration: BoxDecoration(
                        color: MyColor().BACKGROUND_SEPARATOR,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0))),
                  ),
                ],
              ),
            ),
          ),
          /* Opacity(
            opacity: 0.5,
            child: Image.asset(
              "assets/mockup/screen.jpeg",
            ),
          ) */
        ],
      ),
    );
  }
}
