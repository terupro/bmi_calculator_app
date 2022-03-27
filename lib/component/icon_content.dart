import 'package:bmi_calculator_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget iconContent(IconData icon, String label) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, size: 70.0),
      const SizedBox(height: 8.0),
      Text(label, style: kBodyTextStyle),
    ],
  );
}
