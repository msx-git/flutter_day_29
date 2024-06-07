class Note {
  final int id;
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
    return Note(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      createdDate: json['created_date'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'created_date': createdDate,
    };
  }
}
