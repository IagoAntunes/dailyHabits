// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class IHabit {
  String name;
  String action;
  String description;
  Color primaryColor;
  double goalMaxValue;
  double goalMinValue;
  double goalValue;
  double habitValue;
  int divisors;
  String measurements;
  IHabit({
    required this.name,
    required this.action,
    required this.description,
    required this.primaryColor,
    required this.goalMaxValue,
    required this.goalMinValue,
    required this.goalValue,
    required this.habitValue,
    required this.divisors,
    required this.measurements,
  });

  changeGoalValue(double value);
  changeValue(double value);
}
