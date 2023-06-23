import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
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
    return ThemeProvider(
      themes: [
        AppTheme
            .light(), // This is standard light theme (id is default_light_theme)
        AppTheme
            .dark(), // This is standard dark theme (id is default_dark_theme)
        AppTheme(
          id: "custom_theme", // Id(or name) of the theme(Has to be unique)
          description: "My Custom Theme", // Description of theme
          data: ThemeData(
            // Real theme data
            primaryColor: Colors.black,
            hintColor: Colors.red,
          ),
        ),
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            theme: ThemeProvider.themeOf(themeContext).data,
            title: 'Material App',
            home: HomeScreen(),
          ),
        ),
      ),
    );
  }
}













// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ThemeProvider(
//       saveThemesOnChange: true,
//       loadThemeOnInit: true,
//       themes: <AppTheme>[
//         AppTheme.light(id: 'light'),
//         AppTheme.dark(id: 'dark'),
//       ],
//       child: MaterialApp(
//         title: 'Todo',
//         home: HomeScreen(),

//         // themeMode: ThemeMode.light,
//         // theme: ThemeData(
//         //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
//         //   useMaterial3: true,
//         // ),
//         // darkTheme: ThemeData(
//         //   brightness: Brightness.dark,
//         //   useMaterial3: true,
//         // ),
//         debugShowCheckedModeBanner: false,
//         // theme: ThemeData(
//         //     brightness: Brightness.light,
//         //     primarySwatch: Colors.red,
//         //
//         //
//         // ),
//         // darkTheme: ThemeData(
//         //     brightness: Brightness.dark,
//         //     primarySwatch: Colors.purple,
//       ),
//     );
//   }
// }
