import 'package:flutter/material.dart';
import 'package:schedule_app/repository/event_calender_repository.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _active = false;

  EventCalenderRepository _repository = EventCalenderRepository();

  void _changeSwitch(bool e) async {
    await _repository.deleteAll();
    setState(() => _active = e);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Setting'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: ListView(
          children: <Widget>[
            SwitchListTile(
              value: _active,
              inactiveThumbColor: Colors.blue,
              inactiveTrackColor: Colors.grey,
              activeColor: Colors.orange,
              activeTrackColor: Colors.red,
              secondary: Icon(
                Icons.color_lens,
                color: _active ? Colors.orange[700] : Colors.grey[500],
                size: 50.0,
              ),
              title: Text('データを削除する'),
              subtitle: Text('登録したイベントを全削除します。'),
              onChanged: _changeSwitch,
            ),
          ],
        ),
      ),
    );
  }
}
