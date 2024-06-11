import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_day_29/models/lesson.dart';
import 'package:flutter_day_29/models/quiz.dart';
import 'package:flutter_day_29/utils/route_names.dart';
import 'package:flutter_day_29/views/pages/todos_and_notes/widgets/course/courses_list.dart';

import '../../../services/auth_http_service.dart';
import '../../../viewmodels/courses_viewmodel.dart';
import '../auth/sign_in.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final coursesViewModel = CoursesViewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos and Notes'),
      ),
      drawer: Drawer(child: CustomDrawer()),
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
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Courses',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                ),
                IconButton(
                    onPressed: () {
                      coursesViewModel.addCourse(
                        title: 'New Course',
                        description: 'New Course description',
                        imageUrl:
                            'https://y7b6t9n6.rocketcdn.me/wp-content/uploads/2021/09/PNG_QUvsC0W.png',
                        price: Random().nextDouble() * 250 + 50,
                        lessons: [
                          Lesson(
                            id: 'id',
                            courseId: 'courseId',
                            title: 'Lesson title',
                            description: 'Lesson description',
                            videoUrl:
                                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
                            quizzes: [
                              Quiz(
                                id: 'id',
                                question: 'Questions',
                                options: [
                                  'options1',
                                  'options2',
                                  'options3',
                                  'options4',
                                ],
                                correctIndex: 1,
                              ),
                            ],
                          ),
                        ],
                      );
                      setState(() {});
                    },
                    icon: const Icon(Icons.add)),
              ],
            ),
          ),
          CoursesList()
        ],
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final authService = AuthHttpServices();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Column(
            children: [
              ListTile(
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
              ListTile(
                title: const Text('Reset Password'),
                trailing: const Icon(Icons.exit_to_app_rounded),
                onTap: () {
                  authService.resetPassword();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
