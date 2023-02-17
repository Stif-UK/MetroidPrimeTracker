// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemsmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemsAdapter extends TypeAdapter<Items> {
  @override
  final int typeId = 0;

  @override
  Items read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Items()
      ..title = fields[0] as String
      ..region = fields[1] as String
      ..room = fields[2] as String
      ..type = fields[3] as String
      ..collected = fields[4] as bool
      ..description = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, Items obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.region)
      ..writeByte(2)
      ..write(obj.room)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.collected)
      ..writeByte(5)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
