
class GetTodoListsRequest {
  final String owner;

  GetTodoListsRequest({
    required this.owner,
  });

  Map<String, dynamic> parameters() {
    return {'owner': 'eq.$owner',};
  }
}