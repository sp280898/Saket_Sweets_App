import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'));

    _notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? route) async {
      if (route != null) {
        // parseRoute(route);
        Get.toNamed('/' + route);
      }
    });
  }

  static void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      final NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
        "mealbox",
        "mealbox channel",
        channelDescription: "this is a mealbox channel",
        importance: Importance.max,
        priority: Priority.high,
      ));

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data["route"],
      );
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }

  // static void sendPushMessage(
  //     {required String token,
  //     required String title,
  //     required String msg,
  //     required String route,
  //     String? senderID}) async {
  //   print('Entered sendNotification method : $token');
  //   try {
  //     await http.post(
  //       Uri.parse('https://fcm.googleapis.com/fcm/send'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //         'Authorization':
  //             'key=AAAAdnyU2XY:APA91bHYR3Ggi6yzEcu1_kPV6RzER0m-yAg7fl2BCEXahisBqMxXhyJLKBksCTSMAhtH-zq9Eauv17eLmSqdL_pjyeFQVpOmP2N_wH1PU95Tf-WOkOorysNvus_5goHmeQ-aYJT-VdWc',
  //       },
  //       body: jsonEncode(
  //         <String, dynamic>{
  //           'notification': <String, dynamic>{
  //             'body': msg,
  //             'title': title,
  //             'android_channel_id': 'firstcaredoctor',
  //           },
  //           'priority': 'high',
  //           'data': <String, dynamic>{
  //             'route': route,
  //             'senderID': senderID,
  //             'id': '1',
  //             'status': 'done'
  //           },
  //           "to": "$token",
  //         },
  //       ),
  //     );
  //   } catch (e) {
  //     print("error push notification");
  //   }
  // }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  // static void saveToken(String id, String token) async {
  //   await FirebaseFirestore.instance.collection("UserToken").doc(id).set({
  //     'token': token,
  //   });
  // }

  // static Future<String> getTokenFromFiresotre(String id) async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection("UserToken")
  //       .doc(id.toString())
  //       .get();
  //   var token = snap['token'];
  //   return token;
  // }
  //  for parse the route
  // static void parseRoute(String route) {
  //   final split = route.split('/');
  //   final Map<int, String> values = {
  //     for (int i = 0; i < split.length; i++) i: split[i]
  //   };
  //   print(values);
  // }
}
