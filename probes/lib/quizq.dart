import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:probes/resultpage.dart';

// ignore: must_be_immutable
class Getjson extends StatelessWidget {
  String langname;
  Getjson(this.langname);
  String assettoload = "";

  setasset() {
    if (langname == "Science") {
      assettoload = "asset/science.json";
    } else if (langname == "History") {
      assettoload = "asset/history.json";
    } else if (langname == "Mathematics") {
      assettoload = "asset/math.json";
    } else if (langname == "Geography") {
      assettoload = "asset/geography.json";
    }
  }

  get context => null;

  @override
  Widget build(BuildContext context) {
    setasset();

    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(assettoload, cache: false),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        // ignore: unnecessary_null_comparison
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text("Loading"),
            ),
          );
        } else {
          return Quizq(mydata: mydata);
        }
      },
    );
  }
}

// ignore: must_be_immutable
class Quizq extends StatefulWidget {
  var mydata;

  Quizq({Key? key, @required this.mydata}) : super(key: key);

  @override
  _QuizqState createState() => _QuizqState(mydata);
}

class _QuizqState extends State<Quizq> {
  var mydata;
  _QuizqState(this.mydata);

  Color colortoshow = Colors.purple;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  int timer = 15;
  String showtimer = "15";

  Map<String, Color> buttoncolor = {
    "a": Colors.purple,
    "b": Colors.purple,
    "c": Colors.purple,
    "d": Colors.purple,
  };

  bool canceltimer = false;

  @override
  void initState() {
    super.initState();
  }

  void nextquestion() {
    setState(() {
      if (i < 5) {
        i++;
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return resultpage(marks: marks);
        }));
      }
      buttoncolor["a"] = Colors.purple;
      buttoncolor["b"] = Colors.purple;
      buttoncolor["c"] = Colors.purple;
      buttoncolor["d"] = Colors.purple;
    });
  }

  void checkanswer(String k) {
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      marks = marks + 5;
      colortoshow = right;
    } else {
      colortoshow = wrong;
    }
    setState(() {
      buttoncolor[k] = colortoshow;
      canceltimer = true;
    });

    Timer(Duration(seconds: 2), nextquestion);
  }

  Future<bool> backPressed() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Exit From The App'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    ).then((value) => value ?? false);
  }

  get builder => null;

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          mydata[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Hina',
            fontSize: 25.0,
          ),
          maxLines: 1,
        ),
        color: buttoncolor[k],
        splashColor: Colors.purple[700],
        highlightColor: Colors.purple[700],
        minWidth: 200.0,
        height: 40.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return new WillPopScope(
      onWillPop: backPressed,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  mydata[0][i.toString()],
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Hina',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    choicebutton('a'),
                    choicebutton('b'),
                    choicebutton('c'),
                    choicebutton('d'),
                  ],
                ),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: Container(
            //     alignment: Alignment.topCenter,
            //     child: Center(
            //       child: Text(
            //         showtimer,
            //         style: TextStyle(
            //           fontSize: 35.0,
            //           fontWeight: FontWeight.bold,
            //           fontFamily: "Times New Roman",
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
