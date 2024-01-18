
import 'package:todo_table/businessLogic/model/user.dart';

abstract class Repository {
  Future<List<User>> getUser({
    required String name,
    required String password,
  });
}