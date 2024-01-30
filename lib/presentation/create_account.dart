import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_table/internal/dependencies/state_module.dart';
import 'package:todo_table/l10n/l10n.dart';
import 'package:todo_table/presentation/components/error_handler.dart';

final appState = StateModule.appState();

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  String _username = '';
  String _password = '';

  bool _nameValid = false;
  bool _pwdValid = false;

  _changeName(String text){
    setState(() {
      _username = text;
      _nameValid = text.length > 2;
    });
  }

  _changePwd(String text){
    setState(() {
      _password = text;
      _pwdValid = text.length > 3;
    });
  }

  bool _hidePassword = true;
  void _togglePwdVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  _createAccount (context) {
    appState.createAccount(_username, _password, 
      onFail: () => ErrorHandler.showError(context));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: appState.goToLogin,
        ),
        title: Text(L10n.of(context).appTitle),
      ),
      body: Observer(
        builder: (_) {
          if (appState.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: L10n.of(context).username,
                  errorText: _nameValid ? null : L10n.of(context).atLeast3,
                ),
                onChanged: _changeName,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  obscureText: _hidePassword,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: L10n.of(context).password,
                    errorText: _pwdValid ? null : L10n.of(context).atLeast4,
                    suffixIcon: GestureDetector(
                      onTap: _togglePwdVisibility,
                      child: Icon(
                        _hidePassword ? Icons.visibility_off : Icons.visibility),
                    ),
                  ),
                  onChanged: _changePwd,
                ),
              ),
              ElevatedButton(
                onPressed: (_nameValid && _pwdValid) ? () => _createAccount(context) : null,
                child: Text(L10n.of(context).createAnAccount),
              ),
            ],
          );
        }
      ),
    );
  }
}