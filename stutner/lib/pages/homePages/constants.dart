import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_provider/theme_provider.dart';
//import 'package:stutner/main.dart';
//import 'responsize/responsive_layout.dart';

//var myBackGroundColor = Colors.grey[300];

var myAppBar = AppBar(
    title: Text("stutner"),
    //backgroundColor: Colors.grey[900],
    actions: [
      Builder(builder: (context) {
        return IconButton(
            icon: ThemeProvider.controllerOf(context).currentThemeId ==
                    'custom_theme_dark'
                ? const Icon(FontAwesomeIcons.lightbulb)
                : const Icon(FontAwesomeIcons.solidLightbulb),
            onPressed: () {
              ThemeProvider.controllerOf(context).nextTheme();
            });
      }),
    ]);

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
