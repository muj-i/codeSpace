
import 'package:flutter/material.dart';

class StutnerBottomNavBar extends StatelessWidget {
  const StutnerBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      onTap: (int index) {


      },
      items: [
        const BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_sharp), label: 'Calneder'),
        const BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: 'Home'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.settings_suggest_rounded), label: 'Preferance'),
      ],
    );
  }
}
