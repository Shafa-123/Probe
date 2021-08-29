import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:probes/quizq.dart';
import './drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> images = [
    "https://images.unsplash.com/photo-1507413245164-6160d8298b31?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
    "https://images.unsplash.com/photo-1596401057633-54a8fe8ef647?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80",
    "https://images.unsplash.com/photo-1578194475681-ba5fc5dd17e8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
    "https://images.unsplash.com/photo-1584974292709-5c2f0619971b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
  ];

  Widget customcard(String langname, String image) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Getjson(langname),
          ));
        },
        child: Material(
          elevation: 10.0,
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 3.0,
                  ),
                  child: Material(
                    child: Container(
                      height: 200.0,
                      width: 300.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.contain,
                          image: NetworkImage(image),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.grey[800],
                      fontFamily: 'Lora',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Probe"),
        centerTitle: true,
        backgroundColor: Colors.purple[400],
        elevation: 0.0,
      ),
      drawer: Menu(),
      body: ListView(children: [
        Column(children: <Widget>[
          Stack(children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Image(
                //Basic Image
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1504&q=80'),
              ),
            ),
            Positioned.fill(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                color: Colors.black.withOpacity(0.0),
              ),
            )),
            Center(
              child: Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(45.0),
                child: Text(
                  'Great minds meets here!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
        ]),
        SizedBox(
          //Use of SizedBox
          height: 30,
        ),
        customcard("Science", images[0]),
        customcard("History", images[1]),
        customcard("Mathematics", images[2]),
        customcard("Geography", images[3]),
      ]),
    );
  }
}
