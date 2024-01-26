import 'package:flutter/material.dart';
import 'package:todo_table/internal/dependencies/state_module.dart';

final appState = StateModule.appState();

class TodoEditPage extends StatefulWidget {
  const TodoEditPage({super.key});

  @override
  State<TodoEditPage> createState() => _TodoEditPageState();
}

class _TodoEditPageState extends State<TodoEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => appState.goToTodos(),
        ),
        title: const Text("TodoEditPage"),
      ),
      body: const Center(
        child: Text("TodoEditPage")
        ),
      );
  }
}