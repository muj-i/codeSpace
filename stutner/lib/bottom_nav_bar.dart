import 'package:flutter/material.dart';
import 'package:stutner/task_management.dart';

import 'home_page.dart';

class StutnerBottomNavBar extends StatefulWidget {
  const StutnerBottomNavBar({super.key});

  @override
  State<StutnerBottomNavBar> createState() => _StutnerBottomNavBarState();
}

class _StutnerBottomNavBarState extends State<StutnerBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Perform navigation or other actions based on the selected index
    switch (index) {
      case 0:
      // Navigate to the home screen
      Navigator.pushReplacementNamed(context,
          MaterialPageRoute(builder: (_) => const StutnerHomePage()) as String);
        break;
      case 1:
      // Navigate to the preference screen
      Navigator.pushReplacementNamed(context,
          MaterialPageRoute(builder: (_) => const PreferencePage()) as String);
        break;
    // Add more cases for additional navigation items if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      onTap: _onItemTapped,
      currentIndex: _selectedIndex,

      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: 'Home'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.settings_suggest_rounded), label: 'Preferance'),
      ],
    );
  }
}



