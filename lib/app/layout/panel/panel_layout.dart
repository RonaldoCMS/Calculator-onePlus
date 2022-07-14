import 'package:flutter/material.dart';

class PanelLayout extends StatelessWidget {
  const PanelLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: FractionallySizedBox(
            heightFactor: 0.9,
            widthFactor: 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Cronologia"),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.abc_outlined),
                )
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.white,
        ),
        const Expanded(
          flex: 90,
          child: Text("Work in progress"),
        ),
      ],
    );
  }
}
