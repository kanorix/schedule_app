import 'package:flutter/material.dart';

class AppDrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String route;

  AppDrawerItem({Key key, this.icon, this.text, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(icon),
        title: Text(text),
        onTap: () {
          if (route == Navigator.defaultRouteName) {
            Navigator.popUntil(context, ModalRoute.withName(route));
          } else {
            Navigator.popAndPushNamed(context, route);
          }
        });
  }
}
