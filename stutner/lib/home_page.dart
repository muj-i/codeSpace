import 'package:flutter/material.dart';

class StutnerHomePage extends StatefulWidget {
  const StutnerHomePage({super.key});

  @override
  State<StutnerHomePage> createState() => _StutnerHomePageState();
}

class _StutnerHomePageState extends State<StutnerHomePage> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stutner',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text("mm"),
          ),
        ],
      ),
      drawer: Drawer(

      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_sharp), label: 'Calneder'),
          BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_suggest_rounded), label: 'Preferance'),
        ],
      ),
    );
  }
}
