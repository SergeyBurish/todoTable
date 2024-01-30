import 'package:flutter/material.dart';
import 'package:todo_table/internal/dependencies/state_module.dart';
import 'package:todo_table/l10n/l10n.dart';
import 'package:todo_table/presentation/components/error_handler.dart';

final appState = StateModule.appState();

class TodoEditPage extends StatefulWidget {
  const TodoEditPage({super.key});

  @override
  State<TodoEditPage> createState() => _TodoEditPageState();
}

class _TodoEditPageState extends State<TodoEditPage> {

  String _name = '';
  String _description = '';
  bool _important = false;

  bool _nameValid = false;

  _changeName(String text){
    setState(() {
      _name = text;
      _nameValid = text.isNotEmpty;
    });
  }

  _changeDescription(String text){
    setState(() => _description = text);
  }

  _changeImportant(bool? val){
    setState(() => _important = val ?? false);
  }

  _saveTodo (context) {
    appState.saveTodo(_name, _description, _important,
      onFail: () => ErrorHandler.showError(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => appState.goToTodos(appState.currentList),
        ),
        title: Text(L10n.of(context).newTodo),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: L10n.of(context).todoName,
              errorText: _nameValid ? null : L10n.of(context).noEmpty,
            ),
            onChanged: _changeName,
          ),
          const SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: L10n.of(context).todoDescription,
            ),
            onChanged: _changeDescription,
          ),
          const SizedBox(height: 20,),
          CheckboxListTile(
            title: Text(L10n.of(context).important),
            value: _important,
            onChanged: _changeImportant,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          const SizedBox(height: 20,),
          ElevatedButton( onPressed: _nameValid ? () => _saveTodo(context) : null,
            child: Text(L10n.of(context).save),
          ),
        ],
      ),
      );
  }
}