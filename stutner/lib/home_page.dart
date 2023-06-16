import 'package:flutter/material.dart';
import 'package:stutner/app_drawer.dart';
import 'package:stutner/note_taking.dart';
import 'package:stutner/subject_organizer.dart';

import 'bottom_nav_bar.dart';

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
        title: const Text(
          'Stutner',
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
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SubjectOrganizerPage()));
            },
            child: const Text('go to sub org'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const NoteTakingPage()));
            },
            child: const Text('go to note'),
          ),
          const Center(
            child: Text("homeee"),
          ),
        ],
      ),
      drawer: const AppDrawer(),

      bottomNavigationBar: StutnerBottomNavBar(),
    );
  }
}