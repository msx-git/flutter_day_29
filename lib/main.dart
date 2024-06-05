import 'package:flutter/material.dart';

import 'constants/app_theme.dart';
import 'utils/route_generator.dart';
import 'views/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: const MainPage(),
      onGenerateRoute: (settings) => RouteGenerator.generate(settings),
    );
  }
}
