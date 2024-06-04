import 'package:flutter/material.dart';
import 'package:flutter_day_29/views/pages/main_page.dart';

import 'views/pages/classwork/bottom_navigation_stacked.dart';
import 'views/pages/classwork/navigation_rails_page.dart';

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
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        )
      ),
      home: PageView(
        children: const [
          MainPage(),
          NavigationRails(),
          BottomNavigationStacked(),
        ],
      ),
    );
  }
}
