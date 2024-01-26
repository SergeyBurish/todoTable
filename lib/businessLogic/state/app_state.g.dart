// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppState on _AppState, Store {
  late final _$isLoadingAtom =
      Atom(name: '_AppState.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: '_AppState.currentPage', context: context);

  @override
  AppPage get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(AppPage value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$logInFailAtom =
      Atom(name: '_AppState.logInFail', context: context);

  @override
  bool get logInFail {
    _$logInFailAtom.reportRead();
    return super.logInFail;
  }

  @override
  set logInFail(bool value) {
    _$logInFailAtom.reportWrite(value, super.logInFail, () {
      super.logInFail = value;
    });
  }

  late final _$userNameAtom =
      Atom(name: '_AppState.userName', context: context);

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$todoListsAtom =
      Atom(name: '_AppState.todoLists', context: context);

  @override
  List<TodoList> get todoLists {
    _$todoListsAtom.reportRead();
    return super.todoLists;
  }

  @override
  set todoLists(List<TodoList> value) {
    _$todoListsAtom.reportWrite(value, super.todoLists, () {
      super.todoLists = value;
    });
  }

  late final _$todosAtom = Atom(name: '_AppState.todos', context: context);

  @override
  List<Todo> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(List<Todo> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$currentListAtom =
      Atom(name: '_AppState.currentList', context: context);

  @override
  String get currentList {
    _$currentListAtom.reportRead();
    return super.currentList;
  }

  @override
  set currentList(String value) {
    _$currentListAtom.reportWrite(value, super.currentList, () {
      super.currentList = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_AppState.login', context: context);

  @override
  Future<void> login(String name, String password) {
    return _$loginAsyncAction.run(() => super.login(name, password));
  }

  late final _$getListsAsyncAction =
      AsyncAction('_AppState.getLists', context: context);

  @override
  Future<void> getLists() {
    return _$getListsAsyncAction.run(() => super.getLists());
  }

  late final _$getTodosAsyncAction =
      AsyncAction('_AppState.getTodos', context: context);

  @override
  Future<void> getTodos(String listName) {
    return _$getTodosAsyncAction.run(() => super.getTodos(listName));
  }

  late final _$saveListAsyncAction =
      AsyncAction('_AppState.saveList', context: context);

  @override
  Future<void> saveList(String listName, String description, bool private) {
    return _$saveListAsyncAction
        .run(() => super.saveList(listName, description, private));
  }

  late final _$_AppStateActionController =
      ActionController(name: '_AppState', context: context);

  @override
  void goToLists() {
    final _$actionInfo =
        _$_AppStateActionController.startAction(name: '_AppState.goToLists');
    try {
      return super.goToLists();
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToTodos() {
    final _$actionInfo =
        _$_AppStateActionController.startAction(name: '_AppState.goToTodos');
    try {
      return super.goToTodos();
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToListEdit() {
    final _$actionInfo =
        _$_AppStateActionController.startAction(name: '_AppState.goToListEdit');
    try {
      return super.goToListEdit();
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goToTodoEdit() {
    final _$actionInfo =
        _$_AppStateActionController.startAction(name: '_AppState.goToTodoEdit');
    try {
      return super.goToTodoEdit();
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
currentPage: ${currentPage},
logInFail: ${logInFail},
userName: ${userName},
todoLists: ${todoLists},
todos: ${todos},
currentList: ${currentList}
    ''';
  }
}
