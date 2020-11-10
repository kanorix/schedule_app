import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schedule_app/forms/schedule_form.dart';
import 'package:schedule_app/pages/@modules/date_time_form_field.dart';
import 'package:schedule_app/pages/@modules/space_box.dart';

class CreatePageForm extends StatefulWidget {
  final GlobalKey<FormState> _formKey;
  final ScheduleForm _form;
  CreatePageForm(this._formKey, this._form);
  @override
  _CreatePageFormState createState() => _CreatePageFormState(_formKey, _form);
}

class _CreatePageFormState extends State<CreatePageForm> {
  final GlobalKey<FormState> _formKey;
  final ScheduleForm _form;

  _CreatePageFormState(this._formKey, this._form);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              width: double.infinity,
              child: Text(
                'タイトル',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.left,
              )),
          SpaceBox.height(SpaceBox.small),
          TextFormField(
            // 入力可能
            enabled: true,
            // 入力数
            maxLength: 20,
            // 入力制限
            maxLengthEnforced: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(), // 外枠付きデザイン
              labelText: "Title",
              hintText: 'plese input title',
            ),
            maxLines: 1,
            validator: (v) => v.isEmpty ? 'テキストを入力してください。' : null,
            onChanged: _form.setTitle,
          ),
          Container(
              width: double.infinity,
              child: Text(
                '開始',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.left,
              )),
          SpaceBox.height(SpaceBox.small),
          DateTimeFormField(_form.setStartDate, _form.setStartTime,
              isRequiredDate: true),
          SpaceBox.height(),
          Container(
              width: double.infinity,
              child: Text(
                '終了',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.left,
              )),
          SpaceBox.height(SpaceBox.small),
          DateTimeFormField(_form.setFinishDate, _form.setFinishTime),
          SpaceBox.height(),
          Container(
              width: double.infinity,
              child: Text(
                'メモ',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.left,
              )),
          SpaceBox.height(SpaceBox.small),
          TextFormField(
            // 入力可能
            enabled: true,
            // 入力数
            maxLength: 50,
            // 入力制限
            maxLengthEnforced: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(), // 外枠付きデザイン
              labelText: "Contents",
              hintText: 'plese input contents',
            ),
            maxLines: 5,
            validator: (v) => null,
            onChanged: _form.setContent,
          ),
        ],
      ),
    );
  }
}
