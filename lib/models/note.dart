import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable()
class Note {
  final String id;
  String title;
  String content;
  String createdDate;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.createdDate,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return _$NoteFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NoteToJson(this);
  }
}
