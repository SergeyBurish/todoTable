import 'package:dio/dio.dart';
import 'package:todo_table/data/api/dto/todo_dto.dart';
import 'package:todo_table/data/api/dto/todo_list_dto.dart';
import 'package:todo_table/data/api/dto/user_dto.dart';
import 'package:todo_table/data/api/request/get_todo_lists_request.dart';
import 'package:todo_table/data/api/request/get_todos_request.dart';
import 'package:todo_table/data/api/request/get_user_request.dart';

class AirtableService {
  static const _BASE_URL = 'https://api.airtable.com/v0/appal3ocGrE9dpt3I';
  static const _token = "pat65DA0Jg6YfYcS0.ba2a281f0fa118edf0c6076e93697f96b2c638c781c806eda7b1525b9764af1b";

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  Future<UsersDto> getUser(GetUserRequest request) async {
    final response = await _dio.get(
      '/Users',
      queryParameters: request.parameters(),
      options: Options( headers: {"Authorization": "Bearer $_token"}, )
    );
    return UsersDto.fromApi(response.data);
  }

  Future<TodoListsDto> getTodoLists(GetTodoListsRequest request) async {
    final response = await _dio.get(
      '/TodoLists',
      queryParameters: request.parameters(),
      options: Options( headers: {"Authorization": "Bearer $_token"}, )
    );
    return TodoListsDto.fromApi(response.data);
  }

  Future<TodosDto> getTodos(GetTodosRequest request) async {
    final response = await _dio.get(
      '/Todos',
      queryParameters: request.parameters(),
      options: Options( headers: {"Authorization": "Bearer $_token"}, )
    );
    return TodosDto.fromApi(response.data);
  }
}