import 'package:flutter_day_29/repositories/notes_repository.dart';

import '../models/note.dart';

class NotesViewmodel {
  final notesRepository = NotesRepository();

  List<Note> _list = [];

  Future<List<Note>> get notes async {
    _list = await notesRepository.getNotes();
    return [..._list];
  }
}
