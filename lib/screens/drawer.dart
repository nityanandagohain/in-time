import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'homePage.dart';

Widget drawerLeft() {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("John Doe"),
            accountEmail: Text("johndoe@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orangeAccent,
              child: Text("JD",style: TextStyle(color: Colors.white),),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {

            },
            leading: Icon(Icons.home),
          ),
          ListTile(
            title: Text('Subjects'),
            onTap: () {
              // Update the state of the app
              // ...
            },
            leading: Icon(Icons.info_outline),
          ),
          ListTile(
            title: Text('Pending Tasks'),
            onTap: () {
              // Update the state of the app
              // ...
            },
            leading: Icon(Icons.apps),
          ),
          ListTile(
            title: Text('Setting'),
            onTap: () {
              // Update the state of the app
              // ...
            },
            leading: Icon(Icons.settings),),
            ListTile(
            title: Text('Logout'),
            onTap: () {
              // Update the state of the app
              // ...
            },
            leading: Icon(Icons.add_circle_outline),

          ),

        ],
      ),
    );
  }