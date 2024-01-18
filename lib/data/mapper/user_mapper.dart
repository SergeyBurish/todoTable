
import 'package:todo_table/businessLogic/model/user.dart';
import 'package:todo_table/data/api/dto/user_dto.dart';

class UserMapper {
  static List<User> fromDto(UsersDto usersDto) {
    List<User> users = [];

    for(var userDto in usersDto.users) {
      users.add(User(name: userDto.name));
    }

    return users;
  }
}