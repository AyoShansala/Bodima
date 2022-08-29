import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  final String msgToken;
  const MainScreen({
    Key? key,
    required this.msgToken,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  String? mtoken = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermission();
    loadFCM();
    listenFCM();
    //getToken();
    FirebaseMessaging.instance.subscribeToTopic("Animal");
  }

  // void saveToken(String token) async {
  //   await FirebaseFirestore.instance.collection("UserTokens").doc("User1").set({
  //     'token': token,
  //   });
  // }

  void sendPushMessage(String token, String body, String title) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAA6fHddPU:APA91bEDawFe_mBnTBSieWFLzcdWHua8kdm28h-GGBUq-Qu44rXLsa_DujbNRjEgahdKSw1o3KQ2YZs8KQuGVljNs7Adc2lQ_Y_23mqEKHSXYh-RNDGKWJEKCE4cNNADt4G21s5IDONV',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': body,
              'title': title,
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": token,
          },
        ),
      );
    } catch (e) {
      print("error push notification");
    }
  }

  // void getToken() async {
  //   await FirebaseMessaging.instance.getToken().then((token) {
  //     setState(() {
  //       mtoken = token;
  //     });
  //     print(token);
  //   });
  //   saveToken(mtoken!);
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

  void listenFCM() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
      }
    });
  }

  void loadFCM() async {
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        importance: Importance.high,
        enableVibration: true,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: title,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Message Title",
                floatingLabelStyle: const TextStyle(color: Colors.black),
                hintText: "Your Message",
                hintStyle: const TextStyle(color: Colors.white30),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    new Radius.circular(5.0),
                  ),
                ),
                labelStyle: const TextStyle(color: Colors.white),
              ),
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: body,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: "Message Body",
                floatingLabelStyle: const TextStyle(color: Colors.black),
                hintText: "Your Message",
                hintStyle: const TextStyle(color: Colors.white30),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    new Radius.circular(5.0),
                  ),
                ),
                labelStyle: const TextStyle(color: Colors.white),
              ),
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () async {
                String name = userName.text.trim();
                String titleText = title.text;
                String bodyText = body.text;
                sendPushMessage(widget.msgToken, titleText, bodyText);

                // if (name != "") {
                //   DocumentSnapshot snap = await FirebaseFirestore.instance
                //       .collection("UserTokens")
                //       .doc(name)
                //       .get();
                //   String token = snap['token'];
                //   print(token);
                //   // sendPushMessage(
                //   //   token,
                //   //   titleText,
                //   //   bodyText,
                //   // );
                // }
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Send',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                height: 40,
                width: 200,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
