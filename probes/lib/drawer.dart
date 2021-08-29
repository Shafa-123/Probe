import 'package:flutter/material.dart';
import 'package:probes/home.dart';
// ignore: import_of_legacy_library_into_null_safe
import './about.dart';

import './logout.dart';
// import './userpage.dart';

class Menu extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  get onClicked => null;

  @override
  Widget build(BuildContext context) {
    // final name = 'Linky';
    // final email = 'linky@gmail.com';
    // final urlImage =
    //     'https://images.unsplash.com/photo-1547989013-9be9d00dad2e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YWxwaGFiZXQlMjBsfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';

    return Drawer(
      child: Material(
        color: Colors.purple[400],
        child: ListView(
          padding: padding,
          children: <Widget>[
            // buildHeader(
              // urlImage: urlImage,
              // name: name,
              // email: email,
            //   onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => UserPage(
            //       name: name,
            //       url: urlImage,
            //       urlImage: '',
            //     ),
            //   )),
            // ),
            // const SizedBox(height: 16),
            // buildMenuItem(
            //   text: 'People',
            //   icon: Icons.people,
            //   onClicked: () => selectedItem(context, 0),
            // ),
            // const SizedBox(height: 16),
            // buildMenuItem(
            //   text: 'Account',
            //   icon: Icons.account_box,
            //   onClicked: () => selectedItem(context, 1),
            // ),
            const SizedBox(height: 50),
            buildMenuItem(
              text: 'Home',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'About',
              icon: Icons.info,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 16),
            Divider(color: Colors.white30),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Logout',
              icon: Icons.logout,
              onClicked: () => selectedItem(context, 2),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(children: <Widget>[
            CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )
              ],
            )
          ]),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hovercolor = Colors.white12;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hovercolor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      // case 0:
      //   Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => PeoplePage(),
      //   ));
      //   break;
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Home(), 
        ));

        break;


      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => About(),
        ));

        break;

      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Logout(),
        ));

        break;
    }
  }
}
