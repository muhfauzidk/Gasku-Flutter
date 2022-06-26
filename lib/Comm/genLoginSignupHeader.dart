import 'package:flutter/material.dart';

class genLoginSignupHeader extends StatelessWidget {
  String headerName;

  genLoginSignupHeader(this.headerName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 50.0),
          Text(
            headerName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 40.0),
          ),
          SizedBox(height: 10.0),
          Image.asset(
            "assets/images/gaskulogo.png",
            height: 300.0,
            width: 300.0,
          ),
          SizedBox(height: 10.0),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
