import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day_29/viewmodels/notes_viewmodel.dart';
import 'package:flutter_day_29/views/pages/todos_and_notes/widgets/note/manage_note_dialog.dart';

import '../../../../../models/note.dart';
import 'delete_dialog.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  final notesViewModel = NotesViewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: FutureBuilder(
        future: notesViewModel.notes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text("Couldn't get data from Database."),
            );
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text("Failed to load notes"));
          } else if (snapshot.data!.isEmpty) {
            return const Center(
                child: Text("You haven't added any notes yet."));
          }
          final notes = snapshot.data;
          return notes == null || notes.isEmpty
              ? const Text('No notes')
              : ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return NoteItem(
                      note: notes[index],
                      onEdit: editNote,
                      onDelete: deleteNote,
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNote,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> addNote() async {
    final data = await showDialog(
      context: context,
      builder: (context) {
        return const ManageNoteDialog();
      },
    );
    if (data != null) {
      await notesViewModel.addNote(
        title: data['title'],
        content: data['content'],
        createdDate: data['created_date'],
      );
      setState(() {});
    }
  }

  Future<void> editNote({required Note note}) async {
    final data = await showDialog(
      context: context,
      builder: (context) {
        return ManageNoteDialog(note: note);
      },
    );
    if (data != null) {
      await notesViewModel.editNote(
        id: data['id'],
        title: data['title'],
        content: data['content'],
        createdDate: data['created_date'],
      );
      setState(() {});
    }
  }

  Future<void> deleteNote({required Note note}) async {
    final bool delete = await showDialog(
      context: context,
      builder: (context) {
        return DeleteDialog(note: note);
      },
    );
    if (delete) {
      await notesViewModel.deleteNote(id: note.id);
      setState(() {});
    }
  }
}

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
    required this.onDelete,
    required this.onEdit,
  });

  final Note note;
  final Future<void> Function({required Note note}) onDelete;
  final Future<void> Function({required Note note}) onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.only(top: 10, left: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            note.title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          Text(
            note.content.replaceAll('\\', '\n'),
            style: const TextStyle(color: Colors.black54, fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => onEdit(note: note),
                icon: const Icon(
                  CupertinoIcons.pencil,
                  color: Colors.teal,
                ),
              ),
              IconButton(
                onPressed: () => onDelete(note: note),
                icon: const Icon(
                  CupertinoIcons.delete,
                  size: 20,
                  color: Colors.redAccent,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
