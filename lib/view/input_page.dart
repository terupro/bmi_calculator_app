import 'dart:math';
import 'package:bmi_calculator_app/component/bottom_button.dart';
import 'package:bmi_calculator_app/component/icon_content.dart';
import 'package:bmi_calculator_app/component/input_content.dart';
import 'package:bmi_calculator_app/component/reusable_card.dart';
import 'package:bmi_calculator_app/util/constants.dart';
import 'package:bmi_calculator_app/model/calculator_brain.dart';
import 'package:bmi_calculator_app/view/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerの監視
    final _cardBackground = ref.watch(cardBackgroundProvider.notifier);
    final _height = ref.watch(heightProvider.notifier);
    final _weight = ref.watch(weightProvider.notifier);
    final _bmiValue = ref.watch(bmiValueProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        color: ref.watch(cardBackgroundProvider) ==
                                CardBackground.active
                            ? kActiveCardColor
                            : kInActiveCardColor,
                        cardChild: iconContent(FontAwesomeIcons.mars, 'MALE'),
                        press: () {
                          _cardBackground.state = CardBackground.active;
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        color: ref.watch(cardBackgroundProvider) ==
                                CardBackground.inActive
                            ? kActiveCardColor
                            : kInActiveCardColor,
                        cardChild:
                            iconContent(FontAwesomeIcons.venus, 'FEMALE'),
                        press: () {
                          _cardBackground.state = CardBackground.inActive;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: ReusableCard(
                  color: kActiveCardColor,
                  cardChild: InputContent(
                    label: 'HEIGHT (cm)',
                    inputValue: TextFormField(
                      keyboardType: TextInputType.number,
                      style: kInputTextStyle,
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        _height.state = value;
                        print(value);
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ReusableCard(
                  color: kActiveCardColor,
                  cardChild: InputContent(
                    label: 'WEIGHT (kg)',
                    inputValue: TextFormField(
                      keyboardType: TextInputType.number,
                      style: kInputTextStyle,
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        _weight.state = value;
                        print(value);
                      },
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: BottomButton(
                  label: 'CALCULATE',
                  press: () {
                    FocusScope.of(context).unfocus();
                    if (_bmiValue.state == '') {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            content: Text("身長と体重を入力してください。"),
                            actions: [
                              TextButton(
                                child: Text("Cancel"),
                                onPressed: () => Navigator.pop(context),
                              ),
                              TextButton(
                                child: Text("OK"),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    _bmiValue.state = CalculatorBrain().getBmiValue(
                        int.parse(_height.state), int.parse(_weight.state));
                    print(_bmiValue.state);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
