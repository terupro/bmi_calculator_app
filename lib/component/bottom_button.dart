import 'package:bmi_calculator_app/component/reusable_card.dart';
import 'package:bmi_calculator_app/util/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.label,
    required this.press,
  }) : super(key: key);

  final String label;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: 80,
        child: ReusableCard(
          color: kButtonColor,
          cardChild: Align(
            alignment: Alignment.center,
            child: Text(
              label,
              style: kButtonTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
