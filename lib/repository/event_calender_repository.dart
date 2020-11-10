import 'package:schedule_app/db/event/event.dart';
import 'package:schedule_app/db/event_calender/event_calender.dart';
import 'package:schedule_app/repository/database.dart';

class EventCalenderRepository {
  final DataBase _dataBase = DataBase<EventCalender>();

  Future<void> save(EventCalender eventCalender) {
    return _dataBase.save(eventCalender);
  }

  Future<void> saveWithKey(String key, EventCalender eventCalender) {
    return _dataBase.saveWithKey(key, eventCalender);
  }

  Future<void> addEvent(String date, Event event) async {
    EventCalender result =
        (await _dataBase.findByKey(date)) ?? EventCalender(date, []);
    result.events.add(event);
    await _dataBase.saveWithKey(date, result);
  }

  /// 全件データを取得
  Future<List<EventCalender>> findAll() {
    return _dataBase.findAll();
  }

  /// Keyを元にデータを取得
  Future<EventCalender> findByKey(String date) {
    return _dataBase.findByKey(date);
  }

  /// 全件削除
  Future<void> deleteAll() async {
    await _dataBase.deleteAll();
  }
}
