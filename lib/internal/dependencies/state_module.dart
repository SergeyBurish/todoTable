
import 'package:todo_table/businessLogic/state/app_state.dart';
import 'package:todo_table/internal/dependencies/repository_module.dart';

class StateModule {
  static AppState? _appState;

  static AppState appState() {
    return _appState ?? (
      _appState = AppState(RepositoryModule.repository())
      );
  }
}