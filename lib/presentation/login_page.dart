import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_table/internal/dependencies/state_module.dart';
import 'package:todo_table/l10n/l10n.dart';
import 'package:todo_table/presentation/components/error_handler.dart';
import 'package:url_launcher/url_launcher.dart';

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

  bool _hidePassword = true;
  void _togglePwdVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  obscureText: _hidePassword,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: L10n.of(context).password,
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
                onPressed: () => appState.goToCreateAccount(),
                child: Text(L10n.of(context).createAnAccount),
              ),
              const Spacer(flex: 2,),
            ],
          );
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text(L10n.of(context).about),
            content: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: L10n.of(context).aboutPart1(appState.appVersion),
                    style: const TextStyle(color: Colors.black),),
                  TextSpan(
                    text: 'Flutter',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => launch('https://flutter.dev/')),
                  TextSpan(
                    text: L10n.of(context).aboutPart2,
                    style: const TextStyle(color: Colors.black),),
                  TextSpan(
                    text: L10n.of(context).aboutPart3,
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => launch('https://hh.ru/resume/4ea606e8ff0b350b400039ed1f6133734b3242?hhtmFrom=resume_list')),
                ]
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'OK');
                },
                child: Text(L10n.of(context).ok),
              ),
            ],
          ),
        ),
        tooltip: L10n.of(context).about,
        child: const Icon(Icons.info),
      ),
    );
  }
}