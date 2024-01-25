class GetUserRequest {
  final String name;
  final String password;

  GetUserRequest({
    required this.name,
    required this.password,
  });

  Map<String, dynamic> parameters() {
    return {'name': 'eq.$name', 'password': 'eq.$password',};
  }
}