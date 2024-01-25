
class GetTodosRequest {
  final String owner;
  final String list;

  GetTodosRequest({
    required this.owner,
    required this.list,
  });

  Map<String, dynamic> parameters() {
    return {'user': 'eq.$owner', 'list': 'eq.$list',};
  }
}