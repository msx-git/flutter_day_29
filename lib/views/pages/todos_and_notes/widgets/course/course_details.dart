import 'package:flutter/material.dart';
import 'package:flutter_day_29/models/course.dart';
import 'package:flutter_day_29/services/cart_http_service.dart';

import 'lesson_item.dart';

class CourseDetailsPage extends StatefulWidget {
  CourseDetailsPage({super.key, required this.course});

  final Course course;

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  final cartHttpService = CartHttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.title),
        actions: [
          TextButton(
              onPressed: () {
                cartHttpService.addToCart(widget.course);
                setState(() {});
              },
              child: const Text('Add to cart')),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              widget.course.description,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemCount: widget.course.lessons.length,
              itemBuilder: (context, index) {
                final lesson = widget.course.lessons[index];
                return LessonItem(lesson: lesson);
              },
            ),
          )
        ],
      ),
    );
  }
}
