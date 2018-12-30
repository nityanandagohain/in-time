import  'package:flutter/material.dart';
import 'package:in_time/screens/homePage.dart';
import 'package:in_time/screens/loginpage.dart';
import 'package:in_time/screens/signuppage.dart';
import 'package:in_time/utils/custom_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
String text="Hello World";
FirebaseMessaging fb = new FirebaseMessaging();

@override
void initstate(){
  fb.configure(
    onLaunch: (Map<String,dynamic> msg){
      print(" on Launch called");
    },
    onResume: (Map<String,dynamic> msg){
      print("called");
    },
    onMessage: (Map<String,dynamic> msg){
      print(" on Resume called ");

    }
  );
  fb.requestNotificationPermissions(
    const IosNotificationSettings(
      sound: true,
      badge: true,
      alert: true,
    )
  );
}
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'In Time',
      
      home: (FirebaseAuth.instance.currentUser() == null)? LoginPage(): HomePage(),

      routes: <String,WidgetBuilder>{
        '/landingpage':(BuildContext context)=>new MyApp(),
        '/signup':(BuildContext context)=>new SignUpPage(),
        '/homepage':(BuildContext context)=> new HomePage()
      });
  }
}
