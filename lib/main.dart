import 'package:bmi_calculator_app/util/constants.dart';
import 'package:bmi_calculator_app/view/input_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI CALCULATOR',
      theme: ThemeData.dark().copyWith(
          inputDecorationTheme: InputDecorationTheme(
        border: kTextFieldStyle,
        focusedBorder: kTextFieldStyle,
        enabledBorder: kTextFieldStyle,
      )),
      home: HomePage(),
    );
  }
}
