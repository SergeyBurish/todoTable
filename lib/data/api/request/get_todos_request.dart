
class GetTodosRequest {
  final String owner;
  final String list;

  GetTodosRequest({
    required this.owner,
    required this.list,
  });

  Map<String, dynamic> parameters() {
    return {'owner': 'eq.$owner', 'list': 'eq.$list',};
  }
}