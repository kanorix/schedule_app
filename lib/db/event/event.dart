import 'package:hive/hive.dart';

part 'event.g.dart';

@HiveType(typeId: 2)
class Event extends HiveObject {
  @HiveField(0)
  DateTime start;

  @HiveField(1)
  DateTime finish;

  @HiveField(2)
  String title;

  @HiveField(3)
  String content;

  Event({this.title, this.content, this.start, this.finish});
}
