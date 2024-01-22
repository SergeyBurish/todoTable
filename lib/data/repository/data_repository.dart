
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
  Future<List<TodoList>> getTodoLists({required String owner}) {
    return _apiUtil.getTodoLists(owner: owner);
  }
}