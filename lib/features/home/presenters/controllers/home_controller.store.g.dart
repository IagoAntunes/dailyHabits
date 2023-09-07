// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$currentStateAtom =
      Atom(name: '_HomeController.currentState', context: context);

  @override
  IUiState get currentState {
    _$currentStateAtom.reportRead();
    return super.currentState;
  }

  @override
  set currentState(IUiState value) {
    _$currentStateAtom.reportWrite(value, super.currentState, () {
      super.currentState = value;
    });
  }

  late final _$currentHabitAtom =
      Atom(name: '_HomeController.currentHabit', context: context);

  @override
  IHabit get currentHabit {
    _$currentHabitAtom.reportRead();
    return super.currentHabit;
  }

  @override
  set currentHabit(IHabit value) {
    _$currentHabitAtom.reportWrite(value, super.currentHabit, () {
      super.currentHabit = value;
    });
  }

  late final _$_HomeControllerActionController =
      ActionController(name: '_HomeController', context: context);

  @override
  dynamic changeHabit(bool isRight) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.changeHabit');
    try {
      return super.changeHabit(isRight);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentState: ${currentState},
currentHabit: ${currentHabit}
    ''';
  }
}
