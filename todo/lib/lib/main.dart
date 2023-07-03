import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:theme_provider/theme_provider.dart';
import 'home_screen.dart';

void main() async {
  //init the hive
  await Hive.initFlutter();
  // open a box
  var box = await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themes: [
        AppTheme(
          data: ThemeData.light().copyWith(
            useMaterial3: true,
            colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.indigo.shade900),
          ),
          id: 'custom_theme_light',
          description: 'Dark Theme',
        ),
        AppTheme(
          id: "custom_theme_dark",
          description: "Dark Theme",
          data: ThemeData.dark(
            useMaterial3: true,
          ),
        ),
      ],
      defaultThemeId: 'custom_theme_dark',
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            theme: ThemeProvider.themeOf(themeContext).data,
            title: 'Material App',
            home: HomeScreen(),
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}
