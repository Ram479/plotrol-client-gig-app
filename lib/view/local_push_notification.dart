// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:plotrol/view/main_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../mainlive.dart';
//
// class LocalNotificationService {
//   static final instance = FirebaseMessaging.instance;
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   static void setValues(message){
//
//   }
//
//   static void initialize(BuildContext context) async{
//
//     instance.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     await _notificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
//     const IOSInitializationSettings initializationSettingsIOS =
//     IOSInitializationSettings(
//       requestSoundPermission: true,
//       requestBadgePermission: true,
//       requestAlertPermission: true,
//       defaultPresentSound: true,
//       // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//     );
//     const InitializationSettings initializationSettings =
//     InitializationSettings(
//         android: AndroidInitializationSettings("ic_launcher"),
//         iOS: initializationSettingsIOS
//     );
//     _notificationsPlugin.initialize(initializationSettings,onSelectNotification: selectNotification,);
//
//
//     // TextToSpeech tts = TextToSpeech();
//
//
//
//     FirebaseMessaging.instance.getInitialMessage().then((message) async{
//       if (message != null) {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//
//         RemoteNotification notification = message.notification!;
//         AndroidNotification? android = message.notification?.android;
//         if (android != null) {
//           // print('getInitialMessage${message.data}');
//           prefs.setString('notificationOrderId', message.data['orderid']??'');
//           display(message);
//           // String text = "${message.notification!.body}";
//           // tts.speak(text);
//           // double volume = 1.0;
//           // tts.setVolume(volume);
//           // double rate = 1.0;
//           // tts.setRate(rate);
//           // double pitch = 1.0;
//           // tts.setPitch(pitch);
//           // String language = 'en-US';
//           // tts.setLanguage(language);
//
//         }
//       }
//     });
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async{
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       print('message before data ');
//       print(message.data);
//       // RemoteNotification notification = message.notification!;
//       AndroidNotification? android = message.notification?.android;
//       print('message before if data ');
//
//       if (android != null) {
//         print('onMessage ${message.notification!.body}');
//         prefs.setString('notificationOrderId', message.data['orderid']??'');
//         display(message);
//         print('message after if data ');
//       }
//     });
//
//     // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async{
//     //   print('A new onMessageOpenedApp event was published!');
//     //   SharedPreferences prefs = await SharedPreferences.getInstance();
//     //   // message.data['orderid'];
//     //   RemoteNotification? notification = message.notification;
//     //   AndroidNotification? android = message.notification?.android;
//     //   if (notification != null && android != null) {
//     //     prefs.setString('notificationOrderId', message.data['orderid']??'');
//     //     Navigator.of(Get.context!).
//     //     push(
//     //         MaterialPageRoute(builder: (BuildContext context) =>
//     //         HomeView(
//     //           selectedIndex: 0,
//     //           ),
//     //         ),
//     //       );
//     //    }
//     // });
//     //
//     // FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true,sound: true,badge: true,);
//
//
//   }
//
//
//   static Future<dynamic> selectNotification(String? payload) async {
//     try {
//       Navigator.of(Get.context!).
//       push(MaterialPageRoute(builder: (BuildContext context) =>
//           HomeView(
//             selectedIndex: 0,
//           )));
//
//
//     } on Exception catch (e) {
//       print(e);
//     }
//   }
//
//
//
//   static void display(RemoteMessage message) async {
//     try {
//       final id = DateTime.now().millisecondsSinceEpoch ~/1000;
//       const NotificationDetails notificationDetails = NotificationDetails(
//         iOS: IOSNotificationDetails(presentSound: true,presentAlert: true,presentBadge: true,),
//         android: AndroidNotificationDetails(
//           "Plotrol",
//           "Plotrol Client",
//           "hello everyone",
//           importance: Importance.max,
//           priority: Priority.high,
//           icon: 'ic_launcher',
//           playSound: true,
//           sound: RawResourceAndroidNotificationSound('ring'),
//           enableVibration:true,
//         ),
//       );
//
//       await _notificationsPlugin.show(
//         id,
//         message.notification!.title,
//         message.notification!.body,
//         notificationDetails,
//         payload: message.data.toString(),
//       );
//     } on Exception catch (e) {
//       print(e);
//     }
//   }
// }