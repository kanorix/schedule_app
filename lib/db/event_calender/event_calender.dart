import 'package:hive/hive.dart';
import 'package:schedule_app/db/event/event.dart';

part 'event_calender.g.dart';

@HiveType(typeId: 1)
class EventCalender extends HiveObject {
  @HiveField(0)
  String date;

  @HiveField(1)
  List<Event> events;

  EventCalender(this.date, this.events);
}
