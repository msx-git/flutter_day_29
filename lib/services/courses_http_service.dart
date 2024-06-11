import 'dart:convert';

import 'package:flutter_day_29/models/course.dart';
import 'package:http/http.dart' as http;

import '../models/lesson.dart';

class CoursesHttpService {
  Future<List<Course>> fetchCourses() async {
    final Uri url = Uri.parse(
        "https://flutter-day-26-default-rtdb.firebaseio.com/courses.json");
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final List<Course> loadedCourses = [];
    if (data != null) {
      data.forEach((key, value) {
        value['id'] = key;
        loadedCourses.add(Course.fromJson(value));
      });
    }
    // print("loadedCourses: $loadedCourses");
    return loadedCourses;
  }

  Future<void> addCourse({
    required String title,
    required String description,
    required String imageUrl,
    required double price,
    required List<Lesson> lessons,
  }) async {
    final Uri url = Uri.parse(
        "https://flutter-day-26-default-rtdb.firebaseio.com/courses.json");
    final courseData = {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'lessons': lessons,
    };

    await http.post(url, body: jsonEncode(courseData));
  }
}
