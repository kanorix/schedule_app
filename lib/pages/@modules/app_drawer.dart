import 'package:flutter/material.dart';
import 'package:schedule_app/routes/app_route.dart';

import 'parts/app_drawer_item.dart';
import 'parts/app_drawer_header.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        AppDrawerHeader(),
        AppDrawerItem(
          icon: Icons.home,
          text: 'home',
          route: AppRoute.home,
        ),
        AppDrawerItem(
          icon: Icons.event,
          text: 'create',
          route: AppRoute.create,
        ),
        AppDrawerItem(
          icon: Icons.settings,
          text: 'setting',
          route: AppRoute.setting,
        ),
      ],
    ));
  }
}
