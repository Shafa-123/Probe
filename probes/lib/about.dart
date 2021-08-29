import 'package:flutter/material.dart';

class About extends StatelessWidget {
  
  @override
  Widget build(BuildContext context)  => Scaffold(
    appBar: AppBar(
      title: Text('About'),
      centerTitle: true,
      backgroundColor: Colors.purple[400],
    ),
      body:  Container(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 10.0),
            child: Text("This is a basic Quiz App which is designed for a Project purpose.",
            style: TextStyle(
              fontFamily: "Hina",
              fontSize: 30.0,
            ),),
            
        ),
  );
}