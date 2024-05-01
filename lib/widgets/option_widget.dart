import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {
  final Function select; // Callback function to update selected option
  final String option;

  const OptionWidget(this.select, this.option);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
            onPressed: () => select(option), child: Text(option)));
  }
}
