
import 'package:flutter/material.dart';

import '../../../../../models/lesson.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.lesson});

  final Lesson lesson;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz of ${widget.lesson.title}'),
      ),
    );
  }
}
