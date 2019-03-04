import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:in_time/screens/homePage.dart';
import 'package:in_time/screens/loginpage.dart';
import 'package:in_time/screens/signuppage.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text;

  update(String token) {
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'In Time',
        theme: ThemeData(fontFamily: 'Rubik'),
        home: (FirebaseAuth.instance.currentUser() == null)
            ? LoginPage()
            : HomePage(),
        routes: <String, WidgetBuilder>{
          '/landingpage': (BuildContext context) => new MyApp(),
          '/signup': (BuildContext context) => new SignUpPage(),
          '/homepage': (BuildContext context) => new HomePage(),
          '/loginpage': (BuildContext context) => new LoginPage()
        });
  }
}