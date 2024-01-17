import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'counter.dart'; // Import the Counter

final counter = Counter(); // Instantiate the store

void testRequest() {
  print("testRequest");

  const _BASE_URL = 'https://api.airtable.com/v0/appTZNzop6QNsjyGs/Table%20ZZZ';

  Dio dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  var token = "pat65DA0Jg6YfYcS0.ba2a281f0fa118edf0c6076e93697f96b2c638c781c806eda7b1525b9764af1b";

  dio.get(  
    '',
    queryParameters: {},
    options: Options(
        headers: {"Authorization": "Bearer $token"},
      )
  ).then((value) => print(value));
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX Counter'),
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