import 'package:flutter/material.dart';
import 'package:schedule_app/routes/observer.dart';
import 'repository/database.dart';
import 'routes/app_route.dart';

void main() async {
  // データベースの初期設定
  DataBase.initialization();

  // アプリ起動
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // debugのバーナーが出すかどうか
        // debugShowCheckedModeBanner: false,
        // 初期ルート(home)
        initialRoute: AppRoute.home,
        // ルートの設定
        routes: AppRoute.createRoutes(),
        // 画面遷移を検知するobserverの設定
        navigatorObservers: Observer.getNavigatorObservers());
  }
}
