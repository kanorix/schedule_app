import 'package:flutter/widgets.dart';

/// 'RouteObserver'のラッパーでシングルトンのクラスです。
class Observer extends RouteObserver<PageRoute> {
  // インスタンスのキャッシュ
  static Observer _instance;

  factory Observer() => _instance ??= Observer._internal();

  // 内部コンストラクタ
  Observer._internal() : super();

  // 画面遷移を監視するobserverをセットする
  static List<NavigatorObserver> getNavigatorObservers() => [Observer()];
}
