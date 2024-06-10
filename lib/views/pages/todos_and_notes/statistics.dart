import 'package:flutter/material.dart';

import '../../../viewmodels/todos_viewmodel.dart';
import 'home.dart';

class Statistics extends StatelessWidget {
  Statistics({super.key});

  final todosViewmodel = TodosViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      drawer:  Drawer(child: CustomDrawer()),
      body: FutureBuilder(
        future: todosViewmodel.todos,
        builder: (context, snapshot) {
          var doneCount = snapshot.data
              ?.where((todo) {
                return todo.isDone;
              })
              .toList()
              .length;
          var notDoneCount = snapshot.data
              ?.where((todo) {
                return !todo.isDone;
              })
              .toList()
              .length;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          } else if (!snapshot.hasData) {
            return const Text("No data");
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Completed todos: $doneCount"),
              Text("Not Completed todos: $notDoneCount"),
            ],
          );
        },
      ),
    );
  }
}
