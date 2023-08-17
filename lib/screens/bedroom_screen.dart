import 'package:flutter/material.dart';
import '../custom_widgets/custom_widgets.dart';
import 'home_screen.dart';
import 'Automate_Screen.dart';
import 'fav_screen.dart';
import 'light_screen.dart';
import 'notification_screen.dart';
import 'settings_screen.dart';

class BedroomScreen extends StatelessWidget {
  const BedroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context){return HomeScreen();}));
            },
          ),
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
        body: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('lib/assets/bed.jpg'), 
            ),
            SizedBox(height: 16),
            Text(
              'Bedroom',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
crossAxisSpacing: 15,
mainAxisSpacing: 15,
          children: [ CenteredImageCard(imageUrl:'lib/assets/light.jpg' ,title:'Lighting' , subtitle:'6 devices' , onTap: (context) => LightScreen(),),
           CenteredImageCard(imageUrl:'lib/assets/HVAC.jpg' ,title:'HVAC' , subtitle:'3 devices' , onTap:(context) => HomeScreen(),),
           CenteredImageCard(imageUrl:'lib/assets/IR.jpg' ,title:'BathRoom' , subtitle:'2 devices' , onTap:(context) => HomeScreen() ,),
           CenteredImageCard(imageUrl:'lib/assets/curtains.jpg' ,title:'Kitchen' , subtitle:'2 devices' , onTap:(context) => HomeScreen(),),
           CenteredImageCard(imageUrl:'lib/assets/sensor.jpg' ,title:'Store' , subtitle:'2 devices' ,onTap: (context) => HomeScreen(),),
           CenteredImageCard(imageUrl:'lib/assets/security.jpg' ,title:'StudyRoom' , subtitle:'2 devices' ,onTap: (context) => HomeScreen(),)]
          ),
              ),
        
        
        
        
        
       

           
       ] ),)

      );
  
  }
}