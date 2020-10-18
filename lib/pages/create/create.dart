import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_app/forms/schedule_form.dart';
import 'package:schedule_app/pages/create/form.dart';
import 'package:schedule_app/repository/event_calender_repository.dart';
import 'package:schedule_app/routes/app_route.dart';
import 'package:schedule_app/utils/space_utils.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
// Formウィジェット内の各フォームを識別するためのキーを設定
  final _formKey = GlobalKey<FormState>();

  final ScheduleForm _form = ScheduleForm();

  EventCalenderRepository repository = EventCalenderRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text('スケジュール作成'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.save_alt_rounded, color: Colors.black),
                onPressed: () async {
                  print('onPressed');
                  if (_formKey.currentState.validate()) {
                    print('good');
                    await repository.addEvent(_form.startDate, _form.toEvent());
                    Navigator.popUntil(
                        context, ModalRoute.withName(AppRoute.home));
                  }
                },
              )
            ]),
        body: SingleChildScrollView(
            child: Container(
                margin: SpaceUtils.normal,
                child: CreatePageForm(_formKey, _form))));
  }
}
