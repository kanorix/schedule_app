import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  /// 'yyyy/MM/dd HH:mm'
  static final String defaultDateTimeFormat = 'yyyy/MM/dd HH:mm';
  static final String defaultDateFormat = 'yyyy/MM/dd';
  static final String defaultTimeFormat = 'HH:mm';

  static final DateTime lastYear = getPast(years: 1);
  static final DateTime nextYear = getFuture(years: 1);

  DateTimeUtils._();

  static DateTime marge(DateTime date, TimeOfDay time) {
    if (date == null || date == null)
      throw Exception('DateTime >> needs either of parameter ');

    date ??= DateTime.now();
    time ??= TimeOfDay.now();
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  static DateTime parse(String dateString, {String parsePattern}) {
    DateTime result;
    try {
      result = DateFormat(parsePattern ?? defaultDateTimeFormat)
          .parseStrict(dateString);
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
    }
    return result;
  }

  static String formatDate(DateTime date, {String formatPattern}) {
    return format(
        date: date, formatPattern: (formatPattern ?? defaultTimeFormat));
  }

  static String formatTimeOfDay(TimeOfDay time, {String formatPattern}) {
    return format(
        time: time, formatPattern: (formatPattern ?? defaultTimeFormat));
  }

  static String format({DateTime date, TimeOfDay time, String formatPattern}) {
    return DateFormat(formatPattern ?? defaultDateTimeFormat)
        .format(marge(date, time));
  }

  static Duration _getDuration(int years, int days, int hours, int minutes) {
    int sumDays = (years * 365) + days;
    return Duration(days: sumDays, hours: hours, minutes: minutes);
  }

  /// 過去の日付を取得します。
  /// * 引数は正のみ
  static DateTime getPast(
      {int years = 0, int days = 0, int hours = 0, int minutes = 0}) {
    return DateTime.now().add(_getDuration(years, days, hours, minutes) * -1);
  }

  /// 未来の日付を取得します。
  /// * 引数は正のみ
  static DateTime getFuture(
      {int years = 0, int days = 0, int hours = 0, int minutes = 0}) {
    return DateTime.now().add(_getDuration(years, days, hours, minutes));
  }
}
