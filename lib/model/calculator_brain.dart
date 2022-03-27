import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// カードの背景色を管理するための状態管理
enum CardBackground {
  active,
  inActive,
}
CardBackground? cardBackground;
// Providerの作成
final StateProvider<CardBackground?> cardBackgroundProvider =
    StateProvider((ref) => cardBackground);

/// BMIを計算するための状態管理
class CalculatorBrain extends StateNotifier<String> {
  CalculatorBrain() : super('');
  String getBmiValue(int height, int weight) {
    double bmi;
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }
}

// Providerの作成
final heightProvider = StateNotifierProvider((ref) => CalculatorBrain());
final weightProvider = StateNotifierProvider((ref) => CalculatorBrain());
final bmiValueProvider = StateNotifierProvider((ref) => CalculatorBrain());
