import 'quiz.dart';

class Lesson{
  String id;
  String courseId;
  String title;
  String description;
  String videoUrl;
  List<Quiz> quizes;

  Lesson({
    required this.id,
    required this.courseId,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.quizes,
  });
}