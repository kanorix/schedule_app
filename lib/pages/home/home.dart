import 'package:flutter/material.dart';
import 'package:schedule_app/pages/@modules/app_drawer.dart';
import 'package:schedule_app/pages/home/card.dart';
import 'package:schedule_app/repository/event_calender_repository.dart';
import 'package:schedule_app/utils/singleton.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Singleton().routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    Singleton().routeObserver.unsubscribe(this);
    super.dispose();
  }

  // 上の画面がpopされて、この画面に戻ったときに呼ばれます
  void didPopNext() {
    print('return');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    EventCalenderRepository repository = EventCalenderRepository();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('home'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: repository.findAll(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return ListView(children: createEventCard(snapshot.data));
          } else {
            return Text("データが存在しません");
          }
        },
      ),
    );
  }
}
