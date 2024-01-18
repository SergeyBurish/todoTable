import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_table/businessLogic/state/app_state.dart';
import 'package:todo_table/internal/dependencies/repository_module.dart';

final appState = AppState(); // Instantiate the store

void testRequest() {
  print("testRequest");

  RepositoryModule.repository().getUser(name: 'user1', password: '123').then(
    (users) => print(users.length));
}

class Login extends StatelessWidget {
  const Login();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Table Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Wrapping in the Observer will automatically re-render on changes to counter.value
            Observer(
              builder: (_) => Text(
                    '${appState.valueAs}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
            ),
            FloatingActionButton(
              onPressed: () => testRequest(),
              tooltip: 'Download',
              child: Icon(Icons.arrow_downward),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: appState.incrementAs,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}