import 'package:flutter/material.dart';
import 'package:stutner/pages/homePages/constants.dart';
import 'package:stutner/utilitis/my_container.dart';
import 'package:stutner/utilitis/my_tile.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      //backgroundColor: myBackGroundColor,
      body: Row(
        children: [
          myDrawer,
          Expanded(
              flex: 2,
              child: Column(
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
              )),
          Expanded(
              child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.orange,
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
