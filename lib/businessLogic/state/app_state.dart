import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_table/businessLogic/model/todo.dart';
import 'package:todo_table/businessLogic/model/todo_list.dart';
import 'package:todo_table/businessLogic/repository/repository.dart';

// Include generated file
part 'app_state.g.dart';

enum AppPage{
  login,
  createAccount,
  todoLists,
  todos,
  listEdit,
  todoEdit,
}

enum AppError{
  noError,
  connectionFail,
  authFail,
  createAccountFail,
  createAccountNameExists,
  getListsFail,
  getTodosFail,
  saveListFail,
  deleteListFail,
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
  AppError currentError = AppError.noError;

  @observable
  String userName = '';

  @observable
  List<TodoList> todoLists = [];

  @observable
  List<Todo> todos = [];

  @observable
  String currentList = '';

  @action
  Future<void> login(String name, String password, {Function? onFail}) async {
    isLoading = true;

    try {
      final users = await _repository.getUser(name: name, password: password);
      if (users.isNotEmpty) {
        userName = users.first.name;
        currentPage = AppPage.todoLists;
      } else {
        currentError = AppError.authFail;
        currentPage = AppPage.login;
        if (onFail != null) {onFail();}
      }
    } on Exception {
      currentError = AppError.connectionFail;
      currentPage = AppPage.login;
      if (onFail != null) {onFail();}
    }

    isLoading = false;
  }

  @action
  Future<void> createAccount (String name, String password, {Function? onFail}) async {
    isLoading = true;

    try {
      await _repository.saveUser(name: name, password: password);
      userName = name;
      currentPage = AppPage.todoLists;
    } on Exception catch(e) {
      currentError = AppError.createAccountFail;

      if (e is DioException) {
        if (e.response?.statusCode == 409) {
          currentError = AppError.createAccountNameExists;
        }
      }

      currentPage = AppPage.createAccount;
      if (onFail != null) {onFail();}
    }

    isLoading = false;
  }

  @action
  Future<void> getLists({Function? onFail}) async {
    isLoading = true;

    try {
      todoLists = await _repository.getTodoLists(owner: userName);
    } on Exception {
      currentError = AppError.getListsFail;
      if (onFail != null) {onFail();}
    }
    
    isLoading = false;
  }

  @action
  Future<void> getTodos({Function? onFail}) async {
    isLoading = true;

    try {
      todos = await _repository.getTodos(owner: userName, list: currentList);
    } on Exception {
      currentError = AppError.getTodosFail;
      if (onFail != null) {onFail();}
    }

    isLoading = false;
  }

  @action
  Future<void> saveList (String listName, String description, bool private, {Function? onFail}) async {
    isLoading = true;

    try {
      await _repository.saveTodoList(
        owner: userName, name: listName, description: description, private: private);
      currentPage = AppPage.todoLists;
    } on Exception {
      currentError = AppError.saveListFail;
      if (onFail != null) {onFail();}
    }

    isLoading = false;
  }

  @action
  Future<void> deleteList (String listName) async {
    isLoading = true;

    await _repository.deleteTodoList(owner: userName, name: listName);
    todoLists = await _repository.getTodoLists(owner: userName); // update lists after delete

    isLoading = false;
  }

  @action
  void goToLogin () {
    currentPage = AppPage.login;
  }

  @action
  void goToCreateAccount () {
    currentPage = AppPage.createAccount;
  }

  @action
  void goToLists () {
    currentPage = AppPage.todoLists;
  }

  @action
  void goToTodos (String listName) {
    currentList = listName;
    currentPage = AppPage.todos;
  }

  @action
  void goToListEdit () {
    currentPage = AppPage.listEdit;
  }

  @action
  void goToTodoEdit () {
    currentPage = AppPage.todoEdit;
  }

  @action
  void logOut () {
    userName = '';
    currentPage = AppPage.login;
  }
}