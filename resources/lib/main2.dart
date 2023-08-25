import 'package:flutter/material.dart';
import 'package:resources/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Activity(),
    );
  }
}

///////////////////////////SnackBar
MySnackBar(message, context) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: (Text(message))));
}
//////////////////////////////////////////////////////

class Activity extends StatefulWidget {
  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
/////json
  var jsonItems = [
    {
      'img':
          'https://lh3.googleusercontent.com/a/AAcHTtepn_l7UbUPKA_1CoBzcptgpXaMEhYgq56U6dx7=s96-c-rg-br100',
      'title': 'mee'
    },
    {
      'img':
          'https://lh3.googleusercontent.com/a/AAcHTtepn_l7UbUPKA_1CoBzcptgpXaMEhYgq56U6dx7=s96-c-rg-br100',
      'title': 'muee'
    },
    {
      'img':
          'https://lh3.googleusercontent.com/a/AAcHTtepn_l7UbUPKA_1CoBzcptgpXaMEhYgq56U6dx7=s96-c-rg-br100',
      'title': 'miee'
    }
  ];

/////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resouces',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),

      //////////////////////////////////////

      body: ListView.builder(
        itemCount: jsonItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              mySnackbar(context,jsonItems[index]['title']);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: Image.network(
                jsonItems[index]['img']!,
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}
