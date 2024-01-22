
import 'package:todo_table/businessLogic/model/todo_list.dart';
import 'package:todo_table/businessLogic/model/user.dart';
import 'package:todo_table/data/api/request/get_todo_lists_request.dart';
import 'package:todo_table/data/api/request/get_user_request.dart';
import 'package:todo_table/data/api/service/airtable_service.dart';
import 'package:todo_table/data/mapper/todo_lists_mapper.dart';
import 'package:todo_table/data/mapper/user_mapper.dart';

class ApiUtil {
  final AirtableService _airtableService;

  ApiUtil(this._airtableService);

  Future<List<User>> getUser({
    required String name,
    required String password,
  }) async {
    final request = GetUserRequest(name: name, password: password);
    final result = await _airtableService.getUser(request);
    return UserMapper.fromDto(result);
  }

  Future<List<TodoList>> getTodoLists({
    required String owner,
  }) async {
    final request = GetTodoListsRequest(owner: owner);
    final result = await _airtableService.getTodoLists(request);
    return TodoListsMapper.fromDto(result);
  }
}