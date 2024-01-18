
import 'package:todo_table/data/api/api_util.dart';
import 'package:todo_table/data/api/service/airtable_service.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    return _apiUtil ?? (_apiUtil = ApiUtil(AirtableService()));
  }
}