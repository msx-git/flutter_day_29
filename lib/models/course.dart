import 'package:json_annotation/json_annotation.dart';

import 'lesson.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
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

  factory Course.fromJson(Map<String, dynamic> json) {
    return _$CourseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CourseToJson(this);
  }

  @override
  String toString() {
    return 'Course{id: $id, title: $title, description: $description, imageUrl: $imageUrl, price: $price, lessons: $lessons}';
  }
}
