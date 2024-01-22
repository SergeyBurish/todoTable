
class TodoDto {
  final String name;
  final bool important;
  final bool completed;
  String? description;

  TodoDto.fromApi(dynamic record) 
    : name =        record['fields']['Name'],
      important =     record['fields']['Important'] ?? false,
      completed =     record['fields']['Completed'] ?? false,
      description = record['fields']['Description'];
}

class TodosDto {
  List<TodoDto> todos = [];

  TodosDto.fromApi(Map<String, dynamic> map) {
    List<dynamic> records = map['records'];

    for(var record in records) {
      todos.add(TodoDto.fromApi(record));
    }
  }
}