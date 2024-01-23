import 'package:mobx/mobx.dart';
import 'package:todo_table/businessLogic/model/todo.dart';
import 'package:todo_table/businessLogic/model/todo_list.dart';
import 'package:todo_table/businessLogic/repository/repository.dart';

// Include generated file
part 'app_state.g.dart';

enum AppPage{
    login,
    todoLists,
    todos,
}

// This is the class used by rest of your codebase
class AppState = _AppState with _$AppState;

// The store-class
abstract class _AppState with Store {
  _AppState(this._repository);

  final Repository _repository;

  @observable
  bool isLoading = false;

    @observable
  AppPage currentPage = AppPage.login;

  @observable
  bool logInFail = false;

  @observable
  String userName = '';

  @observable
  List<TodoList> todoLists = [];

  @observable
  List<Todo> todos = [];

  @observable
  String currentList = '';

  @action
  Future<void> login(String name, String password) async {
    isLoading = true;

    final users = await _repository.getUser(name: name, password: password);
    if (users.isNotEmpty) {
      userName = users.first.name;
    }
    currentPage = users.isEmpty ? AppPage.login : AppPage.todoLists;
    logInFail = users.isEmpty;

    isLoading = false;
  }

  @action
  Future<void> getLists() async {
    isLoading = true;
    todoLists = await _repository.getTodoLists(owner: userName);
    isLoading = false;
  }

  @action
  Future<void> getTodos(String listName) async {
    isLoading = true;

    todos = await _repository.getTodos(owner: userName, list: listName);
    currentList = listName;
    currentPage = AppPage.todos;

    isLoading = false;
  }
}