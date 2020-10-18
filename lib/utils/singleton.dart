// シングルトンクラス。
import 'package:flutter/widgets.dart';

class Singleton {
  static Singleton _instance; // インスタンスのキャッシュ

  final RouteObserver<PageRoute> routeObserver;

  // 初めて呼び出されたときはインスタンスを生成してキャッシュし、
  // それ以降はキャッシュを返すfactoryコンストラクタ。
  factory Singleton() {
    if (_instance == null) _instance = Singleton._internal();
    return _instance;
  }

  // 内部から呼び出してインスタンスを作るための
  // プライベートなコンストラクタ。
  Singleton._internal() : this.routeObserver = RouteObserver<PageRoute>();
}
