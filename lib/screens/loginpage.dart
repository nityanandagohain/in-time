import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:in_time/utils/custom_loader.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum authProblems { UserNotFound, PasswordNotValid, NetworkError }

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;

  String _email;
  String _password;
  final _googleSignIn = new GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> _signInWithGoogle() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user = await _auth.signInWithCredential(credential);
    print("signed in " + user.displayName);
    Navigator.of(context).pushReplacementNamed('/homepage');
    return user.displayName;
  }

  bool showCustomLoader = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showCustomLoader
        ? CustomLoader()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.orange,
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    Colors.orange[800],
                    Colors.orange[700],
                    Colors.orange[600],
                    Colors.orange[400],
                  ],
                ),
              ),
              child: Form(
                key: _key,
                autovalidate: _validate,
                child: FormUI(),
              ),
            ));
  }

  Widget FormUI() {
    int flag;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            child: Text(
              'In-Time',
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 30.0,
                  fontFamily: 'Lobster',
                  fontWeight: FontWeight.w300),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(25.0),
              width: 320.0,
              height: 360.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new TextFormField(
                      decoration: new InputDecoration(
                          hintText: 'Email ID', labelText: 'Email ID'),
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 32,
                      validator: validateEmail,
                      onSaved: (String val) {
                        _email = val;
                      }),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Password',
                              labelText: 'Password',
                            ),
                            validator: (val) => val.length == 0
                                ? 'Please Enter the Password'
                                : (val.length < 6)
                                    ? 'Password too short'
                                    : null,
                            onSaved: (val) => _password = val,
                            obscureText: _obscureText,
                          ),
                        ),
                      ]),
                  SizedBox(height: 10.0),
                  new RaisedButton(
                    highlightElevation: 2.0,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.orange,
                    child: Text('Log In'),
                    onPressed: () {
                      _sendToServer();
                    },
                  ),
                  SizedBox(height: 10.0),
                  Text("Don't have an account?"),
                  SizedBox(height: 10.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          child: new RaisedButton(
                            highlightElevation: 2.0,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Colors.orange,
                            child: Text('Sign Up'),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/signup');
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20.0),

                          /* child:new Image.asset(
               'images/goog.png',width: 40.0,height: 50.0,
               
             ),*/

                          child: new RaisedButton(
                            highlightElevation: 2.0,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Colors.orange,
                            child: Text('Google'),
                            onPressed: _signInWithGoogle,
                          ),
                        )
                      ])
                ],
              ),
            ),
          ),
        ]);
  }

  String validateEmail(String value) {
    if (_validate) {
      setState(() {
        showCustomLoader = true;
      });
    }
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      setState(() {
        showCustomLoader = true;
      });
      // No any error in validation
      _key.currentState.save();
      if (_password.length >= 6) {
        FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password)
            .then((FirebaseUser user) {
          hideProgress();
          Navigator.of(context).pushReplacementNamed('/homepage');
        }).catchError((e) {
          hideProgress();
          authProblems errorType;
          switch (e.message) {
            case 'There is no user record corresponding to this identifier. The user may have been deleted.':
              errorType = authProblems.UserNotFound;
              break;
            case 'The password is invalid or the user does not have a password.':
              errorType = authProblems.PasswordNotValid;
              break;
            case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
              errorType = authProblems.NetworkError;
              break;
            // ...
            default:
              print('Case ${e.message} is not jet implemented');
          }
          Fluttertoast.showToast(
              msg: errorType.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1,
              backgroundColor: Colors.grey[700],
              textColor: Colors.white);
        });
      } else {
        Fluttertoast.showToast(
            msg: "Password length too short",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.grey[700],
            textColor: Colors.white);
      }
    } else {
      // validation error
      setState(() {
        _validate = false;
        showCustomLoader = false;
      });
    }
  }

  void hideProgress() {
    setState(() {
      showCustomLoader = false;
    });
  }
}
