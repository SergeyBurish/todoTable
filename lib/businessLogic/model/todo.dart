
class Todo {
  final String name;
  final bool important;
  final bool completed;
  String? description;

  Todo({
    required this.name,
    required this.important,
    required this.completed,
    this.description
  });
}