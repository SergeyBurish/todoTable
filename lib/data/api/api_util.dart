
import 'package:todo_table/businessLogic/model/user.dart';
import 'package:todo_table/data/api/dto/user_dto.dart';
import 'package:todo_table/data/api/request/get_user_request.dart';
import 'package:todo_table/data/api/service/airtable_service.dart';
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
}