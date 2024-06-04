import 'package:json_annotation/json_annotation.dart';

import 'lesson.dart';

part 'courses.g.dart';

@JsonSerializable()
class Course{
  String id;
  String title;
  String description;
  String imageUrl;
  double price;
  List<Lesson> lessons;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.lessons,
  });
}