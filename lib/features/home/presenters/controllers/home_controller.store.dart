import 'package:goodhabits/features/home/datasource/models/run_habit_model.dart';
import 'package:goodhabits/features/home/datasource/models/water_habit_model.dart';
import 'package:mobx/mobx.dart';

import '../../datasource/models/ihabit_model.dart';
import '../utils/ui_states.dart';

part 'home_controller.store.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  Map<IUiState, IHabit> listHabit = {
    WaterHabitState(): WaterHabitModel(),
    RunHabitState(): RunHabitModel(),
    Other2HabitState(): RunHabitModel(),
  };

  int indexListHabit = 0;

  @observable
  IUiState currentState = WaterHabitState();

  @observable
  IHabit currentHabit = WaterHabitModel();

  @observable
  double auxValueHabit = 0;

  @action
  changeHabit(bool isRight) {
    auxValueHabit = 0;
    if (isRight) {
      if (indexListHabit + 1 < listHabit.length) {
        indexListHabit++;
        currentState = listHabit.keys.toList()[indexListHabit];
        currentHabit = listHabit.values.toList()[indexListHabit];
      } else {
        indexListHabit = 0;
        currentState = listHabit.keys.toList()[indexListHabit];
        currentHabit = listHabit.values.toList()[indexListHabit];
      }
    } else {
      if (indexListHabit - 1 >= 0) {
        indexListHabit--;
        currentState = listHabit.keys.toList()[indexListHabit];
        currentHabit = listHabit.values.toList()[indexListHabit];
      } else {
        indexListHabit = listHabit.length - 1;
        currentState = listHabit.keys.toList()[indexListHabit];
        currentHabit = listHabit.values.toList()[indexListHabit];
      }
    }
  }

  @action
  changeHabitValue(double value) {
    auxValueHabit = value;
  }
}
