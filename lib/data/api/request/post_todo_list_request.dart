class PostTodoListRequest {
  final String owner;
  final String name;
  final String description;
  final bool private;

  PostTodoListRequest({
    required this.owner,
    required this.name,
    required this.description,
    required this.private,
  });

  Map<String, String> data() {
    return {
      'user': owner,
      'name': name,
      'description': description,
      'private': '$private',};
  }
}