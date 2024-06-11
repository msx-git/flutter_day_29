import 'package:flutter/material.dart';
import 'package:flutter_day_29/views/pages/cart/cart_page.dart';
import 'package:flutter_day_29/views/pages/todos_and_notes/home.dart';
import 'package:flutter_day_29/views/pages/todos_and_notes/profile.dart';

import 'todos_and_notes/statistics.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var isMobile = constraints.maxWidth < 600;
        return Scaffold(
          body: Row(
            children: [
              if (!isMobile)
                NavigationRail(
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      selectedIcon: Icon(Icons.insert_chart),
                      icon: Icon(Icons.insert_chart_outlined),
                      label: Text('Statistics'),
                    ),
                    NavigationRailDestination(
                      selectedIcon: Icon(Icons.person_rounded),
                      icon: Icon(Icons.person_outline_rounded),
                      label: Text('Profile'),
                    ),
                  ],
                  selectedIndex: currentIndex,
                  onDestinationSelected: (value) =>
                      setState(() => currentIndex = value),
                ),
              Expanded(
                child: IndexedStack(
                  index: currentIndex,
                  children: [
                    Home(),
                    Statistics(),
                    CartPage(),
                    const Profile(),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: isMobile
              ? NavigationBar(
                  selectedIndex: currentIndex,
                  onDestinationSelected: (value) =>
                      setState(() => currentIndex = value),
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      selectedIcon: Icon(Icons.insert_chart),
                      icon: Icon(Icons.insert_chart_outlined),
                      label: 'Statistics',
                    ),
                    NavigationDestination(
                      selectedIcon: Icon(Icons.shopping_cart),
                      icon: Icon(Icons.shopping_cart_outlined),
                      label: 'Cart',
                    ),
                    NavigationDestination(
                      selectedIcon: Icon(Icons.person_rounded),
                      icon: Icon(Icons.person_outline_rounded),
                      label: 'Profile',
                    ),
                  ],
                )
              : null,
        );
      },
    );
  }
}
