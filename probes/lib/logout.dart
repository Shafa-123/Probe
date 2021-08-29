import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';

class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
        centerTitle: true,
        backgroundColor: Colors.purple[400],
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(32),
          children: [
            buildlogout(),
            const SizedBox(height: 24),
            // ignore: deprecated_member_use
            MaterialButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Colors.purple[400],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 500.0,
                horizontal: 20.0
                ),
              child: Center(
               child: Text("Press Back Button after Submitting",
               style: TextStyle(
                 color: Colors.grey[400],
                 fontSize: 15.0,
               ),),
               
              )
            ), 
            ],
        ),
      ));

  Widget buildlogout() => TextField(
        decoration: InputDecoration(
          hintText: 'Enter username/mail',
          labelText: 'Enter username/mail',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
      );
}
