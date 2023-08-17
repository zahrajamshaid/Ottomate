import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'fav_screen.dart';
import 'notification_screen.dart';
import 'settings_screen.dart';

class AutomateScreen extends StatefulWidget {

  @override
  State<AutomateScreen> createState() => _AutomateScreenState();
}

class _AutomateScreenState extends State<AutomateScreen> {
  bool isScenesSelected = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Automation',
            style: TextStyle(color: Colors.black),
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
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isScenesSelected = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: isScenesSelected ? Colors.purple : Colors.transparent,
                              width: 3,
                            ),
                          ),
                        ),
                        child: Text(
                          'Scenes',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: isScenesSelected ? FontWeight.bold : FontWeight.normal,
                            color: isScenesSelected ? Colors.purple : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isScenesSelected = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: !isScenesSelected ? Colors.purple : Colors.transparent,
                              width: 3,
                            ),
                          ),
                        ),
                        child: Text(
                          'Schedule',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: !isScenesSelected ? FontWeight.bold : FontWeight.normal,
                            color: !isScenesSelected ? Colors.purple : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              
              if (isScenesSelected) ...[
                Center(
                  child: Text(
                    'Scenes let you create personalized environments\naccording to your mood',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 20),
               
                Expanded(
                  child: buildScenesCards(),
                ),
              ],
      
              if (!isScenesSelected) ...[
                Expanded(
                  child: buildScheduleCards(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget buildScenesCards() {
    return Container(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CustomCard(
            icon: Icons.sunny,
            title: 'GoodMorning',
            subtitle: '5 devices',
            onActivate: () {
              // Implement the functionality when the "Activate" button is pressed
            },
          ),
          SizedBox(width: 16),
          CustomCard(
            icon: Icons.night_shelter,
            title: 'GoodNight',
            subtitle: '2 devices',
            onActivate: () {
              // Implement the functionality when the "Activate" button is pressed
            },
          ),
         SizedBox(width: 16),
          CustomCard(
            icon: Icons.sunny,
            title: 'Afternoon',
            subtitle: '7 devices',
            onActivate: () {
              // Implement the functionality when the "Activate" button is pressed
            },
          ),
        ],
      ),
    );
  }

  Widget buildScheduleCards() {
    return ListView(
      children: [
        buildScheduleCard(
          image: 'lib/assets/sch.jpg', 
          title: 'Going out',
          subtitle: '15 devices',
        ),
        SizedBox(height: 10),
        buildScheduleCard(
          image: 'lib/assets/sch.jpg',
          title: 'Dinner',
          subtitle: '15 devices',
        ),
        SizedBox(height: 10),
        buildScheduleCard(
          image: 'lib/assets/sch.jpg', 
          title: 'Afternoon',
          subtitle: '7 devices',
        ),
        // Add more cards here if needed
      ],
    );
  }

  Widget buildScheduleCard({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Image on the left
          Image.asset(
            image,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          // Two texts "Going out" and "15 devices"
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          Spacer(),
          // Calendar icon on the right
          Icon(Icons.calendar_today, size: 30),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onActivate;

  CustomCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onActivate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.black),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: onActivate,
            child: Text(
              'Activate',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}