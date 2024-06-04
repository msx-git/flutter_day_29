import 'dart:convert';

import 'package:flutter_day_29/models/note.dart';
import 'package:http/http.dart' as http;

class NotesHttpService {
  Future<List<Note>> fetNotes() async {
    Uri url = Uri.parse(
        "https://flutter-day-26-default-rtdb.firebaseio.com/notes.json");
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final List<Note> loadedNotes = [];
    if (data != null) {
      data.forEach(
        (key, value) {
          value['id'] = key;
          loadedNotes.add(Note.fromJson(value));
        },
      );
    }
    return loadedNotes;
  }
}
