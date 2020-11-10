import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:schedule_app/db/event/event.dart';
import 'package:schedule_app/db/event_calender/event_calender.dart';

class DataBase<E> {
  // インスタンスのキャッシュ
  static Map<String, DataBase> _instance = Map();

  // 初めて呼び出されたときはインスタンスを生成してキャッシュし、
  // それ以降はキャッシュを返すfactoryコンストラクタ。
  factory DataBase({String name}) {
    // nameがない場合はクラス名のDBを開く
    name ??= E.toString();

    if (E == dynamic || name == '') {
      throw Exception(
          'DataBase class must have type parameter "E" or named parameter "name".');
    }

    if (!_instance.containsKey(name)) {
      return DataBase._internal(name);
    }
    return _instance[name];
  }

  /// DataBaseの初期化をします
  static Future<void> initialization() async {
    // Hiveを使うには2つのパッケージが必要
    // Hiveの初期化
    await Hive.initFlutter();

    // カスタムアダプターの追加
    Hive.registerAdapter(EventCalenderAdapter());
    Hive.registerAdapter(EventAdapter());
  }

  final Future<Box<E>> _box;

  // 内部から呼び出してインスタンスを作るための
  // プライベートなコンストラクタ。
  DataBase._internal(String name) : this._box = Hive.openBox<E>(name);

  /// DBに接続
  Future<Box<E>> _connect() async {
    return await _box;
  }

  /// データを保存
  Future<void> save(E entity) async {
    final Box<E> box = await _connect();
    await box.add(entity);
  }

  /// データをキーと保存
  Future<void> saveWithKey(String key, E entity) async {
    final Box<E> box = await _connect();
    await box.put(key, entity);
  }

  /// 全件データを取得
  Future<List<E>> findAll() async {
    final Box<E> box = await _connect();
    return box.values.toList();
  }

  /// Keyを元にデータを取得
  Future<E> findByKey(String key) async {
    final Box<E> box = await _connect();
    return box.get(key);
  }

  /// 全件削除
  Future<void> deleteAll() async {
    final Box<E> box = await _connect();
    await box.clear();
  }
}
