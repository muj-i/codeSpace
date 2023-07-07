import 'package:flutter/material.dart';

void main() {
  runApp(TravelPlannerApp());
}

class TravelPlannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TravelPlannerScreen(),
    );
  }
}

class TravelPlannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Planner'),
      ),
      body: Center(
        child: Text('Welcome to the Travel Planner!'),
      ),
    );
  }
}
