import '../models/todo.dart';
import '../services/todos_http_service.dart';

class TodosRepository {
  final todosHttpService = TodosHttpService();

  Future<List<Todo>> getProducts() async {
    return todosHttpService.fetchTodos();
  }

  Future<Todo> addTodo({
    required String title,
    required String date,
    required bool isDone,
  }) async {
    final newTodo = await todosHttpService.addTodo(
        title: title, date: date, isDone: isDone);
    return newTodo;
  }

  Future<void> deleteTodo(String id) async {
    await todosHttpService.deleteTodo(id);
  }
}
