import 'dart:async';
import 'package:flutter/material.dart';
import 'package:probes/landingpage.dart';
import 'package:probes/login.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LandingPage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Welcome\n Be ready to Probe",
          style: TextStyle(
            fontSize: 40.0,
            color: Colors.purple[400],
            fontFamily: "Hina",
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
