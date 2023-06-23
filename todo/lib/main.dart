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
        AppTheme(
          data: ThemeData.light().copyWith(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
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














      // themeMode: ThemeMode.light,
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
