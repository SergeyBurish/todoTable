
class UserDto {
  final String name;
  final String createdTime;

  UserDto.fromApi(dynamic record) 
    : name =        record['fields']['Name'],
      createdTime = record['createdTime'];
}

class UsersDto {
  List<UserDto> users = [];

  UsersDto.fromApi(Map<String, dynamic> map) {
    List<dynamic> records = map['records'];

    for(var record in records) {
      print('*' * 10);
      users.add(UserDto.fromApi(record));
    }
  }
}