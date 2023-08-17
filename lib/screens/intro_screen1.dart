import 'package:flutter/material.dart';
import 'intro_screen2.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white, // Set the desired color here
        ),
      ),
      home: Scaffold(
      backgroundColor: Colors.white,
     appBar: AppBar(
         title: const Text(
              "Login",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
             
              ),textAlign: TextAlign.end,
            ),
          ),
    
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('lib/assets/s1.jpg'),
          const Text('CONNECT', style: TextStyle(fontWeight: FontWeight.bold)),
          const Text('Link all your smarthome devices to otomate and control them from single app', textAlign: TextAlign.center,),
          ElevatedButton(
           style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),) ,
            onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){return IntroScreen2();}));
          }, child: Text("CONTINUE")),
        ],
      ),
    )
    ));
  }
}