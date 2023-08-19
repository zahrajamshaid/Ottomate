import 'package:flutter/material.dart';
import '../custom_widgets/custom_widgets.dart';
import 'login_screen.dart';
import 'registeration_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50], // Purplish white background
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedText("Welcome!"),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedButton(
                text: "Login",
                color: Colors.purple,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }),
                  );
                },
              ),
              SizedBox(width: 20),
              RoundedButton(
                text: "Register",
                color: Colors.purple,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return RegistrationScreen();
                    }),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
