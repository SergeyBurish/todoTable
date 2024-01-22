
class TodoListDto {
  final String name;
  final bool private;
  String? description;

  TodoListDto.fromApi(dynamic record) 
    : name =        record['fields']['Name'],
      private =     record['fields']['Private'] ?? false,
      description = record['fields']['Description'];
}

class TodoListsDto {
  List<TodoListDto> lists = [];

  TodoListsDto.fromApi(Map<String, dynamic> map) {
    List<dynamic> records = map['records'];

    for(var record in records) {
      lists.add(TodoListDto.fromApi(record));
    }
  }
}