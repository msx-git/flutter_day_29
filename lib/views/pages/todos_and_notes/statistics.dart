import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../viewmodels/todos_viewmodel.dart';
import 'home.dart';

class Statistics extends StatelessWidget {
  Statistics({super.key, required this.changeLang});

  final todosViewmodel = TodosViewModel();
  final ValueChanged<int> changeLang;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.statistics),
      ),
      drawer: Drawer(
          child: CustomDrawer(
        changeLang: changeLang,
      )),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: double.infinity),
              Text("${AppLocalizations.of(context)!.doneTodo}: $doneCount"),
              Text("${AppLocalizations.of(context)!.unDoneDodos}: $notDoneCount"),
            ],
          );
        },
      ),
    );
  }
}
