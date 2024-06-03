import 'package:flutter/material.dart';

class BottomNavigationStacked extends StatefulWidget {
  const BottomNavigationStacked({super.key});

  @override
  State<BottomNavigationStacked> createState() =>
      _BottomNavigationStackedState();
}

class _BottomNavigationStackedState extends State<BottomNavigationStacked> {
  int index = 0;
  final List<Widget> pages = [
    const Center(child: Text('Home')),
    const Center(child: Text('Search')),
    const Center(child: Text('Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Stacked'),
      ),
      body: IndexedStack(
        index: index,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
        currentIndex: index,
        onTap: (value) => setState(() => index = value),
      ),
    );
  }
}
