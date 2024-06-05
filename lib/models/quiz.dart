import 'package:json_annotation/json_annotation.dart';

part 'quiz.g.dart';

@JsonSerializable()
class Quiz {
  String id;
  String question;
  List<String> options;
  int correctIndex;

  Quiz({
    required this.id,
    required this.question,
    required this.options,
    required this.correctIndex,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return _$QuizFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuizToJson(this);
  }

  @override
  String toString() {
    return 'Quiz{id: $id, question: $question, options: $options, correctIndex: $correctIndex}';
  }
}
