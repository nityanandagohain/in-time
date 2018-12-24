import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

Widget drawerLeft(BuildContext context) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      children: <Widget>[
        new Container(
          child: new UserAccountsDrawerHeader(
            accountName: Text("John Doe"),
            accountEmail: Text("johndoe@gmail.com"),
            decoration: new BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: new AssetImage("assets/img/bg.png"))),
            currentAccountPicture: CircleAvatar(
              backgroundImage: new AssetImage("assets/img/mainpic.png"),
            ),
            otherAccountsPictures: <Widget>[
              new GestureDetector(
                child: new CircleAvatar(
                  backgroundImage: new AssetImage("assets/img/otherpic.png"),
                ),
              )
            ],
          ),
        ),
        new Container(
          color: Colors.yellow[900],
          child: ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
            leading: Icon(Icons.home),
          ),
        ),
        new Container(
          color: Colors.yellow[800],
          child: ListTile(
            title: Text('Subjects'),
            onTap: () {
              // Update the state of the app
              // ...
              Navigator.pop(context);
            },
            leading: Icon(Icons.info_outline),
          ),
        ),
        new Container(
          color: Colors.yellow[700],
          child: ListTile(
            title: Text('Pending Tasks'),
            onTap: () {
              // Update the state of the app
              // ...
              Navigator.pop(context);
            },
            leading: Icon(Icons.apps),
          ),
        ),
        new Container(
          color: Colors.yellow[600],
          child: ListTile(
            title: Text('Settings'),
            onTap: () {
              // Update the state of the app
              // ...
              Navigator.pop(context);
            },
            leading: Icon(Icons.settings),
          ),
        ),
        new Container(
          color: Colors.yellow[500],
          child: ListTile(
            title: Text('Signout'),
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.of(context).pushReplacementNamed('landingpage');
              }).catchError((e) {
                print(e);
              });
              Navigator.pop(context);
            },
            leading: Icon(Icons.lock_open),
          ),
        ),
      ],
    ),
  );
}
