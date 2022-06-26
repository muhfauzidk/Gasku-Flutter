import 'package:flutter/material.dart';
import 'package:gasku/Screens/Welcome/components/background.dart';
import 'package:flutter_svg/svg.dart';

class Body1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/gaskuwelcomepage1.svg",
              height: size.height * 0.55,
            ),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
