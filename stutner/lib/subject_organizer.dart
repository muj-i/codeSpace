import 'package:flutter/material.dart';

import 'app_drawer.dart';
import 'bottom_nav_bar.dart';

class SubjectOrganizerPage extends StatefulWidget {
  const SubjectOrganizerPage({super.key});

  @override
  State<SubjectOrganizerPage> createState() => _SubjectOrganizerPageState();
}

class _SubjectOrganizerPageState extends State<SubjectOrganizerPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ////
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text(
          'Subject Organizer',
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
      body:
      const Column(

        children: [

          Center(
            child: Text("subject orga"),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      bottomNavigationBar: const StutnerBottomNavBar(),
    );
  }
}