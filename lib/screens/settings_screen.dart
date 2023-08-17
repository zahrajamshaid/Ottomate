import 'package:flutter/material.dart';
import 'package:ottomate/custom_widgets/custom_widgets.dart';
import 'home_screen.dart';
import 'automate_screen.dart';
import 'fav_screen.dart';
import 'notification_screen.dart';


class SettingsScreen extends StatelessWidget {
   final List<SettingOption> settingsOptions = [
    SettingOption(
      mainText: 'New Brands',
      subText: 'Add new devices to your system',
      icon: Icons.add,
    ),
    SettingOption(
      mainText: 'Profile',
      subText: 'Edit your personal information',
      icon: Icons.person,
    ),
     SettingOption(
      mainText: 'Account',
      subText: 'Manage accounts connected to a System',
      icon: Icons.account_box,
    ),
     SettingOption(
      mainText: 'Support',
      subText: 'Need help and support',
      icon: Icons.help,
    ),
  ];
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
            "Settings",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black38,
           
            ),
          ), ), 
          body: ListView.builder(
        itemCount: settingsOptions.length,
        itemBuilder: (context, index) {
          return SettingCard(
            option: settingsOptions[index],
          );
        },
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
