import 'package:flutter/material.dart';
import 'package:schedule_app/pages/home/home.dart';
import 'package:schedule_app/pages/setting/setting.dart';
import 'package:schedule_app/pages/create/create.dart';

/// Application route class.
class AppRoute {
  static const String home = Navigator.defaultRouteName;
  static const String create = '/create';
  static const String setting = '/setting';

  /// Create and return routes map.
  static Map<String, WidgetBuilder> createRoutes() => {
        home: (BuildContext context) => HomePage(),
        create: (BuildContext context) => CreatePage(),
        setting: (BuildContext context) => SettingPage(),
      };
}
