import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/notes_list.dart';
import 'widgets/todos_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos and Notes'),
      ),
      drawer: const Drawer(),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const TodosList(),
              ),
            ),
            child: const Card(
              child: Center(
                child: Text(
                  'Todos',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const NotesList(),
              ),
            ),
            child: const Card(
              child: Center(
                child: Text(
                  'Notes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
