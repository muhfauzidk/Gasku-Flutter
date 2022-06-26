import 'package:flutter/material.dart';
import 'package:gasku/Screens/Welcome/components/body.dart';
import 'package:gasku/Screens/Welcome/welcome_screen1.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      floatingActionButton: FloatingActionButton.small(
        child: Icon(
          Icons.arrow_forward,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return WelcomeScreen1();
              },
            ),
          );
        },
      ),
    );
  }
}
