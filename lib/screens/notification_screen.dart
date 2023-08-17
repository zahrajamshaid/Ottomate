import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'automate_screen.dart';
import 'fav_screen.dart';
import 'settings_screen.dart';

class NotificationScreen extends StatelessWidget {
  

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
            "Notifications",
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
           body: NotificationsScreen(),
          ), ); }}
class NotificationsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notificationsData = [
    {
      'date': '2023-08-01', // Example date format (you can use DateTime or any other format)
      'notifications': [
        {'title': 'Notification 1', 'description': 'This is notification 1'},
        {'title': 'Notification 2', 'description': 'This is notification 2'},
      ],
    },
    {
      'date': '2023-08-02',
      'notifications': [
        {'title': 'Notification 3', 'description': 'This is notification 3'},
        {'title': 'Notification 4', 'description': 'This is notification 4'},
        {'title': 'Notification 5', 'description': 'This is notification 5'},
      ],
    },
    // Add more notifications for different dates as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notificationsData.length,
      itemBuilder: (context, index) {
        final date = notificationsData[index]['date'];
        final notifications = notificationsData[index]['notifications'];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.orange,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Text(
                date,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final title = notifications[index]['title'];
                final description = notifications[index]['description'];

                return ListTile(
                  title: Text(title),
                  subtitle: Text(description),
                );
              },
            ),
          ],
        );
      },
    );
  }
}