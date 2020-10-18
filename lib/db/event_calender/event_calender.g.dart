// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_calender.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventCalenderAdapter extends TypeAdapter<EventCalender> {
  @override
  final int typeId = 1;

  @override
  EventCalender read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventCalender(
      fields[0] as String,
      (fields[1] as List)?.cast<Event>(),
    );
  }

  @override
  void write(BinaryWriter writer, EventCalender obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.events);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventCalenderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
