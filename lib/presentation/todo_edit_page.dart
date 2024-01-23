import 'package:flutter/material.dart';

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
        title: const Text("TodoEditPage"),
      ),
      body: const Center(
        child: Text("TodoEditPage")
        ),
      );
  }
}