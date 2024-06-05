import 'package:flutter/material.dart';
import 'package:flutter_day_29/models/course.dart';

import 'lesson_item.dart';

class CourseDetailsPage extends StatelessWidget {
  const CourseDetailsPage({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              course.description,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemCount: course.lessons.length,
              itemBuilder: (context, index) {
                final lesson = course.lessons[index];
                return LessonItem(lesson: lesson);
              },
            ),
          )
        ],
      ),
    );
  }
}
