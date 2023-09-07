import 'package:goodhabits/features/home/datasource/models/run_habit_model.dart';
import 'package:goodhabits/features/home/datasource/models/water_habit_model.dart';
import 'package:mobx/mobx.dart';

import '../../datasource/models/ihabit_model.dart';
import '../utils/ui_states.dart';

part 'home_controller.store.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  IHabit waterHabitModel = WaterHabitModel();
  IHabit runHabitModel = RunHabitModel();
  WaterHabitState waterHabitState = WaterHabitState();
  RunHabitState runHabitState = RunHabitState();

  int indexListHabit = 0;
  bool alreadyEnter = false;

  @observable
  IUiState currentState = WaterHabitState();

  @observable
  IHabit? currentHabit;

  @observable
  double auxValueHabit = 0;

  @action
  changeHabit(bool isRight) {
    auxValueHabit = 0;
    if (indexListHabit == 0) {
      currentState = runHabitState;
      currentHabit = runHabitModel;
      indexListHabit = 1;
    } else {
      indexListHabit = 0;
      currentState = waterHabitState;
      currentHabit = waterHabitModel;
    }
  }

  @action
  changeHabitValue(double value) {
    auxValueHabit = value;
  }
}
