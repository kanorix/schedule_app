import 'package:hive/hive.dart';
import 'package:schedule_app/db/event/event.dart';

class EventRepository {
  Future<Box<Event>> _box = Hive.openBox<Event>('Event');

  Future<Box<Event>> save(Event event) async {
    final Box<Event> box = await _box;
    box.add(event);
    return box;
  }

  Future<Box<Event>> saveAll(List<Event> events) async {
    final Box<Event> box = await _box;
    box.addAll(events);
    return box;
  }

  /// 全件データを取得
  Future<List<Event>> findAll() async {
    final Box<Event> box = await _box;
    return box.values.toList();
  }

  /// 全件削除
  Future<void> deleteAll() async {
    final Box<Event> box = await _box;
    await box.deleteAll(await findAll());
  }
}
