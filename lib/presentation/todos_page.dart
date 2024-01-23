import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_table/internal/dependencies/state_module.dart';

final appState = StateModule.appState();

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});
  @override
  createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage>{

  @override
  void initState() {
    print('TodosPage init');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos; List selected: ${appState.currentList}'),
      ),
      body: Observer(builder: (_) {
        if (appState.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: appState.todos.length,
              itemBuilder: (BuildContext context, int index) {
                final todo = appState.todos.elementAt(index);
                return ListTile(
                  title: Text('todo ${todo.name}'),
                  onTap: () => print('tap on Todo ${todo.name}'),
                );
              },
            ),
          )
        );}
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Test'),
        tooltip: 'Test',
        child: Icon(Icons.question_mark),
      ),
    );
  }
}