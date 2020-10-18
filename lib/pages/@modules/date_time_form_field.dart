import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schedule_app/pages/@modules/space_box.dart';

import 'date_form_field.dart';
import 'time_form_field.dart';

class DateTimeFormField extends StatefulWidget {
  final bool isRequiredDate;
  final bool isRequiredTime;

  final Function(String) onChangedDate;
  final Function(String) onChangedTime;

  DateTimeFormField(this.onChangedDate, this.onChangedTime,
      {this.isRequiredDate, this.isRequiredTime});

  @override
  _DateTimeFormFieldState createState() =>
      _DateTimeFormFieldState(onChangedDate, onChangedTime,
          isRequiredDate: isRequiredDate, isRequiredTime: isRequiredTime);
}

class _DateTimeFormFieldState extends State<DateTimeFormField> {
  final bool isRequiredDate;
  final bool isRequiredTime;

  final Function(String) onChangedDate;
  final Function(String) onChangedTime;

  _DateTimeFormFieldState(this.onChangedDate, this.onChangedTime,
      {this.isRequiredDate = false, this.isRequiredTime = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
            child: DateFormField(onChangedDate, isRequired: isRequiredDate)),
        SpaceBox.width(),
        Flexible(
            child: TimeFormField(onChangedTime, isRequired: isRequiredTime))
      ],
    );
  }
}
