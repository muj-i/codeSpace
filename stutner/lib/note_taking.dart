import 'package:flutter/material.dart';

import 'app_drawer.dart';
import 'bottom_nav_bar.dart';

class NoteTakingPage extends StatefulWidget {
  const NoteTakingPage({super.key});

  @override
  State<NoteTakingPage> createState() => _NoteTakingPageState();
}

class _NoteTakingPageState extends State<NoteTakingPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ////
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text(
          'pep',
          style: TextStyle(fontSize: 24),
        ),

      ),
      body:
      const Column(

        children: [

          Center(
            child: Text("pep"),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      bottomNavigationBar: const StutnerBottomNavBar(),
    );
  }
}