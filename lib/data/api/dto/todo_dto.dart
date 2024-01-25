
class TodoDto {
  final String name;
  final bool important;
  final bool completed;
  String? description;

  TodoDto.fromApi(dynamic record) 
    : name =        record['name'],
      important =   record['important'] ?? false,
      completed =   record['completed'] ?? false,
      description = record['description'];
}

class TodosDto {
  List<TodoDto> todos = [];

  TodosDto.fromApi(List<dynamic> records) {
    for(var record in records) {
      todos.add(TodoDto.fromApi(record));
    }
  }
}