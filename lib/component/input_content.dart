import 'package:bmi_calculator_app/util/constants.dart';
import 'package:flutter/material.dart';

class InputContent extends StatelessWidget {
  const InputContent({
    Key? key,
    required this.label,
    required this.inputValue,
  }) : super(key: key);

  final String label;
  final TextFormField inputValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(label, style: kBodyTextStyle),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: inputValue,
        ),
      ],
    );
  }
}
