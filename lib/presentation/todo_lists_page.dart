import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_table/internal/dependencies/state_module.dart';

final appState = StateModule.appState();

class TodoListsPage extends StatefulWidget {
  const TodoListsPage({super.key});
  @override
  createState() => _TodoListsPageState();
}

class _TodoListsPageState extends State<TodoListsPage>{

  @override
  void initState() {
    appState.getLists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
              Text('Todo Lists; Username: ${appState.userName}'),
      ),
      body: Observer(builder: (_){ 
        if (appState.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: appState.todoLists.length,
              itemBuilder: (BuildContext context, int index) {
                final todoList = appState.todoLists.elementAt(index);
                return ListTile(
                  title: Text('Item ${todoList.name}'),
                  onTap: () => appState.getTodos(todoList.name),
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