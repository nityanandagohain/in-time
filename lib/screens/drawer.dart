import 'package:flutter/material.dart';

String otherProfilePicture = "https://banner2.kisspng.com/20180529/geg/kisspng-female-youtube-in-my-frame-of-mind-female-avatar-5b0cd573b50ef5.2847503715275677317416.jpg";
String mainProfilePicture = "https://st.depositphotos.com/1734074/5142/v/950/depositphotos_51426031-stock-illustration-vector-woman-avatar-flat-round.jpg";

Widget drawerLeft(BuildContext context) {
    return Drawer (
      child : ListView(
        // Important: Remove any padding from the ListView.
        children: <Widget>[
          new Container(
            child: new UserAccountsDrawerHeader(
            accountName: Text("John Doe"),
            accountEmail: Text("johndoe@gmail.com"),
            decoration: new BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage("https://cdn.vuetifyjs.com/images/parallax/material2.jpg")
              )
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: new NetworkImage(mainProfilePicture),
            ),
            otherAccountsPictures: <Widget>[
              new GestureDetector(
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(otherProfilePicture),
                ),
              )
            ],
          ),
      ),
      new Container(
        color: Colors.yellow[900],
          child : ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
            leading: Icon(Icons.home),
          ),
          ),
      new Container(
          color: Colors.yellow[800],
          child : ListTile(
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
          child :ListTile(
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
          child :ListTile(
            title: Text('Settings'),
            onTap: () {
              // Update the state of the app
              // ...
              Navigator.pop(context);
            },
            leading: Icon(Icons.settings),
          ),
          ),
        ],
      ),
    );
  }
  