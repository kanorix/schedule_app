import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schedule_app/utils/date_time_utils.dart';
import 'package:schedule_app/utils/date_utils.dart';

class DateFormField extends StatefulWidget {
  final bool isRequired;

  final Function(String) onChanged;

  DateFormField(this.onChanged, {this.isRequired = false});

  @override
  _DateFormFieldState createState() =>
      _DateFormFieldState(onChanged, isRequired: isRequired);
}

class _DateFormFieldState extends State<DateFormField> {
  final bool isRequired;

  final Function(String) onChanged;

  final _inputController = TextEditingController();

  _DateFormFieldState(this.onChanged, {bool isRequired})
      : this.isRequired = isRequired ?? false;

  _handleDate() async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateUtils.lastYear,
        lastDate: DateUtils.nextYear);

    if (pickedDate != null) {
      String result = DateTimeUtils.formatDate(pickedDate);
      _inputController.text = result;
      onChanged(result);
    } else {
      // フォーカスを外す
      FocusManager.instance.primaryFocus.unfocus();
      // 値を消す
      _inputController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: _inputController,
        readOnly: true,
        decoration: const InputDecoration(
          // 外枠付きデザイン
          border: OutlineInputBorder(),
          labelText: 'Date',
        ),
        maxLines: 1,
        onTap: _handleDate,
        validator: (v) => (v.isEmpty && isRequired) ? '日付を入力してください。' : null);
  }
}
