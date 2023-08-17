import 'package:flutter/material.dart';
import 'intro_screen3.dart';


class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

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
  
            title: Text(
              "Login",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
             
              ),
            ),
          ),
    
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('lib/assets/s2.jpg'),
          Text('CUSTOMIZE', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Quickly access the devices that you frequently use by adding them to your Dashboard', textAlign: TextAlign.center,),
          ElevatedButton(
             style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),) ,
            onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){return IntroScreen3();}));
          }, child: Text("CONTINUE")),
        ],
      ),
    )
    ));
  }
}