import 'package:flutter_day_29/repositories/courses_repository.dart';

import '../models/course.dart';

class CoursesViewmodel {
  final _coursesRepository = CoursesRepository();

  List<Course> _list = [];

  Future<List<Course>> get courses async {
    _list = await _coursesRepository.getCourses();
    return [..._list];
  }
}
