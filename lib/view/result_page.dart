import 'package:bmi_calculator_app/component/bottom_button.dart';
import 'package:bmi_calculator_app/component/reusable_card.dart';
import 'package:bmi_calculator_app/util/constants.dart';
import 'package:bmi_calculator_app/model/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: ReusableCard(
        color: kActiveCardColor,
        cardChild: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'RESULT',
              style: kBodyTextStyle,
            ),
            Text(
              ref.watch(bmiValueProvider).toString(),
              style: kNumberTextStyle,
            ),
            BottomButton(
              label: 'RECALCULATE',
              press: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
