import 'dart:convert';

import 'package:flutter_day_29/models/course.dart';
import 'package:http/http.dart' as http;

class CoursesHttpService{
  Future<List<Course>> fetchCourses() async {
    final Uri url = Uri.parse("https://flutter-day-26-default-rtdb.firebaseio.com/courses.json");
    final response = await http.get(url);
    // print("Response: $response");
    final data = jsonDecode(response.body);
    // print("Data: $data");
    final List<Course> loadedCourses = [];
    if(data != null){
      data.forEach((key, value){
        value['id'] = key;
        loadedCourses.add(Course.fromJson(value));
      });
    }
    // print("loadedCourses: $loadedCourses");
    return loadedCourses;
  }
}