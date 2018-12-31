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

class MyApp extends StatelessWidget {
String text="Hello World";
FirebaseMessaging fb = new FirebaseMessaging();
FlutterLocalNotificationsPlugin fl= new FlutterLocalNotificationsPlugin();

@override
void initstate(){
  super.initstate();
  var android= new AndroidInitializationSettings('minmap/iclauncher');
  var ios = new IosNotificationSettings();
  var platform = new InitializationSettings(android, ios);
  fl.initialize(platform);

  fb.configure(
    onLaunch: (Map<String,dynamic> msg){
      print(" on Launch called");
    },
    onResume: (Map<String,dynamic> msg){
      print("called");
    },
    onMessage: (Map<String,dynamic> msg){
      showmessage(msg);

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
  fb.onIosSettingsRegistered.listen((IosNotificationSettings setting){
    print("IOS setting registered");
  });
  fb.getToken().then((token){
    update(token);
  });
}
showmessage(Map<String , dynamic> msg) async{
  var android = new AndroidNotificationDetails('channel_id',"Channel Name","Channel Description");
  var ios = new IOSNotificationDetails();
  var platform = new NotificationDetails(android, ios);
 FlutterLocalNotificationsPlugin.show(0,"This is title","This is demo",platform);

}
update(String token){
  print(token);
  text=token;
  setState((){


  });

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

