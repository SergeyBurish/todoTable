import 'package:flutter/material.dart';
import 'package:todo_table/internal/dependencies/state_module.dart';
import 'package:todo_table/l10n/l10n.dart';
import 'package:todo_table/presentation/components/error_handler.dart';

final appState = StateModule.appState();

class ListEditPage extends StatefulWidget {
  const ListEditPage({super.key});

  @override
  State<ListEditPage> createState() => _ListEditPage();
}

class _ListEditPage extends State<ListEditPage> {

  String _name = '';
  String _description = '';
  bool _private = false;

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

  _changePrivate(bool? val){
    setState(() => _private = val ?? false);
  }

  _saveList (context) {
    appState.saveList(_name, _description, _private, 
      onFail: () => ErrorHandler.showError(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: appState.goToLists,
        ),
        title: Text(L10n.of(context).newTodoList),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: L10n.of(context).listName,
              errorText: _nameValid ? null : L10n.of(context).noEmpty,
            ),
            onChanged: _changeName,
          ),
          const SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: L10n.of(context).listDescription,
            ),
            onChanged: _changeDescription,
          ),
          const SizedBox(height: 20,),
          CheckboxListTile(
            title: Text(L10n.of(context).private),
            value: _private,
            onChanged: _changePrivate,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: _nameValid ? () => _saveList(context) : null, 
            child: Text(L10n.of(context).save),
          ),
        ],
      ),
      );
  }
}