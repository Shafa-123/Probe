import 'package:flutter/material.dart';
import './home.dart';

// ignore: must_be_immutable
class resultpage extends StatefulWidget {
  int marks;
  resultpage({Key? key, required this.marks}) : super(key: key);
  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage> {
  String message = "";

  @override
  void initState() {
    if (marks < 15) {
      message = "You Should Try Hard..\n" + "You Scored $marks";
    } else if (marks < 20) {
      message = "You Can Do Better..\n" + "You Scored $marks";
    } else {
      message = "You Did Very Well..\n" + "You Scored $marks";
    }
    super.initState();
  }

  int marks;
  _resultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        title: Text(
          "Result",
          style: TextStyle(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 15.0,
              ),
              child: Center(
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: "Lora",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
              ),
          ElevatedButton(    
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Home(),
              ));
            },
            child: Text(
              "Continue",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            style: ElevatedButton.styleFrom(primary: Colors.purple ),
          ),
        ],
      ),
    );
  }
}
