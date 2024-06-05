import 'package:flutter/material.dart';
import 'package:flutter_day_29/viewmodels/notes_viewmodel.dart';

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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Couldn't get todos."),
            );
          }
          final notes = snapshot.data;
          return notes == null || notes.isEmpty
              ? const Text('No notes')
              : ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            notes[index].title,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            notes[index].content.replaceAll('\\', '\n'),
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
