import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_table/internal/dependencies/state_module.dart';

final appState = StateModule.appState();

class Login extends StatelessWidget {
  const Login({super.key});

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
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username'
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password'
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: appState.getUser, 
                    child: const Text('Log in'),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      style:TextStyle(fontSize: 20),
                      'No account?',
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