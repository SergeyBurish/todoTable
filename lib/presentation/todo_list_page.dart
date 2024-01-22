import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_table/internal/dependencies/state_module.dart';

final appState = StateModule.appState();

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
              return Text('Todo Lists; Username: ${appState.userName}');
            }),
      ),
      body: Center(
        child: Observer(builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: appState.todoLists.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item ${appState.todoLists.elementAt(index).name}'),
                  onTap: () => print('tap on $index'),
                );
              },
            ),
          );
        })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Test'),
        tooltip: 'Test',
        child: Icon(Icons.question_mark),
      ),
    );
  }
}