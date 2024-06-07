import 'package:flutter/material.dart';

import '../../../../../models/note.dart';

class ManageNoteDialog extends StatefulWidget {
  const ManageNoteDialog({super.key, this.note});

  final Note? note;

  @override
  State<ManageNoteDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<ManageNoteDialog> {
  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      id = widget.note!.id;
      title = widget.note!.title;
      content = widget.note!.content;
      createdDate = widget.note!.createdDate;
    }
  }

  final formKey = GlobalKey<FormState>();

  int id = 0;
  String title = "";
  String content = "";
  String createdDate = DateTime.now().toString();

  void submit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.pop(context, {
        'id': id,
        'title': title,
        'content': content,
        'created_date': createdDate
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add new note'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              // controller: nameController,
              initialValue: title,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onSaved: (newValue) {
                title = newValue!;
              },
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return "Enter title!";
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              initialValue: content,
              decoration: InputDecoration(
                labelText: 'Content',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              textInputAction: TextInputAction.done,
              onSaved: (newValue) {
                content = newValue!;
              },
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return "Enter content!";
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: submit,
          child: Text(widget.note == null ? 'Add note' : 'Save note'),
        ),
      ],
    );
  }
}
