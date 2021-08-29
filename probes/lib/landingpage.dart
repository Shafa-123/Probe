// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

class LandingPage extends StatelessWidget {
  
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                Object? user = snapshot.data;

                // ignore: unnecessary_null_comparison
                if (user == null) {
                  return Login();
                } else {
                  return Home();
                }
              }

              return Scaffold(
                body: Center(
                  child: Text("Checking Authentication.."),
                ),
              );
            },
          );
        }
        return Scaffold(
          body: Center(
            child: Text("Connecting to the app.."),
          ),
        );
      },
    );
      
  }
}