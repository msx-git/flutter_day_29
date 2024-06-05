import 'package:flutter/material.dart';
import 'package:flutter_day_29/viewmodels/courses_viewmodel.dart';
import 'package:flutter_day_29/views/pages/todos_and_notes/widgets/course/course_item.dart';

class CoursesList extends StatelessWidget {
  CoursesList({super.key});

  final coursesViewModel = CoursesViewmodel();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: coursesViewModel.courses,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final course = snapshot.data![index];
              return CourseItem(course: course);
            },
          );
        },
      ),
    );
  }
}
