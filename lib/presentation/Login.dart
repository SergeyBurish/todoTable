import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_table/data/api/api_util.dart';
import 'package:todo_table/data/api/service/airtable_service.dart';

import 'package:todo_table/counter.dart'; // Import the Counter

final counter = Counter(); // Instantiate the store

void testRequest() {
  print("testRequest");

  ApiUtil util = ApiUtil(AirtableService());
  util.getUser(name: 'user1', password: '123');
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
                    '${counter.value}',
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
        onPressed: counter.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}