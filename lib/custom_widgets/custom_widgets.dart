import 'package:flutter/material.dart';


class CenteredImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final Widget Function(BuildContext) onTap;

  CenteredImageCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: onTap),
      ),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 150, // Adjust the height as per your requirement
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      subtitle,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final void Function() onActivate;

  CustomCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onActivate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.grey[700],
            ),
            SizedBox(height: 16.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              subtitle,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: onActivate,
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Activate',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class SettingOption {
  final String mainText;
  final String subText;
  final IconData icon;

  SettingOption({
    required this.mainText,
    required this.subText,
    required this.icon,
  });
}

class SettingCard extends StatelessWidget {
  final SettingOption option;

  SettingCard({required this.option});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: Icon(option.icon),
        title: Text(option.mainText),
        subtitle: Text(option.subText),

        onTap: () {
          // Handle the tap event for the setting option
          print('${option.mainText} tapped!');
        },
      ),
    );
  }
}

class AnimatedText extends StatefulWidget {
  final String text;

  AnimatedText(this.text);

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  late String _displayedText;
  late int _characterIndex;

  @override
  void initState() {
    super.initState();
    _displayedText = "";
    _characterIndex = 0;
    _startTextAnimation();
  }

  void _startTextAnimation() {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _displayedText = widget.text.substring(0, _characterIndex);
        _characterIndex++;
        if (_characterIndex <= widget.text.length) {
          _startTextAnimation();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText,
      style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.purple, // Purple text color
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  RoundedButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
