import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'usermanagement.dart';


class SignUpPage extends StatefulWidget{
  @override
  _SignUpPageState createState() => _SignUpPageState(); 
  }
  
  class _SignUpPageState extends State<SignUpPage> {

     bool _obscureText = true;


     GlobalKey<FormState> _key = new GlobalKey();
    bool _validate = false;
     String _email,_password,_name,_lname,_cpassword;

    
  @override
  Widget build(BuildContext context) {

    
    
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
 body:Container(
        child: Container(
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
          ],),),
        child: new Form(
              key: _key,
              autovalidate: _validate,
              child: FormUI(),
            ),
       
    
    )
    ));
    
  }
  Widget FormUI() {
  
    int flag;
    return   Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Container(
              width: 90.0,
              height: 80.0,

               child: Text('In-Time',
          textDirection:TextDirection.ltr,textAlign: TextAlign.center,
          style:TextStyle(
            color:Colors.white,
            decoration: TextDecoration.none,
            fontSize: 30.0,
            fontFamily: 'Lobster',
            fontWeight: FontWeight.w300
          ),),
            ),
            Center(
        child: Container(
        
          
          
          width: 320.0,
          height: 450.0,
          
          padding: EdgeInsets.all(25.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),color: Colors.white,), 
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row( children :<Widget>[
                Expanded(
                  child:new TextFormField(
          decoration: new InputDecoration(hintText: 'First Name',labelText: 'First Name'),
          validator: validateName,
          onSaved: (String val) {
            _name = val;
          },
        ),
                ),
              SizedBox(width: 15.0),
                Expanded(
                  child:TextFormField(
          decoration: new InputDecoration(hintText: 'Last Name',labelText: 'Last Name'),
          validator: validateName,
          onSaved: (String val) {
            _lname = val;
          },
        ),
                ),
              ],
              ),
              
               new TextFormField(
            decoration: new InputDecoration(hintText: 'Email ID',labelText: 'Email ID'),
            keyboardType: TextInputType.emailAddress,
            maxLength: 32,
            validator: validateEmail,
            onSaved: (String val) {
              _email = val;
            }),
             
            
               
             
              
              
              
              TextFormField(decoration:InputDecoration(hintText:'Password',labelText: 'Password', 
                      ),
              validator: (val) => val.length == 0 ? 'Please Enter the Password' : (val.length<6)?'Password too short':null,
              onSaved: (val) => _password = val,
              obscureText: _obscureText,
             
              
  
              ),
               TextFormField(decoration:InputDecoration(hintText:'Re-Type Password',labelText: 'Confirm Password', 
                      ),
              validator: (val) => val.length < 6 ? 'Password too short.' : null,
              onSaved: (val) => _cpassword = val,
              obscureText: _obscureText,
             
              
  
              ),
               SizedBox(height: 15.0),

              
              new RaisedButton(
                highlightElevation: 2.0,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.orange,
                    child: Text('Sign Up'),
              onPressed: (){
                _sendToServer();
              
                
                
              },)
            ],
          ),
        ),
            
      ),],); 
 } 
  

String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if(value.length != 10){
      return "Mobile number must 10 digits";
    }else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if(!regExp.hasMatch(value)){
      return "Invalid Email";
    }else {
      return null;
    }
  }

  String validatapassword(String value){
    if(value.length<=5)
    {
      return "Password is too short";
    }
    else{
      return null;
    }
  }

   _sendToServer() {
    if (_key.currentState.validate()){ 
      // No any error in validation
      _key.currentState.save();
      if(_password==_cpassword){
                  if(_password.length>=6){
                   
                FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email:_email,
                  password:_password)
                  .then((signedInUser){
                        UserManagement().storeNewUser(signedInUser,context,_name,_lname);
                  })
                  .catchError((e){
                    print(e);
                  });
                  
                  
                  }
                  else{
                    Fluttertoast.showToast(
        msg: "Password length too short",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.grey[700],
        textColor: Colors.white
    );
                  }
                }
                else{
                  Fluttertoast.showToast(
        msg: "Password Did not Match",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.grey[700],
        textColor: Colors.white
    );
               
       
      
    }
   }
   
     else {
      // validation error
      setState(() {
        _validate = true;
        });
    }
  }
  }
  
  
