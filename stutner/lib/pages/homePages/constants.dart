import 'package:flutter/material.dart';
//import 'package:stutner/main.dart';
//import 'responsize/responsive_layout.dart';

var myBackGroundColor = Colors.grey[300];

var myAppBar = AppBar(
  backgroundColor: Colors.grey[900],
);

var myDrawer = Drawer(
  backgroundColor: Colors.grey[300],
  child: Builder(builder: (context) {
    return Column(
      children: [
        DrawerHeader(child: Icon(Icons.account_circle_sharp)),
        ListTile(
          leading: Icon(Icons.home),
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          title: Text('D A S H B O A R D'),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('M E S S A G E'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('S E T T I N G S'),
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('L O G O U T'),
        )
      ],
    );
  }),
);
