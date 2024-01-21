import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_table/internal/dependencies/state_module.dart';

final appState = StateModule.appState();

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login>{

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
        title: const Text('Todo Table'),
      ),
      body: Observer(
        builder: (_) {
          if (appState.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  const Spacer(flex: 2,),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username'
                    ),
                    onChanged: _changeName,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password'
                      ),
                      onChanged: _changePwd,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => appState.login(_username, _password), 
                    child: const Text('Log in'),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      style:TextStyle(fontSize: 20),
                      AppLocalizations.of(context).noAccountQuestion,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => print('Create an account'), 
                    child: const Text('Create an account'),
                  ),
                  const Spacer(flex: 2,),
                ],
              ),
            ),
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