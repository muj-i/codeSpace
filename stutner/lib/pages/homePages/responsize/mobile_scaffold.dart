import 'package:flutter/material.dart';
import 'package:stutner/pages/homePages/constants.dart';
import 'package:stutner/utilitis/my_tile.dart';

import '../../../utilitis/my_container.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      //backgroundColor: myBackGroundColor,
      drawer: myDrawer,
      body: Column(
        children: [
          MyContainer(),
          Expanded(
              child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return MyTile();
            },
          ))
        ],
      ),
    );
  }
}
