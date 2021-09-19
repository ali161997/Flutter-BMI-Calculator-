import 'package:flutter/cupertino.dart';
import 'dart:math';

class Calculator {
  Calculator({required this.height, required this.weight});

  final int height;
  final int weight;

  double _bmi = 0.0;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (18.5 < _bmi) {
      return 'normal';
    } else {
      return 'underWeight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'you have higher than normal body weight';
    } else if (18.5 <= _bmi) {
      return 'you have normal body weight';
    } else {
      return 'you have lower than normal body weight';
    }
  }
}
