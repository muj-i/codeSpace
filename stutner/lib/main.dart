import 'package:flutter/material.dart';
import 'package:stutner/pages/homePages/responsize/desktop_scaffold.dart';
import 'package:stutner/pages/homePages/responsize/mobile_scaffold.dart';
import 'package:stutner/pages/homePages/responsize/responsive_layout.dart';
import 'package:stutner/pages/homePages/responsize/tablet_scaffold.dart';
import 'package:stutner/pages/task_management.dart';
import 'package:theme_provider/theme_provider.dart';

void main() {
  runApp(const StutnerApp());
}

class StutnerApp extends StatelessWidget {
  const StutnerApp({super.key});

  // This widget is the root of your application.
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
            title: 'StutnerApp',
            theme: ThemeProvider.themeOf(themeContext).data,
            home: ResponsiveLayout(
              mobileScaffold: const MobileScaffold(),
              tabletScaffold: const TabletScaffold(),
              desktopScaffold: const DesktopScaffold(),
            ),
            initialRoute: '/',
            routes: {
              // '/': (context) => ResponsiveLayout(
              //     mobileScaffold: MobileScaffold(),
              //     tabletScaffold: TabletScaffold(),
              //     desktopScaffold: DesktopScaffold()),
              '/todo': (context) => TaskManagementScreen(),
            },
          ),
        ),
      ),
    );
  }
}
