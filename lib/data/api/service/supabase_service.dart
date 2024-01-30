import 'package:dio/dio.dart';
import 'package:todo_table/data/api/dto/todo_dto.dart';
import 'package:todo_table/data/api/dto/todo_list_dto.dart';
import 'package:todo_table/data/api/dto/user_dto.dart';
import 'package:todo_table/data/api/request/get_todo_lists_request.dart';
import 'package:todo_table/data/api/request/get_todos_request.dart';
import 'package:todo_table/data/api/request/get_user_request.dart';
import 'package:todo_table/data/api/request/change_todo_list_request.dart';

class SupabaseService {
  static const _BASE_URL = 'https://uasykwsowerdpgquvslr.supabase.co/rest/v1';
  static const _apikey = 'supabaseApikey';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  Future<UsersDto> getUser(UserRequest request) async {
    final response = await _dio.get(
      '/user',
      queryParameters: request.parameters(),
      options: Options( headers: {'apikey': _apikey}, )
    );
    return UsersDto.fromApi(response.data);
  }

  Future<void> saveUser(UserRequest request) async {
    await _dio.post(
      '/user',
      data: request.data(),
      options: Options( headers: {"apikey": _apikey, "Content-Type": "application/json"}, )
    );
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

  Future<void> saveTodoList(ChangeTodoListRequest request) async {
    final response = await _dio.post(
      '/todoList',
      data: request.data(),
      options: Options( headers: {"apikey": _apikey, "Content-Type": "application/json"}, )
    );

    print('saveTodoList response statusCode ${response.statusCode}');
  }

  Future<void> deleteTodoList(ChangeTodoListRequest request) async {
    final response = await _dio.delete(
      '/todoList',
      queryParameters: request.parameters(),
      options: Options( headers: {"apikey": _apikey, "Content-Type": "application/json"}, )
    );

    print('deleteTodoList response statusCode ${response.statusCode}');
  }
}