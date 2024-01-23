import 'package:flutter/material.dart';

class ListEditPage extends StatefulWidget {
  const ListEditPage({super.key});

  @override
  State<ListEditPage> createState() => _ListEditPage();
}

class _ListEditPage extends State<ListEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListEditPage"),
      ),
      body: const Center(
        child: Text("ListEditPage")
        ),
      );
  }
}