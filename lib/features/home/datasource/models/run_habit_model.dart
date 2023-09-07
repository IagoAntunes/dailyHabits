import 'package:flutter/material.dart';

import 'ihabit_model.dart';

class RunHabitModel extends IHabit {
  RunHabitModel()
      : super(
          name: 'Correr',
          action: 'Correr',
          description: 'Correr',
          primaryColor: Colors.green,
          goalMaxValue: 100.0,
          goalMinValue: 0,
          goalValue: 2,
          habitValue: 0,
          divisors: 20,
          measurements: 'km',
          id: 'run',
        );

  @override
  changeGoalValue(double value) {
    goalValue = value;
  }

  @override
  changeValue(double value) {
    habitValue += value;
  }
}
