
import 'package:todo_table/businessLogic/model/todo.dart';
import 'package:todo_table/businessLogic/model/todo_list.dart';
import 'package:todo_table/businessLogic/model/user.dart';
import 'package:todo_table/businessLogic/repository/repository.dart';
import 'package:todo_table/data/api/api_util.dart';

class DataRepository extends Repository {
  final ApiUtil _apiUtil;

  DataRepository(this._apiUtil);

  @override
  Future<List<User>> getUser({required String name, required String password}) {
    return _apiUtil.getUser(name: name, password: password);
  }

  @override
  Future<void> saveUser({required String name, required String password,}) {
    return _apiUtil.saveUser(name: name, password: password);
  }

  @override
  Future<List<TodoList>> getTodoLists({required String owner}) {
    return _apiUtil.getTodoLists(owner: owner);
  }

  @override
  Future<void> saveTodoList({
      required String owner,
      required String name, 
      required String description, 
      required bool private}) {
    return _apiUtil.saveTodoList(owner: owner, name: name, description: description, private: private);
  }

  @override
  Future<void> deleteTodoList({
      required String owner,
      required String name}) {
    return _apiUtil.deleteTodoList(owner: owner, name: name);
  }

  @override
  Future<List<Todo>> getTodos({required String owner, required String list}) {
    return _apiUtil.getTodos(owner: owner, list: list);
  }

  @override
  Future<void> saveTodo({
      required String owner,
      required String name,
      required String list,
      required String description,
      required bool important}) {
    return _apiUtil.saveTodo(owner: owner, name: name, list: list, description: description, important: important);
  }
}