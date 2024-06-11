import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/course.dart';
import '../models/lesson.dart';
import '../views/pages/todos_and_notes/home.dart';
import '../views/pages/todos_and_notes/widgets/course/course_details.dart';
import '../views/pages/todos_and_notes/widgets/course/quiz_page.dart';
import '../views/pages/todos_and_notes/widgets/note/notes_list.dart';
import '../views/pages/todos_and_notes/widgets/todo/todos_list.dart';
import 'route_names.dart';

class RouteGenerator {
  static generate(RouteSettings settings) {
    if (settings.name == RouteNames.home) {
      return CupertinoPageRoute(builder: (context) => Home());
    } else if (settings.name == RouteNames.todosList) {
      return CupertinoPageRoute(builder: (context) => const TodosList());
    } else if (settings.name == RouteNames.notesList) {
      return CupertinoPageRoute(builder: (context) => NotesList());
    } else if (settings.name == RouteNames.courseDetails) {
      return CupertinoPageRoute(
        builder: (context) =>
            CourseDetailsPage(course: settings.arguments as Course),
      );
    } else if (settings.name == RouteNames.quizzes) {
      return CupertinoPageRoute(
        builder: (context) => QuizPage(lesson: settings.arguments as Lesson),
      );
    }
    return MaterialPageRoute(
      builder: (context) => const Material(
        child: Center(
          child: Text(
            'Unknown route',
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
      ),
    );
  }
}
