import 'package:flutter/material.dart';

class NavigationRails extends StatefulWidget {
  const NavigationRails({super.key});

  @override
  State<NavigationRails> createState() => _NavigationRailsState();
}

class _NavigationRailsState extends State<NavigationRails> {
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
        title: const Text("Navigation Rail"),
      ),
      body: Row(
        children: [
          NavigationRail(
            elevation: 3,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.search),
                label: Text('Search'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
            selectedIndex: index,
            onDestinationSelected: (value) => setState(() => index = value),
            labelType: NavigationRailLabelType.selected,
          ),
          Expanded(child: pages[index]),
        ],
      ),
    );
  }
}
