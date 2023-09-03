import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Horizontal Grid Row Example'),
        ),
        body: HorizontalGridRow(),
      ),
    );
  }
}

class HorizontalGridRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Enable horizontal scrolling
      child: Row(
        children: List.generate(
          10, // Adjust the number of items as needed
          (index) {
            return Container(
              height: 200, // Adjust the width of your grid items
              margin: EdgeInsets.all(10.0),
              child: Card(
                child: Center(
                  child: Text(
                    'Item $index',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
