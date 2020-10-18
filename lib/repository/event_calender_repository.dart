import 'package:hive/hive.dart';
import 'package:schedule_app/db/event/event.dart';
import 'package:schedule_app/db/event_calender/event_calender.dart';

class EventCalenderRepository {
  Future<Box> _box;

  /// deleteFromDiskをした後はdatabaseが閉じてしまうため、もう一度開くための関数
  Future<Box> openBox() async {
    if (!(await _box).isOpen) {
      _box = Hive.openBox<EventCalender>('EventCalender');
    }
    return _box;
  }

  EventCalenderRepository()
      : _box = Hive.openBox<EventCalender>('EventCalender');

  Future<void> save(EventCalender eventCalender) async {
    final Box<EventCalender> box = await openBox();
    await box.add(eventCalender);
  }

  Future<void> saveWithKey(String key, EventCalender eventCalender) async {
    final Box<EventCalender> box = await openBox();
    await box.put(key, eventCalender);
  }

  Future<void> addEvent(String date, Event event) async {
    final Box<EventCalender> box = await openBox();
    EventCalender result = box.get(date) ?? EventCalender(date, []);
    result.events.add(event);
    await box.put(date, result);
  }

  /// 全件データを取得
  Future<List<EventCalender>> findAll() async {
    final Box<EventCalender> box = await openBox();
    return box.values.toList();
  }

  /// Keyを元にデータを取得
  Future<EventCalender> findByKey(String date) async {
    final Box<EventCalender> box = await openBox();
    return box.get(date);
  }

  /// 全件削除
  Future<void> deleteAll() async {
    final Box<EventCalender> box = await openBox();
    await box.clear();
  }
}
