import 'package:flutter/material.dart';
import 'package:schedule_app/db/event/event.dart';
import 'package:schedule_app/db/event_calender/event_calender.dart';
import 'package:schedule_app/utils/date_utils.dart';

List<Widget> createEventCard(List<EventCalender> calenders) {
  List<Widget> eventWidgets = calenders
      .expand((element) => element.events)
      .map((e) => EventCard(e))
      .toList();
  return eventWidgets;
}

class EventCard extends StatelessWidget {
  final Event _event;

  EventCard(this._event);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color.fromARGB(255, 240, 240, 240),
        margin: const EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  constraints: BoxConstraints(minWidth: double.infinity),
                  child: Text(DateUtils.format(_event.start),
                      textAlign: TextAlign.start)),
              Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 3.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(_event.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30))),
              Container(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Text(
                      DateUtils.format(_event.start,
                          format: 'yyyy/MM/dd HH:mm'),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20))),
              Container(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Text(
                      DateUtils.format(_event.finish,
                          format: 'yyyy/MM/dd HH:mm'),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20)))
            ],
          ),
        ));
  }
}
