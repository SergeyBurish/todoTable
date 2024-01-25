
class UserDto {
  final String name;
  final String createdTime;

  UserDto.fromApi(dynamic record) 
    : name =        record['name'],
      createdTime = record['created_at'];
}

class UsersDto {
  List<UserDto> users = [];

  UsersDto.fromApi(List<dynamic> records) {
    for(var record in records) {
      users.add(UserDto.fromApi(record));
    }
  }
}