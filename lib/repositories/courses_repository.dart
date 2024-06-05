import 'package:flutter_day_29/models/course.dart';
import 'package:flutter_day_29/services/courses_http_service.dart';

class CoursesRepository {
  final _coursesHttpService = CoursesHttpService();

  Future<List<Course>> getCourses() async {
    return await _coursesHttpService.fetchCourses();
  }
}
