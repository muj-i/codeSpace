import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Portfolio'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Project 1'),
            subtitle: Text('This is a description of Project 1.'),
          ),
          ListTile(
            title: Text('Project 2'),
            subtitle: Text('This is a description of Project 2.'),
          ),
          ListTile(
            title: Text('Project 3'),
            subtitle: Text('This is a description of Project 3.'),
          ),
        ],
      ),
    );
  }
}
