class ChangeTodoListRequest {
  final String owner;
  final String name;
  final String description;
  final bool private;

  ChangeTodoListRequest({
    required this.owner,
    required this.name,
    this.description = '',
    this.private = false,
  });

  Map<String, dynamic> parameters() {
    return {'user': 'eq.$owner', 'name': 'eq.$name',};
  }

  Map<String, String> data() {
    return {
      'user': owner,
      'name': name,
      'description': description,
      'private': '$private',};
  }
}