import 'package:flutter/material.dart';
import 'package:in_time/screens/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'In Time',
      home: HomePage(),
    );
  }
}
