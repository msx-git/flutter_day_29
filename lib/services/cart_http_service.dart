import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/course.dart';

class CartHttpService {

  Future<List<Course>> fetchCartCourses() async {
    final Uri url = Uri.parse(
        "https://flutter-day-26-default-rtdb.firebaseio.com/cart.json");
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

  Future<void> addToCart(Course course) async {
    final Uri url = Uri.parse(
        "https://flutter-day-26-default-rtdb.firebaseio.com/cart.json");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");

    final response = await http.post(url,body: jsonEncode(course.toJson()));
  }
}
