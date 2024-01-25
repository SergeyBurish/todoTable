import 'package:dio/dio.dart';
import 'package:todo_table/data/api/dto/todo_dto.dart';
import 'package:todo_table/data/api/dto/todo_list_dto.dart';
import 'package:todo_table/data/api/dto/user_dto.dart';
import 'package:todo_table/data/api/request/get_todo_lists_request.dart';
import 'package:todo_table/data/api/request/get_todos_request.dart';
import 'package:todo_table/data/api/request/get_user_request.dart';

class AirtableService {
  static const _BASE_URL = 'https://uasykwsowerdpgquvslr.supabase.co/rest/v1';
  static const _apikey = 'supabaseApikey';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  Future<UsersDto> getUser(GetUserRequest request) async {
    final response = await _dio.get(
      '/user',
      queryParameters: request.parameters(),
      options: Options( headers: {'apikey': _apikey}, )
    );
    return UsersDto.fromApi(response.data);
  }

  Future<TodoListsDto> getTodoLists(GetTodoListsRequest request) async {
    final response = await _dio.get(
      '/todoList',
      queryParameters: request.parameters(),
      options: Options( headers: {'apikey': _apikey}, )
    );
    return TodoListsDto.fromApi(response.data);
  }

  Future<TodosDto> getTodos(GetTodosRequest request) async {
    final response = await _dio.get(
      '/todo',
      queryParameters: request.parameters(),
      options: Options( headers: {'apikey': _apikey}, )
    );
    return TodosDto.fromApi(response.data);
  }
}