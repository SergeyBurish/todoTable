
import 'package:todo_table/businessLogic/model/todo.dart';
import 'package:todo_table/businessLogic/model/todo_list.dart';
import 'package:todo_table/businessLogic/model/user.dart';

abstract class Repository {
  Future<List<User>> getUser({
    required String name,
    required String password,
  });

  Future<List<TodoList>> getTodoLists({
    required String owner,
  });

  Future<List<Todo>> getTodos({
    required String owner, 
    required String list});

  Future<void> saveTodoList({
    required String owner,
    required String name, 
    required String description, 
    required bool private});

  Future<void> deleteTodoList({
    required String owner,
    required String name});
}