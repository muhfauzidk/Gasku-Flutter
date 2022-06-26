import 'package:flutter/material.dart';
import 'package:gasku/Screens/Welcome/welcome_screen.dart';
import 'Screens/LoginForm.dart';
import 'Screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gasku',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 27, 195, 227),
      ),
      home: WelcomeScreen(),
    );
  }
}
