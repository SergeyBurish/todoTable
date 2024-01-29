import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_table/internal/dependencies/state_module.dart';
import 'package:todo_table/l10n/l10n.dart';
import 'package:todo_table/presentation/components/error_handler.dart';

final appState = StateModule.appState();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{

  String _username = '';
  String _password = '';

  _changeName(String text){
    setState(() => _username = text);
  }

  _changePwd(String text){
    setState(() => _password = text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).loginTitle),
      ),
      body: Observer(
        builder: (_) {
          if (appState.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: <Widget>[
              const Spacer(flex: 2,),
              TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: L10n.of(context).username,
                ),
                onChanged: _changeName,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: L10n.of(context).password
                  ),
                  onChanged: _changePwd,
                ),
              ),
              ElevatedButton(
                onPressed: () => appState.login(_username, _password, 
                  onFail: () => ErrorHandler.showError(context)
                ), 
                child: Text(L10n.of(context).logIn),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  style:const TextStyle(fontSize: 20),
                  L10n.of(context).noAccountQuestion,
                ),
              ),
              ElevatedButton(
                onPressed: () => print('Create an account'), 
                child: Text(L10n.of(context).createAnAccount),
              ),
              const Spacer(flex: 2,),
            ],
          );
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Change language'),
        tooltip: 'Language',
        child: const Icon(Icons.language),
      ),
    );
  }
}