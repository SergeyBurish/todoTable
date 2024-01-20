import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_table/internal/dependencies/state_module.dart';

final appState = StateModule.appState();

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Lists'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Username:',
            ),
            Observer(builder: (_) {
              return Text('${appState.userName}');
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Test'),
        tooltip: 'Test',
        child: Icon(Icons.question_mark),
      ),
    );
  }
}