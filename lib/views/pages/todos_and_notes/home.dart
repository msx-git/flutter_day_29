import 'package:flutter/material.dart';
import 'package:flutter_day_29/utils/route_names.dart';
import 'package:flutter_day_29/views/pages/todos_and_notes/widgets/course/courses_list.dart';

import '../../../services/auth_http_service.dart';
import '../auth/sign_in.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos and Notes'),
      ),
      drawer: const Drawer(child: CustomDrawer()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.count(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, RouteNames.todosList),
                child: const Card(
                  child: Center(
                    child: Text(
                      'Todos',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, RouteNames.notesList),
                child: const Card(
                  child: Center(
                    child: Text(
                      'Notes',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// Courses
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Courses',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
            ),
          ),
          CoursesList()
        ],
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: ListTile(
            title: const Text('Tizimdan chiqish'),
            trailing: const Icon(Icons.exit_to_app_rounded),
            onTap: () {
              AuthHttpServices.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
