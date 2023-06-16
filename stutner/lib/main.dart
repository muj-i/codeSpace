import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const StutnerApp());
}

class StutnerApp extends StatelessWidget {
  const StutnerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StutnerApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      home: const StutnerHomePage(),

    );
  }
}