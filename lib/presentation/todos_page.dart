import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_table/internal/dependencies/state_module.dart';
import 'package:todo_table/l10n/l10n.dart';
import 'package:todo_table/presentation/components/error_handler.dart';

final appState = StateModule.appState();

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});
  @override
  createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage>{

  @override
  void initState() {
    appState.getTodos(onFail: ()=>ErrorHandler.showError(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: appState.goToLists,
        ),
        title: Text('Todos; List selected: ${appState.currentList}'),
      ),
      body: Observer(builder: (_) {
        if (appState.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: appState.todos.length,
          itemBuilder: (BuildContext context, int index) {
            final todo = appState.todos.elementAt(index);
            return ListTile(
              title: Text('todo ${todo.name}'),
              onTap: () => print('tap on Todo ${todo.name}'),
            );
          },
        );}
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => appState.goToTodoEdit(),
        tooltip: L10n.of(context).addTodo,
        child: const Icon(Icons.add),
      ),
    );
  }
}