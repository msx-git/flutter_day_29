import 'package:flutter/material.dart';

import 'views/bottom_navigation_stacked.dart';
import 'views/navigation_rails_page.dart';

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
      home: PageView(
        children: const [
          NavigationRails(),
          BottomNavigationStacked(),
        ],
      ),
    );
  }
}
