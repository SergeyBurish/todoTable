
class GetTodosRequest {
  final String owner;
  final String list;

  GetTodosRequest({
    required this.owner,
    required this.list,
  });

  Map<String, dynamic> parameters() {
    return {'filterByFormula': "AND({Owner}='$owner',{List}='$list')",};
  }
}