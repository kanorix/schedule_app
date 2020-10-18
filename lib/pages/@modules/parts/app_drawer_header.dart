import 'package:flutter/material.dart';

class AppDrawerHeader extends StatelessWidget {
  final String text;

  AppDrawerHeader({Key key, this.text = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: BoxDecoration(
          color: const Color(0xff7c94b6),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ));
  }
}
