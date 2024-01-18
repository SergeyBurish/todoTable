import 'package:mobx/mobx.dart';

// Include generated file
part 'app_state.g.dart';

// This is the class used by rest of your codebase
class AppState = _AppState with _$AppState;

// The store-class
abstract class _AppState with Store {
  @observable
  int valueAs = 0;

  @action
  void incrementAs() {
    valueAs += 2;
  }
}