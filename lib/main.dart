import 'package:flutter/material.dart';
import 'package:in_time/screens/homePage.dart';
import 'package:in_time/screens/loginpage.dart';
import 'package:in_time/screens/signuppage.dart';
import 'package:in_time/utils/custom_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
