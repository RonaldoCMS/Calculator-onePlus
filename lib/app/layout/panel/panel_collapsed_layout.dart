import 'package:flutter/material.dart';

class PanelCollapsedLayout extends StatelessWidget {
  final String text;
  const PanelCollapsedLayout({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(flex: 17),
          Expanded(
            flex: 20,
            child: Container(

              child: FittedBox(
                child: Text(text),
              ),
            ),
          ),
          Spacer(flex: 63),
        ],
      ),
    );
  }
}
