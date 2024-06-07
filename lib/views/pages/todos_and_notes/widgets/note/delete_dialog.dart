import 'package:flutter/material.dart';

import '../../../../../models/note.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Deleting note'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(note.title),
          const SizedBox(height: 10),
          Text(note.content),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text(
            'Yes, delete',
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
      ],
    );
  }
}
