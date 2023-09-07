// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ihabit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IHabitAdapter extends TypeAdapter<IHabit> {
  @override
  final int typeId = 1;

  @override
  IHabit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IHabit(
      name: fields[0] as String,
      action: fields[1] as String,
      description: fields[2] as String,
      primaryColor: fields[3] as Color,
      goalMaxValue: fields[4] as double,
      goalMinValue: fields[5] as double,
      goalValue: fields[6] as double,
      habitValue: fields[7] as double,
      divisors: fields[8] as int,
      measurements: fields[9] as String,
      id: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, IHabit obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.action)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.primaryColor)
      ..writeByte(4)
      ..write(obj.goalMaxValue)
      ..writeByte(5)
      ..write(obj.goalMinValue)
      ..writeByte(6)
      ..write(obj.goalValue)
      ..writeByte(7)
      ..write(obj.habitValue)
      ..writeByte(8)
      ..write(obj.divisors)
      ..writeByte(9)
      ..write(obj.measurements)
      ..writeByte(10)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IHabitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
