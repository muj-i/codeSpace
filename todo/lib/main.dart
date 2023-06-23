import 'package:flutter/material.dart';
import 'home.dart';

// TODO 1 - Button for switch theme
// TODO 2 - Update todo
// TODO 3 - Update the ui design of bottom sheet

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      home: HomeScreen(),

      //themeMode: myThemeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //     brightness: Brightness.light,
      //     primarySwatch: Colors.red,
      //
      //
      // ),
      // darkTheme: ThemeData(
      //     brightness: Brightness.dark,
      //     primarySwatch: Colors.purple,
      //     )
    );
  }
}
