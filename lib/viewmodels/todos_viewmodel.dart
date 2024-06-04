
import '../models/todo.dart';
import '../repositories/todos_repository.dart';

class TodosViewModel {
  final todosRepository = TodosRepository();

  List<Todo> _list = [];

  Future<List<Todo>> get todos async {
    _list = await todosRepository.getTodos();
    return [..._list];
  }

  Future<void> addTodo({
    required String title,
    required String date,
    required bool isDone,
  }) async {
    final newTodo =
        await todosRepository.addTodo(title: title, date: date, isDone: isDone);
    _list.add(newTodo);
  }

  Future<void> editTodo({
    required String id,
    required String title,
    required String date,
    required bool isDone,
  }) async{

  }

  Future<void> deleteTodo(String id) async {
    await todosRepository.deleteTodo(id);
    _list.removeWhere((todo) => todo.id == id);
  }
}
