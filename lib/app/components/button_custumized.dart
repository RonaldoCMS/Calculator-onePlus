import 'package:calculator_bloc/app/utils/constant/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ButtonType { OPTION, RESULT, NUMBER }

class ButtomCustomized extends StatelessWidget {
  final Widget child;
  final Function()? function;
  final ButtonType type;
  const ButtomCustomized(
      {required this.type,
      required this.function,
      required this.child,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: IconButton(
        splashRadius: MediaQuery.of(context).size.height * 0.022,
        splashColor: Colors.red,
        onPressed: function,
        icon: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
                color: (type != ButtonType.NUMBER)
                    ? (type == ButtonType.OPTION)
                        ? MyColor().BACKGROUND_BUTTON_OPTION
                        : MyColor().BACKGROUND_BUTTON_RESULT
                    : Colors.transparent,
                shape: BoxShape.circle),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
