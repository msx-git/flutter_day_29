import 'package:flutter_day_29/repositories/courses_repository.dart';

import '../models/course.dart';
import '../models/lesson.dart';

class CoursesViewmodel {
  final _coursesRepository = CoursesRepository();

  List<Course> _list = [];

  Future<List<Course>> get courses async {
    _list = await _coursesRepository.getCourses();
    return [..._list];
  }

  Future<void> addCourse({
    required String title,
    required String description,
    required String imageUrl,
    required double price,
    required List<Lesson> lessons,
  }) async {
    _coursesRepository.addCourse(
        title: title,
        description: description,
        imageUrl: imageUrl,
        price: price,
        lessons: lessons);
  }
}
