import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:GymBro/preferences.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void initializeNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

}

Future<void> showNotification() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    '0',
    'PR Notification',
    channelDescription: 'To notify that the current week is for PRs!',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: true,
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? stringValue = prefs.getString("Bench Bar PR");

  await flutterLocalNotificationsPlugin.show(
    0,
    'PR TIME',
    stringValue != null ? 
    'The is the PR week, will you beat your ${stringValue}kg at the Bench?' : 'The is the PR week, will you do your best?',
    platformChannelSpecifics,
  );

  print("Notification shown");
}
