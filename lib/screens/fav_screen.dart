import 'package:flutter/material.dart';
import 'package:ottomate/custom_widgets/custom_widgets.dart';
import 'Automate_Screen.dart';
import 'bedroom_screen.dart';
import 'home_screen.dart';
import 'notification_screen.dart';
import 'settings_screen.dart';

class FavScreen extends StatelessWidget {
  

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
            "Favourites",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black38,
           
            ),
          ), ),
            body:
          GridView.count(crossAxisCount: 2,
crossAxisSpacing: 15,
mainAxisSpacing: 15,
          children: [
             CenteredImageCard(imageUrl:'lib/assets/study.jpg' ,title:'StudyRoom' , subtitle:'5 devices' ,onTap: (context) => BedroomScreen(),),
           CenteredImageCard(imageUrl:'lib/assets/live.jpg' ,title:'LivingRoom' , subtitle:'12 devices' , onTap:(context) => BedroomScreen(), ),
           CenteredImageCard(imageUrl:'lib/assets/bed.jpg' ,title:'Bedroom' , subtitle:'15 devices' , onTap: (context) => BedroomScreen(),),
          CenteredImageCard(imageUrl:'lib/assets/curtains.jpg' ,title:'Kitchen' , subtitle:'2 devices' , onTap:(context) => HomeScreen(),),
           CenteredImageCard(imageUrl:'lib/assets/sensor.jpg' ,title:'Store' , subtitle:'2 devices' ,onTap: (context) => HomeScreen(),),
           CenteredImageCard(imageUrl:'lib/assets/bath.jpg' ,title:'BathRoom' , subtitle:'8 devices' , onTap:(context) => BedroomScreen(), ),
           CenteredImageCard(imageUrl:'lib/assets/kitchen.jpg' ,title:'Kitchen' , subtitle:'18 devices' , onTap:(context) => BedroomScreen(), ),
           CenteredImageCard(imageUrl:'lib/assets/store.jpg' ,title:'Store' , subtitle:'3 devices' ,onTap: (context) => BedroomScreen(),),]
          
          ),
          bottomNavigationBar: BottomNavigationBar(
            
            items:[
            BottomNavigationBarItem(icon: GestureDetector(child: Icon(Icons.home), onTap:() {  Navigator.push(context, MaterialPageRoute(builder: (context){return HomeScreen();}));} ), label: "Home", backgroundColor: Colors.purple),
             BottomNavigationBarItem(icon: GestureDetector(child: Icon(Icons.cloud), onTap:() {  Navigator.push(context, MaterialPageRoute(builder: (context){return AutomateScreen();}));} ,), label: "Automation", ),
              BottomNavigationBarItem(icon: GestureDetector(child: Icon(Icons.favorite_outline), onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context){return FavScreen();})); },), label: "Favourite",),
              BottomNavigationBarItem(icon: GestureDetector(child: Icon(Icons.notifications), onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context){return NotificationScreen();})); },), label: "Notifications",),
              BottomNavigationBarItem(icon: GestureDetector(child: Icon(Icons.settings), onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context){return SettingsScreen();})); },), label: "Settings",),
            ]
           ),
          ), ); }}
