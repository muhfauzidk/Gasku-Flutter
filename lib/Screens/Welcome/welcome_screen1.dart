import 'package:flutter/material.dart';
import 'package:gasku/Screens/LoginForm.dart';
import 'package:gasku/Screens/Welcome/components/body1.dart';
import 'package:gasku/Screens/Welcome/welcome_screen.dart';


class WelcomeScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body1(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton.small(
              heroTag: "btnBack",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  ),
                );
              },
              child: Icon(Icons.arrow_back),
            ),
            FloatingActionButton.small(
              heroTag: "btnNext",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginForm();
                    },
                  ),
                );
              },
              child: Icon(Icons.arrow_forward),
            )
          ],
        ),
      )
    );
  }
}
