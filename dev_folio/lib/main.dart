import 'package:dev_folio/responsize/desktop_scaffold.dart';
import 'package:dev_folio/responsize/mobile_scaffold.dart';
import 'package:dev_folio/responsize/responsive_layout.dart';
import 'package:dev_folio/responsize/tablet_scaffold.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileScaffold: const MobileScaffold(),
        tabletScaffold: const TabletScaffold(),
        desktopScaffold: const DesktopScaffold(),
      ),
    );
  }
}
