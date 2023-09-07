// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'ihabit_model.g.dart';

@HiveType(typeId: 1)
class IHabit extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String action;
  @HiveField(2)
  String description;
  @HiveField(3)
  Color primaryColor;
  @HiveField(4)
  double goalMaxValue;
  @HiveField(5)
  double goalMinValue;
  @HiveField(6)
  double goalValue;
  @HiveField(7)
  double habitValue;
  @HiveField(8)
  int divisors;
  @HiveField(9)
  String measurements;
  @HiveField(10)
  String id;
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
    required this.id,
  });

  changeGoalValue(double value) {
    goalValue = value;
  }

  changeValue(double value) {
    habitValue += value;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'action': action,
      'description': description,
      'primaryColor': primaryColor.value,
      'goalMaxValue': goalMaxValue,
      'goalMinValue': goalMinValue,
      'goalValue': goalValue,
      'habitValue': habitValue,
      'divisors': divisors,
      'measurements': measurements,
      'id': id,
    };
  }

  factory IHabit.fromMap(Map<String, dynamic> map) {
    return IHabit(
      name: map['name'] as String,
      action: map['action'] as String,
      description: map['description'] as String,
      primaryColor: Color(map['primaryColor'] as int),
      goalMaxValue: map['goalMaxValue'] as double,
      goalMinValue: map['goalMinValue'] as double,
      goalValue: map['goalValue'] as double,
      habitValue: map['habitValue'] as double,
      divisors: map['divisors'] as int,
      measurements: map['measurements'] as String,
      id: map['id'] as String,
    );
  }

  IHabit copy(IHabit copyHabit) {
    return IHabit(
      name: copyHabit.name,
      action: copyHabit.action,
      description: copyHabit.description,
      primaryColor: copyHabit.primaryColor,
      goalMaxValue: copyHabit.goalMaxValue,
      goalMinValue: copyHabit.goalMinValue,
      goalValue: copyHabit.goalValue,
      habitValue: copyHabit.habitValue,
      divisors: copyHabit.divisors,
      measurements: copyHabit.measurements,
      id: id,
    );
  }

  String toJson() => json.encode(toMap());

  factory IHabit.fromJson(String source) =>
      IHabit.fromMap(json.decode(source) as Map<String, dynamic>);
}
