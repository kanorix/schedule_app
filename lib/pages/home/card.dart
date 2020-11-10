import 'package:flutter/material.dart';
import 'package:schedule_app/db/event/event.dart';
import 'package:schedule_app/db/event_calender/event_calender.dart';
import 'package:schedule_app/utils/date_utils.dart';
import 'package:schedule_app/utils/space_utils.dart';

List<Widget> createEventCard(List<EventCalender> calenders) {
  List<Event> events = calenders
      .expand((element) => element.events)
      .where((e) => e.start.month == DateTime.now().month)
      .where((e) => e.start.day == DateTime.now().day)
      .toList()
        ..sort((pe, ce) => pe.start.compareTo(ce.start));

  return events.map((e) => EventCard(e)).toList();
}

class EventCard extends StatelessWidget {
  final Event _event;

  EventCard(this._event);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(bottom: 10.0),
              constraints: BoxConstraints(minWidth: double.infinity),
              child: Text(DateUtils.format(_event.start, format: 'HH:mm 〜'),
                  style: TextStyle(fontSize: 20), textAlign: TextAlign.start)),
          Container(
              padding: SpaceUtils.half,
              child: Text(_event.title,
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 35))),
        ],
      ),
    ));
  }
}
