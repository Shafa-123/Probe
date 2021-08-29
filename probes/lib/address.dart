import 'package:flutter/material.dart';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Address'),
        centerTitle: true,
        backgroundColor: Colors.purple[400],
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(32),
          children: [
            buildName(),
            const SizedBox(height: 24),
            buildCity(),
            const SizedBox(height: 24),
            buildAddress(),
            const SizedBox(height: 24),
            // ignore: deprecated_member_use
            RaisedButton(
                onPressed: (){},
                child: Text("Submit",style: TextStyle(
                color: Colors.white70,
                letterSpacing: 2.0,),
                ),
                color: Colors.purple[400],
            ),
            
          ],
        ),
      ));

  Widget buildName() => TextField(
        decoration: InputDecoration(
          hintText: 'Name',
          labelText: 'Your Name',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
      );

  Widget buildAddress() => TextField(
        decoration: InputDecoration(
          hintText: 'Address',
          labelText: 'House No.',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
      );

 Widget buildCity() => TextField(
        decoration: InputDecoration(
          hintText: 'City/Location',
          labelText: 'Location',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
      );

}
