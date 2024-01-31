class ChangeTodoRequest {
  final String owner;
  final String name;
  final String list;
  final String description;
  final bool important;
  final bool completed;

  ChangeTodoRequest({
    required this.owner,
    required this.name,
    required this.list,
    this.description = '',
    this.important = false,
    this.completed = false,
  });

  Map<String, dynamic> parameters() {
    return {'owner': 'eq.$owner', 'name': 'eq.$name', 'list': 'eq.$list'};
  }

  Map<String, String> data() {
    return {
      'owner': owner,
      'name': name,
      'list': list,
      'description': description,
      'important': '$important',
      'completed': '$completed',};
  }
}