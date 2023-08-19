import 'package:flutter/material.dart';
import 'package:ottomate/custom_widgets/custom_widgets.dart';
import 'package:ottomate/screens/welcome_screen.dart';


class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white, // Set the desired color here
        ),
      ),
      home: Scaffold(
      backgroundColor: Colors.white,
    //  appBar: AppBar(
    //       title: Text(

          
    //           "Login",
    //           style: TextStyle(
    //             fontSize: 20,
    //             fontWeight: FontWeight.bold,
    //             color: Colors.black38,
             
    //           ),
    //         ),
    //       ),
    
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('lib/assets/s2.jpg'),
          Text('AUTOMATE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
          Text('Create automated scenes and schedules by integrating multiple brands and services',style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
          RoundedButton(
            text: "GET STARTED!",
            color: Colors.purple,
            onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){return WelcomeScreen();}));
          }, )
        ],
      ),
    )
    ));
  }
}