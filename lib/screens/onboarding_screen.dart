import 'package:flutter/material.dart';
import 'package:ottomate/screens/home_screen.dart';
import 'intro_screen1.dart';
import 'intro_screen2.dart';
import 'intro_screen3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[PageView(
      
          children: [
            IntroScreen1(),
            IntroScreen2(),
            IntroScreen3(),
            HomeScreen(),
          ]
        ),
       
        ],
      ));
    
  }
}