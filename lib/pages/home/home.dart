import 'package:flutter/material.dart';
import 'package:schedule_app/pages/@modules/app_drawer.dart';
import 'package:schedule_app/pages/home/card.dart';
import 'package:schedule_app/repository/event_calender_repository.dart';
import 'package:schedule_app/routes/observer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Observer().subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    Observer().unsubscribe(this);
    super.dispose();
  }

  /// この画面に戻ったときに呼ばれる
  @override
  void didPopNext() {
    print('didPopNext');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    EventCalenderRepository repository = EventCalenderRepository();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('今日の予定'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: repository.findAll(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.isEmpty) return Text("スケジュールを作成してください。");
            return ListView(children: createEventCard(snapshot.data));
          } else {
            return Text("データが存在しません");
          }
        },
      ),
    );
  }
}
