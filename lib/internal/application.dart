import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_table/businessLogic/state/app_state.dart';
import 'package:todo_table/internal/dependencies/state_module.dart';
import 'package:todo_table/l10n/l10n.dart';
import 'package:todo_table/presentation/login.dart';
import 'package:todo_table/presentation/todo_list.dart';

final appState = StateModule.appState();

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Table',
      onGenerateTitle: (context) => L10n.of(context).appTitle,
      localizationsDelegates: L10n.localizationDelegates,
      supportedLocales: L10n.supportedLocales,
      // locale: L10n.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Observer(
        builder: (_) => switch (appState.currentPage) {
          AppPage.login => const Login(),
          AppPage.todoList => const TodoListPage(),
        },
      ),
    );
  }
}