
class TodoListDto {
  final String name;
  final bool private;
  String? description;

  TodoListDto.fromApi(dynamic record) 
    : name =        record['name'],
      private =     record['private'] ?? false,
      description = record['description'];
}

class TodoListsDto {
  List<TodoListDto> lists = [];

  TodoListsDto.fromApi(List<dynamic> records) {
    for(var record in records) {
      lists.add(TodoListDto.fromApi(record));
    }
  }
}