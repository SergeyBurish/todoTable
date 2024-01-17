import 'package:dio/dio.dart';

class AirtableService {
  static const _BASE_URL = 'https://api.airtable.com/v0/appal3ocGrE9dpt3I/Users';
  static const _token = "pat65DA0Jg6YfYcS0.ba2a281f0fa118edf0c6076e93697f96b2c638c781c806eda7b1525b9764af1b";

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  void getUser() {
    var params = {'filterByFormula': "AND({Name}='user1',{Password}='123')"};

    _dio.get('',
      queryParameters: params,
      options: Options(
        headers: {"Authorization": "Bearer $_token"},
    )).then((value) => print(value));
  }
}