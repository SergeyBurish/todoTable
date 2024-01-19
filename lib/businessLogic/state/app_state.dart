import 'package:mobx/mobx.dart';
import 'package:todo_table/businessLogic/repository/repository.dart';

// Include generated file
part 'app_state.g.dart';

// This is the class used by rest of your codebase
class AppState = _AppState with _$AppState;

// The store-class
abstract class _AppState with Store {
  _AppState(this._repository);

  final Repository _repository;

  @observable
  bool isLoading = false;

  @observable
  bool loggedIn = false;

  @observable
  bool logInFail = false;

  @observable
  String  userName = '';

  @action
  Future<void> getUser() async {
    isLoading = true;

    final users = await _repository.getUser(name: 'user1', password: '123');
    if (users.isNotEmpty) {
      userName = users.first.name;
    }
    loggedIn = users.isNotEmpty;
    logInFail = !loggedIn;

    isLoading = false;
  }
}