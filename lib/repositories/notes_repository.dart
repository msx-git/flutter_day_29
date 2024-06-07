import '../models/note.dart';
import '../services/database/local_database.dart';

class NotesRepository {
  final localDatabase = LocalDatabase();

  Future<List<Note>> getNotes() async {
    return await localDatabase.getNotes();
  }

  Future<void> addNote({
    required String title,
    required String content,
    required String createdDate,
  }) async {
    await localDatabase.addNote(
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
    await localDatabase.editNote(
      id: id,
      title: title,
      content: content,
      createdDate: createdDate,
    );
  }

  Future<void> deleteNote({required int id}) async {
    await localDatabase.deleteNote(id: id);
  }
}
