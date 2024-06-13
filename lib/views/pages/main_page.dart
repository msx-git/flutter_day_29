import 'package:flutter/material.dart';
import 'package:flutter_day_29/views/pages/cart/cart_page.dart';
import 'package:flutter_day_29/views/pages/todos_and_notes/home.dart';
import 'package:flutter_day_29/views/pages/todos_and_notes/profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'todos_and_notes/statistics.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.changeLang});

  final ValueChanged<int> changeLang;

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
                    Home(changeLang: widget.changeLang),
                    Statistics(changeLang: widget.changeLang),
                    const CartPage(),
                    Profile(changeLang: widget.changeLang),
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
                  destinations: [
                    NavigationDestination(
                      icon: const Icon(Icons.home_outlined),
                      selectedIcon: const Icon(Icons.home),
                      label: AppLocalizations.of(context)!.main,
                    ),
                    NavigationDestination(
                      selectedIcon: const Icon(Icons.insert_chart),
                      icon: const Icon(Icons.insert_chart_outlined),
                      label: AppLocalizations.of(context)!.statistics,
                    ),
                    NavigationDestination(
                      selectedIcon: const Icon(Icons.shopping_cart),
                      icon: const Icon(Icons.shopping_cart_outlined),
                      label: AppLocalizations.of(context)!.cart,
                    ),
                    NavigationDestination(
                      selectedIcon: const Icon(Icons.person_rounded),
                      icon: const Icon(Icons.person_outline_rounded),
                      label: AppLocalizations.of(context)!.profile,
                    ),
                  ],
                )
              : null,
        );
      },
    );
  }
}
