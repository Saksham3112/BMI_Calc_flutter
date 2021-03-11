import 'package:flutter/material.dart';

class calculator {
  final int weight, height;
  double _bmi;
  calculator({@required this.weight, @required this.height});
  String getResult() {
    _bmi = weight / (height * height / 100 / 100);
    return _bmi.toStringAsFixed(1);
  }

  String getSuggestion() {
    if (_bmi > 25)
      return 'On a personal level, you can help prevent weight gain and obesity by making healthier lifestyle choices: Aim for moderate exercise like walking, swimming, or biking for 20 to 30 minutes every day. Eat well by choosing nutritious foods, like fruits, vegetables, whole grains, and lean protein';
    if (_bmi > 18.5) return 'Well Done !!!';
    return 'The aim is to gain weight gradually by eating healthy foods. Even if you are underweight, try to avoid foods with a lot of added sugar, fat and salt, like cakes, takeaway foods and sugary drinks.';
  }

  String getHealth() {
    if (_bmi > 25) return 'Overweight';
    if (_bmi > 18.5) return 'Normal';
    return 'UnderWeight';
  }
}
