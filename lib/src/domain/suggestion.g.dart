// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SuggestionAdapter extends TypeAdapter<Suggestion> {
  @override
  final int typeId = 0;

  @override
  Suggestion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Suggestion(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Suggestion obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.query);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuggestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
