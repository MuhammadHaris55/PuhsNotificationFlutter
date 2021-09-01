import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService extends ChangeNotifier {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    // static void initialize(BuildContext context) {
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();

    final InitializationSettings initializationSettings =
        InitializationSettings(
            // android: AndroidInitializationSettings("@mipmap/ic_launcher"),
            android: androidInitializationSettings,
            iOS: iosInitializationSettings);

    _notificationsPlugin.initialize(initializationSettings);
    // _notificationsPlugin.initialize(initializationSettings,
    //     onSelectNotification: (String route) async {
    //   if (route != null) {
    //     Navigator.of(context).pushNamed(route);
    //   }
    // });
  }

  //Instant Notifications
  static Future instantNofitication() async {
    var android = AndroidNotificationDetails("id", "channel", "description");

    var ios = IOSNotificationDetails();

    var platform = new NotificationDetails(android: android, iOS: ios);

    await _notificationsPlugin.show(
        0, "Demo instant notification", "Tap to do something", platform,
        payload: "Welcome to demo app");
  }

  static void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      final NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
        "bilal",
        "bilal channel",
        "this is our channel",
        importance: Importance.max,
        priority: Priority.high,
      ));


      await _notificationsPlugin.show(
        id,
        message.notification.title,
        message.notification.body,
        notificationDetails,
        payload: message.data["route"],
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}


