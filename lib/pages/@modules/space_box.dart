import 'package:flutter/widgets.dart';

class SpaceBox extends SizedBox {
  static const double big = 32.0;
  static const double large = 24.0;
  static const double normal = 16.0;
  static const double half = 8.0;
  static const double small = 4.0;

  SpaceBox({double width = normal, double height = normal})
      : super(width: width, height: height);

  SpaceBox.width([double value = normal]) : super(width: value);
  SpaceBox.height([double value = normal]) : super(height: value);
}
