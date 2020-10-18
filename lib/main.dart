import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:schedule_app/utils/singleton.dart';
import 'package:schedule_app/repository/event_calender_repository.dart';
import 'db/event_calender/event_calender.dart';
import 'db/event/event.dart';
import 'routes/app_route.dart';

void main() async {
  // Hiveを使うには2つのパッケージが必要
  // Hiveの初期化
  await Hive.initFlutter();
  // カスタムアダプターの追加
  Hive.registerAdapter(EventCalenderAdapter());
  Hive.registerAdapter(EventAdapter());

  EventCalenderRepository ecr = EventCalenderRepository();
  await ecr.deleteAll();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: <NavigatorObserver>[Singleton().routeObserver],
        initialRoute: AppRoute.home,
        routes: AppRoute.createRoutes());
  }
}
