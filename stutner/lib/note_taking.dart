import 'package:flutter/material.dart';

import 'app_drawer.dart';
import 'bottom_nav_bar.dart';

class NoteTakingPage extends StatefulWidget {
  const NoteTakingPage({super.key});

  @override
  State<NoteTakingPage> createState() => _NoteTakingPageState();
}

class _NoteTakingPageState extends State<NoteTakingPage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notereee',
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person_3,
            ),
          ),
        ],
      ),
      body: const Column(
        children: [
          Center(
            child: Text("note taking"),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      bottomNavigationBar: StutnerBottomNavBar(),
    );
  }
}
