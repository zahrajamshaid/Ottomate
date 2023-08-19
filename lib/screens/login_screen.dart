import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ottomate/custom_widgets/custom_widgets.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
 static const String id= 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
TextEditingController emailController = TextEditingController();
TextEditingController passwordController= TextEditingController();
 final _auth= FirebaseAuth.instance;

void login(){
  _auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text.toString()).then((value) {
    Navigator.push(context, MaterialPageRoute(builder: (context){return HomeScreen();}));
  }).onError((error, stackTrace) {
showDialog(
  context: context, // The current context.
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text('Failed'),
      content: Text('Not registered or wrong username/password'),
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

  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
                  borderSide:
                      BorderSide(color: Colors.purple, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.purple, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter your password.',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.purple, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.purple, width: 2.0),
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
                  text: "Log In",
                   color: Colors.purple,
                  onPressed: () {
                      login();
                  },
                 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
