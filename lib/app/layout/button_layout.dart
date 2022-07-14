import 'package:calculator_bloc/app/components/button_custumized.dart';
import 'package:flutter/material.dart';

class ButtonLayout extends StatelessWidget {
  final List<ButtomCustomized> widgets;
  const ButtonLayout({required this.widgets, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (widgets.isEmpty || widgets.length < 19) {
      return const Center(
        child: Text(
          "Exception",
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Column(
      children: [
        const Spacer(flex: 2),
        Expanded(
            flex: 15,
            child: row(widgets[0], widgets[1], widgets[2], widgets[3])),
        const Spacer(flex: 2),
        Expanded(
            flex: 15,
            child: row(widgets[4], widgets[5], widgets[6], widgets[7])),
        const Spacer(flex: 2),
        Expanded(
            flex: 15,
            child: row(widgets[8], widgets[9], widgets[10], widgets[11])),
        const Spacer(flex: 2),
        Expanded(
            flex: 15,
            child: row(widgets[12], widgets[13], widgets[14], widgets[15])),
        const Spacer(flex: 2),
        Expanded(
            flex: 15,
            child: row(widgets[16], widgets[17], widgets[18], widgets[19])),
        const Spacer(flex: 2),
      ],
    );
  }
}

Row row(ButtomCustomized widget1, ButtomCustomized widget2,
    ButtomCustomized widget3, ButtomCustomized widget4) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Spacer(flex: 2),
      Expanded(
        flex: 20,
        child: SizedBox(
          height: 100,
          width: 100,
          child: FittedBox(child: widget1),
        ),
      ),
      Spacer(flex: 2),
      Expanded(
        flex: 20,
        child: widget2,
      ),
      Spacer(flex: 2),
      Expanded(
        flex: 20,
        child: widget3,
      ),
      Spacer(flex: 2),
      Expanded(flex: 20, child: widget4),
      Spacer(flex: 2),
    ],
  );
}
