class GetUserRequest {
  final String name;
  final String password;

  GetUserRequest({
    required this.name,
    required this.password,
  });

  Map<String, dynamic> parameters() {
    return {'filterByFormula': "AND({Name}='$name',{Password}='$password')",};
  }
}