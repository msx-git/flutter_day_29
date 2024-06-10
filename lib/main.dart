import 'package:flutter/material.dart';
import 'package:flutter_day_29/views/pages/auth/sign_in.dart';

import 'constants/app_theme.dart';
import 'services/auth_http_service.dart';
import 'utils/route_generator.dart';
import 'views/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authHttpServices = AuthHttpServices();
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();

    authHttpServices.checkAuth().then((value) {
      setState(() {
        isLoggedIn = value;
      });
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: isLoggedIn ? const MainPage() : const LoginScreen(),
      onGenerateRoute: (settings) => RouteGenerator.generate(settings),
    );
  }
}
