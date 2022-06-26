import 'package:flutter/material.dart';
import 'package:gasku/Comm/comHelper.dart';
import 'package:gasku/Comm/genTextFormField.dart';
import 'package:gasku/DatabaseHandler/DbHelper.dart';
import 'package:gasku/Model/UserModel.dart';
import 'package:gasku/Screens/LoginForm.dart';
import 'package:gasku/Screens/profile_pic.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Home Screen",
      home: kemitraan(),
    ));

class kemitraan extends StatefulWidget {
  @override
  _kemitraanState createState() => _kemitraanState();
}

class _kemitraanState extends State<kemitraan> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              child: Center(              
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0)),
                ),
              )
            ),           
          ],
        ),
      ),
    );
  }
}