import  'package:flutter/material.dart';
import 'package:in_time/screens/homePage.dart';
import 'package:in_time/screens/loginpage.dart';
import 'package:in_time/screens/signuppage.dart';
import 'package:in_time/utils/custom_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  String text;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map <String, dynamic> message) {
        print(message);
      },
      onResume: (Map <String, dynamic> message) {
        print(message);
      },
      onLaunch: (Map <String, dynamic> message) {
        print(message);
      },

    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true,
            alert: true,
            badge: true
        )
    );
    _firebaseMessaging.onIosSettingsRegistered.listen((
        IosNotificationSettings setting) {
      print('IOS Setting Registered');
    });
    _firebaseMessaging.getToken().then((token) {
      update(token);
      text = token;
      setState(() {

      });
    });
  }

  update(String token) {
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        title: 'In Time',
        home: (FirebaseAuth.instance.currentUser() == null)
            ? LoginPage()
            : HomePage(),

        routes: <String, WidgetBuilder>{
          '/landingpage': (BuildContext context) => new MyApp(),
          '/signup': (BuildContext context) => new SignUpPage(),
          '/homepage': (BuildContext context) => new HomePage(),
          '/loginpage' : (BuildContext context) => new LoginPage()
        });


  }
}