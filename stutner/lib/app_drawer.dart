import 'package:flutter/material.dart';
import 'package:stutner/home_page.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
              child: Padding(
                padding: EdgeInsets.all(9.0),
                child: Text(
                  "Module 5 Assignment",
                  style: TextStyle(fontSize: 44,
                  ),
                ),
              )),
          ListTile(
            leading: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.home),
            ),
            title: const Text("Home"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const StutnerHomePage()));
            },
          ),
        ],
      ),
    );
  }
}

