
import 'package:todo_table/businessLogic/model/todo.dart';
import 'package:todo_table/businessLogic/model/todo_list.dart';
import 'package:todo_table/businessLogic/model/user.dart';
import 'package:todo_table/data/api/request/change_todo_request.dart';
import 'package:todo_table/data/api/request/get_todo_lists_request.dart';
import 'package:todo_table/data/api/request/get_todos_request.dart';
import 'package:todo_table/data/api/request/user_request.dart';
import 'package:todo_table/data/api/request/change_todo_list_request.dart';
import 'package:todo_table/data/api/service/supabase_service.dart';
import 'package:todo_table/data/mapper/todo_lists_mapper.dart';
import 'package:todo_table/data/mapper/todos_mapper.dart';
import 'package:todo_table/data/mapper/user_mapper.dart';

class ApiUtil {
  final SupabaseService _supabaseService;

  ApiUtil(this._supabaseService);

  Future<List<User>> getUser({
    required String name,
    required String password,
  }) async {
    final request = UserRequest(name: name, password: password);
    final result = await _supabaseService.getUser(request);
    return UserMapper.fromDto(result);
  }

  Future<void> saveUser({
    required String name,
    required String password,
  }) async {
      final request = UserRequest(name: name, password: password);
      return await _supabaseService.saveUser(request);
  }

  Future<List<TodoList>> getTodoLists({
    required String owner,
  }) async {
    final request = GetTodoListsRequest(owner: owner);
    final result = await _supabaseService.getTodoLists(request);
    return TodoListsMapper.fromDto(result);
  }

  Future<void> saveTodoList({
    required String owner,
    required String name, 
    required String description, 
    required bool private
  }) async {
      final request = ChangeTodoListRequest(
        owner: owner, name: name, description: description, private: private);
      return await _supabaseService.saveTodoList(request);
  }

  Future<void> deleteTodoList({
    required String owner,
    required String name
  }) async {
      final request = ChangeTodoListRequest(
        owner: owner, name: name);
      return await _supabaseService.deleteTodoList(request);
  }

  Future<List<Todo>> getTodos({
    required String owner,
    required String list,
  }) async {
    final request = GetTodosRequest(owner: owner, list: list);
    final result = await _supabaseService.getTodos(request);
    return TodosMapper.fromDto(result);
  }

  Future<void> saveTodo({
    required String owner,
    required String name,
    required String list,
    required String description, 
    required bool important,
  }) async {
      final request = ChangeTodoRequest(
        owner: owner, name: name, list: list, description: description, important: important);
      return await _supabaseService.saveTodo(request);
  }
}