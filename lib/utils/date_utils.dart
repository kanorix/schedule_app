import 'package:intl/intl.dart';

import 'time_utils.dart';

class DateUtils {
  static final DateTime lastYear = getPast(years: 1);
  static final DateTime nextYear = getFuture(years: 1);

  static final String formatDefault = 'yyyy/MM/dd';

  static String format(DateTime date, {String format}) {
    return DateFormat(format ?? formatDefault).format(date);
  }

  static DateTime toDateTime(String dateString, {String format}) {
    DateTime result;
    try {
      result = DateFormat(format ?? formatDefault).parseStrict(dateString);
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
    }
    return result;
  }

  static DateTime toDateTimeWithTime(String date, String time,
      {String format}) {
    DateTime result;
    String formatString = '$formatDefault:${TimeUtils.formatDefault}';

    if (date == null) return null;
    time = time ?? '00:00';

    try {
      result = DateFormat(format ?? formatString).parseStrict('$date:$time');
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
    }
    return result;
  }

  static Duration _getDuration(int years, int days, int hours, int minutes) {
    int sumDays = (years * 365) + days;
    return Duration(days: sumDays, hours: hours, minutes: minutes);
  }

  static DateTime getPast(
      {int years = 0, int days = 0, int hours = 0, int minutes = 0}) {
    return DateTime.now().add(_getDuration(years, days, hours, minutes) * -1);
  }

  static DateTime getFuture(
      {int years = 0, int days = 0, int hours = 0, int minutes = 0}) {
    return DateTime.now().add(_getDuration(years, days, hours, minutes));
  }
}
