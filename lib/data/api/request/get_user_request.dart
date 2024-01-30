class UserRequest {
  final String name;
  final String password;

  UserRequest({
    required this.name,
    required this.password,
  });

  Map<String, dynamic> parameters() {
    return {'name': 'eq.$name', 'password': 'eq.$password',};
  }

  Map<String, String> data() {
    return {
      'name': name,
      'password': password,};
  }
}