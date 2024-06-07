import '../models/note.dart';
import '../repositories/notes_repository.dart';

class NotesViewmodel {
  final notesRepository = NotesRepository();

  List<Note> _list = [];

  Future<List<Note>> get notes async {
    _list = await notesRepository.getNotes();
    return [..._list];
  }

  Future<void> addNote({
    required String title,
    required String content,
    required String createdDate,
  }) async {
    await notesRepository.addNote(
      title: title,
      content: content,
      createdDate: createdDate,
    );
  }

  Future<void> editNote({
    required int id,
    required String title,
    required String content,
    required String createdDate,
  }) async {
    await notesRepository.editNote(
      id: id,
      title: title,
      content: content,
      createdDate: createdDate,
    );
  }

  Future<void> deleteNote({required int id}) async {
    await notesRepository.deleteNote(id: id);
  }
}
