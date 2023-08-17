import 'package:flutter/material.dart';
import 'bedroom_screen.dart';
import 'home_screen.dart';
import 'automate_screen.dart';
import 'fav_screen.dart';
import 'notification_screen.dart';
import 'settings_screen.dart';

class LightScreen extends StatefulWidget {
   
  @override
  State<LightScreen> createState() => _LightScreenState();
}

class _LightScreenState extends State<LightScreen> {
  bool isOn = true;
  String selectedMode = 'Day';
  double intensity = 0.5;

  final List<Map<String, dynamic>> items = [
    {'icon': Icons.lightbulb_outline, 'text': 'Bed Lamp'},
    {'icon': Icons.wb_sunny_outlined, 'text': 'Dimmer'},
    {'icon': Icons.lightbulb_outline, 'text': 'Tube Light'},
    {'icon': Icons.lightbulb_outline, 'text': 'Bulb 1'},
    {'icon': Icons.lightbulb_outline, 'text': 'Bulb 2'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            
            items:[
            BottomNavigationBarItem(icon: GestureDetector(child: Icon(Icons.home), onTap:() {  Navigator.push(context, MaterialPageRoute(builder: (context){return HomeScreen();}));} ), label: "Home", backgroundColor: Colors.purple),
             BottomNavigationBarItem(icon: GestureDetector(child: Icon(Icons.cloud), onTap:() {  Navigator.push(context, MaterialPageRoute(builder: (context){return AutomateScreen();}));} ,), label: "Automation", ),
              BottomNavigationBarItem(icon: GestureDetector(child: Icon(Icons.favorite_outline), onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context){return FavScreen();})); },), label: "Favourite",),
              BottomNavigationBarItem(icon: GestureDetector(child: Icon(Icons.notifications), onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context){return NotificationScreen();})); },), label: "Notifications",),
              BottomNavigationBarItem(icon: GestureDetector(child: Icon(Icons.settings), onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context){return SettingsScreen();})); },), label: "Settings",),
            ]
           ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){return BedroomScreen();}));
            },
          ),
          title: Center(
            child: Text(
              'Lighting',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Horizontally scrollable list of cards
              Container(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return CustomCard(
                      icon: items[index]['icon'],
                      text: items[index]['text'],
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
            
              Row(
                children: [
                  Text('Bed'),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isOn = !isOn;
                      });
                    },
                    child: Text(isOn ? 'ON' : 'OFF'),
                    style: ElevatedButton.styleFrom(
                      primary: isOn ? Colors.purple : Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
             
              Center(
                child: Image.asset('lib/assets/lamp.jpg'), 
              ),
              SizedBox(height: 20),
             
              Row(
                children: [
                  Text('Mode'),
                  Spacer(),
                  Row(
                    children: [
                      ClickableText('Day', handleModeClick, selectedMode == 'Day'),
                      ClickableText('Evening', handleModeClick, selectedMode == 'Evening'),
                      ClickableText('Night', handleModeClick, selectedMode == 'Night'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              
              Row(
                children: [
                  Text('Intensity'),
                  Spacer(),
                  Expanded(
                    child: Slider(
                      value: intensity,
                      onChanged: (double value) {
                        setState(() {
                          intensity = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Text and colored circles
              Row(
                children: [
                  Text('Colors'),
                  Spacer(),
                  Container(
                    height: 30,
                    child: Row(
                      children: [
                        CircleAvatar(backgroundColor: Colors.red, radius: 15),
                        SizedBox(width: 10),
                        CircleAvatar(backgroundColor: Colors.green, radius: 15),
                        SizedBox(width: 10),
                        CircleAvatar(backgroundColor: Colors.blue, radius: 15),
                        SizedBox(width: 10),
                        CircleAvatar(backgroundColor: Colors.yellow, radius: 15),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(), // Add some flexible space at the bottom
            ],
          ),
        ),
      ),
    );
  }

  void handleModeClick(String mode) {
    setState(() {
      selectedMode = mode;
    });
  }
}

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String text;

  CustomCard({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
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
            text,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class ClickableText extends StatelessWidget {
  final String text;
  final Function(String) onTap;
  final bool isSelected;

  ClickableText(this.text, this.onTap, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(text),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.purple : Colors.black,
          ),
        ),
      ),
    );
  }
}