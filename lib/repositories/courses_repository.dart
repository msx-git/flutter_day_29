import 'package:flutter_day_29/models/course.dart';
import 'package:flutter_day_29/services/courses_http_service.dart';

import '../models/lesson.dart';

class CoursesRepository {
  final _coursesHttpService = CoursesHttpService();

  Future<List<Course>> getCourses() async {
    return await _coursesHttpService.fetchCourses();
  }

  Future<void> addCourse({
    required String title,
    required String description,
    required String imageUrl,
    required double price,
    required List<Lesson> lessons,
  }) async {
    _coursesHttpService.addCourse(
        title: title,
        description: description,
        imageUrl: imageUrl,
        price: price,
        lessons: lessons);
  }
}
