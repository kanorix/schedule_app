import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeUtils {
  static final String formatDefault = 'hh:mm';

  static DateTime _toDateTime(TimeOfDay t) {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day, t.hour, t.minute);
  }

  static String format({String format, TimeOfDay time}) {
    return DateFormat(format ?? formatDefault).format(_toDateTime(time));
  }
}
