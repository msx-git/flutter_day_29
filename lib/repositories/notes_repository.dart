import 'package:flutter_day_29/models/note.dart';
import 'package:flutter_day_29/services/notes_http_service.dart';

class NotesRepository {
  final notesHttpService = NotesHttpService();

  Future<List<Note>> getNotes() async {
    return await notesHttpService.fetNotes();
  }
}
