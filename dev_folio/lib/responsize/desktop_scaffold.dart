import 'package:dev_folio/constants.dart';
import 'package:dev_folio/utilitis/my_container.dart';
import 'package:dev_folio/utilitis/my_tile.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: myBackGroundColor,
      body: Row(
        children: [
          myDrawer,
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 4,
                    child: SizedBox(
                      width: double.infinity,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return MyContainer();
                        },
                      ),
                    ),
                  ),
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
