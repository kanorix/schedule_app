import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schedule_app/utils/time_utils.dart';

class TimeFormField extends StatefulWidget {
  final bool isRequired;

  final Function(String) onChanged;

  TimeFormField(this.onChanged, {this.isRequired = false});

  @override
  _TimeFormFieldState createState() =>
      _TimeFormFieldState(onChanged, isRequired: isRequired);
}

class _TimeFormFieldState extends State<TimeFormField> {
  final _inputController = TextEditingController();

  final bool isRequired;

  final Function(String) onChanged;

  _TimeFormFieldState(this.onChanged, {bool isRequired})
      : this.isRequired = isRequired ?? false;

  _handleTime() async {
    final TimeOfDay pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      String result = TimeUtils.format(time: pickedTime);
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
          labelText: 'Time',
        ),
        maxLines: 1,
        onTap: _handleTime,
        validator: (v) => (v.isEmpty && isRequired) ? '時間を入力してください。' : null);
  }
}
