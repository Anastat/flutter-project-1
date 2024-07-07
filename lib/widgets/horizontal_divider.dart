import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(children: <Widget>[
      Expanded(
          child: Divider(
        color: Color.fromARGB(255, 1, 49, 88),
        height: 36,
        indent: 0,
        endIndent: 10,
      )),
      Text("OR"),
      Expanded(
          child: Divider(
        color: Color.fromARGB(255, 1, 49, 88),
        height: 36,
        indent: 10,
        endIndent: 0,
      )),
    ]);
  }
}
