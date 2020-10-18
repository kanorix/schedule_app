import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _active = false;

  void _changeSwitch(bool e) => setState(() => _active = e);

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
              title: Text('タイトル'),
              subtitle: Text('サブタイトル'),
              onChanged: _changeSwitch,
            ),
          ],
        ),
      ),
    );
  }
}
