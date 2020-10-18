import 'package:schedule_app/db/event/event.dart';
import 'package:schedule_app/utils/date_utils.dart';

class ScheduleForm {
  String title;
  String content;
  String startDate;
  String startTime;
  String finishDate;
  String finishTime;

  setTitle(String string) => title = string;
  setContent(String string) => content = string;
  setStartDate(String string) => startDate = string;
  setStartTime(String string) => startTime = string;
  setFinishDate(String string) => finishDate = string;
  setFinishTime(String string) => finishTime = string;

  Event toEvent() {
    return Event(
        title: title ?? '',
        content: content ?? '',
        start: DateUtils.toDateTimeWithTime(startDate, startTime),
        finish: DateUtils.toDateTimeWithTime(finishDate, finishTime));
  }
}
