

import 'package:flutter/material.dart';


class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final emailController = TextEditingController();
  String password = '';
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();

    emailController.addListener(() => setState(() {}));
  }

  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Account'),
          centerTitle: true,
          backgroundColor: Colors.purple[400],
        ),
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(32),
            children: [
              buildEmail(),
              const SizedBox(height: 24),
              buildPassword(),
              const SizedBox(height: 24),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: (){},
                child: Text("SignIn",style: TextStyle(
                color: Colors.white70,
                letterSpacing: 2.0,),
                ),
                color: Colors.purple[400],

              
              ),
            ],
          ),
        ),
      );

  Widget buildEmail() => TextField(
        controller: emailController,
        decoration: InputDecoration(
          hintText: 'name@example.com',
          labelText: 'Email',
          suffixIcon: emailController.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => emailController.clear(),
                ),
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
      );

 Widget buildPassword() => TextField(
         decoration: InputDecoration(
          hintText: 'Your Password...',
          labelText: 'Password',
          border: OutlineInputBorder(),
 )
 );
}
