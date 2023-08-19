
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ottomate/custom_widgets/custom_widgets.dart';
import 'package:ottomate/screens/login_screen.dart';
import 'home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id= 'registeration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
TextEditingController emailController = TextEditingController();
TextEditingController passwordController= TextEditingController();
var email;
var password;
User? currentUser= FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                  image: DecorationImage(
                    image: AssetImage('lib/assets/logo.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.purple, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.purple,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: RoundedButton(
                  text:"Register",
                  color: Colors.purple,
                  onPressed: ()  { 
                  email=emailController.text.trim();
                  password=passwordController.text.trim();
           FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value)  { 
   showDialog(
  context: context, // The current context.
  builder: (BuildContext context) {
    return AlertDialog(
  title: Text("Successful!"),
      content: Text('User registered successfully! Log in now'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog.
          },
          child: Text('OK'),
        ),
      ],
    );
  },
);
            FirebaseFirestore.instance.collection("users").doc(currentUser!.uid).set({'userName': email, 'password': password, 'createdAt': DateTime.now(), 'userId': currentUser!.uid});
            }
         
            );
            },
               
                ),
              ),
            ),
           
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Material(
                color: Colors.purple,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: RoundedButton(
                text: "Login",
                   color: Colors.purple,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){return LoginScreen();}));
                    //Implement login functionality.
                  },
                 
                ),
              ),
            ),],
        ),
      ),
    );
  }
}
