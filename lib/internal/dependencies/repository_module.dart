
import 'package:todo_table/businessLogic/repository/repository.dart';
import 'package:todo_table/data/repository/data_repository.dart';
import 'package:todo_table/internal/dependencies/api_module.dart';

class RepositoryModule {
  static Repository? _repository;

  static Repository repository() {
    return _repository ?? (
      _repository = DataRepository(ApiModule.apiUtil())
    );
  }
}