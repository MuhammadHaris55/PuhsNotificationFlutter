import 'package:flutter/material.dart';
import 'package:flutterdogtagapp/services/local_notification_service.dart';


class helloworld extends StatelessWidget {
  const helloworld({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello world'),),
    body: Column(
      children: [Container(

      )],
    ),
      floatingActionButton: FloatingActionButton(onPressed: (){LocalNotificationService.instantNofitication();}),
    );
  }
}
