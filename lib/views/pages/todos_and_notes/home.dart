import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_day_29/models/lesson.dart';
import 'package:flutter_day_29/models/quiz.dart';
import 'package:flutter_day_29/utils/route_names.dart';
import 'package:flutter_day_29/views/pages/todos_and_notes/widgets/course/courses_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../services/auth_http_service.dart';
import '../../../viewmodels/courses_viewmodel.dart';
import '../auth/sign_in.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.changeLang});

  final ValueChanged<int> changeLang;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final coursesViewModel = CoursesViewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.mainTitle),
      ),
      drawer: Drawer(child: CustomDrawer(changeLang: widget.changeLang)),
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
                child: Card(
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.todos,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, RouteNames.notesList),
                child: Card(
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.notes,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
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
                Text(
                  AppLocalizations.of(context)!.courses,
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
  CustomDrawer({super.key, required this.changeLang});

  final ValueChanged<int> changeLang;

  final authService = AuthHttpServices();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Column(
            children: [
              ListTile(
                title: Text(AppLocalizations.of(context)!.signOut),
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
                title: Text(AppLocalizations.of(context)!.resetPassword),
                trailing: const Icon(Icons.exit_to_app_rounded),
                onTap: () {
                  authService.resetPassword();
                },
              ),
              ListTile(
                leading: const Text('🇺🇿'),
                title: const Text("O'zbekcha"),
                onTap: () => changeLang(2),
              ),
              ListTile(
                leading: const Text('🇬🇧'),
                title: const Text("English"),
                onTap: () => changeLang(0),
              ),
              ListTile(
                leading: const Text('🇷🇺'),
                title: const Text("Русский"),
                onTap: () => changeLang(1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
