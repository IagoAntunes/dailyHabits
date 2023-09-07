import 'dart:async';

import 'package:flutter/material.dart';
import 'package:goodhabits/features/home/datasource/models/ihabit_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class CacheAdapter {
  final completer = Completer<Box>();

  CacheAdapter() {
    _initDb();
  }
  Future _initDb() async {
    var appDocDirectory = await getApplicationDocumentsDirectory();
    Hive
      ..init(appDocDirectory.path)
      ..registerAdapter(IHabitAdapter());

    final box = await Hive.openBox('cache');
    if (!completer.isCompleted) completer.complete(box);
  }

  Future<void> put(IHabit data, String id) async {
    final box = await completer.future;
    box.put(id, data.toMap());
  }

  Future<IHabit?> get(String id) async {
    final box = await completer.future;
    final data = await box.get(id);

    if (data == null) return null;

    return IHabit(
      action: data['action'],
      description: data['description'],
      divisors: data['divisors'],
      goalMaxValue: data['goalMaxValue'],
      goalMinValue: data['goalMinValue'],
      goalValue: data['goalValue'],
      habitValue: data['habitValue'],
      measurements: data['measurements'],
      name: data['name'],
      id: data['id'],
      primaryColor: Color(data['primaryColor']),
    );
  }
}
