import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registeration_screen.dart';


class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome!",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            RoundedButton(
              text: "Login",
              color: Colors.purple,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){return LoginScreen();}));
                // Handle login button press
              },
            ),
            SizedBox(height: 15),
            RoundedButton(
              text: "Register",
              color: Colors.purple,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){return RegistrationScreen();}));
                // Handle register button press
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  RoundedButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}