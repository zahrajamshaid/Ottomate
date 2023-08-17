import 'package:flutter/material.dart';
import '../custom_widgets/custom_widgets.dart';
import 'bedroom_screen.dart';
import 'automate_screen.dart';
import 'fav_screen.dart';
import 'notification_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen ({super.key});

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
            "My Home",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black38,
           
            ),
          ), ),
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
                    children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: 100,
              child: Container(
                        
                color: Colors.purple,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('lib/assets/home.jpg', height: 50),
                    SizedBox(width: 20),
                    Container(
                      width: 2,
                      height: 100,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'All devices',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '45 devices',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                   crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
              
              
            children: [
             
             CenteredImageCard(imageUrl:'lib/assets/bed.jpg' ,title:'Bedroom' , subtitle:'15 devices' , onTap: (context) => BedroomScreen(),),
             CenteredImageCard(imageUrl:'lib/assets/live.jpg' ,title:'LivingRoom' , subtitle:'12 devices' , onTap:(context) => BedroomScreen(), ),
             CenteredImageCard(imageUrl:'lib/assets/bath.jpg' ,title:'BathRoom' , subtitle:'8 devices' , onTap:(context) => BedroomScreen(), ),
             CenteredImageCard(imageUrl:'lib/assets/kitchen.jpg' ,title:'Kitchen' , subtitle:'18 devices' , onTap:(context) => BedroomScreen(), ),
             CenteredImageCard(imageUrl:'lib/assets/store.jpg' ,title:'Store' , subtitle:'3 devices' ,onTap: (context) => BedroomScreen(),),
             CenteredImageCard(imageUrl:'lib/assets/study.jpg' ,title:'StudyRoom' , subtitle:'5 devices' ,onTap: (context) => BedroomScreen(),)]
            ),
                    ),
                 
                ],
              ),
            ),
          
        );
      
    
  }
}
          