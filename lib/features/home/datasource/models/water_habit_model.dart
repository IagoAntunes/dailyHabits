import 'package:goodhabits/core/styles/colors.dart';

import 'ihabit_model.dart';

class WaterHabitModel extends IHabit {
  WaterHabitModel()
      : super(
          name: 'Água',
          action: 'Beber ',
          description: 'Beber água',
          primaryColor: AppColors.blue,
          goalMaxValue: 3000,
          goalMinValue: 0,
          goalValue: 2000,
          habitValue: 0,
          divisors: 30,
          measurements: 'ml',
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
