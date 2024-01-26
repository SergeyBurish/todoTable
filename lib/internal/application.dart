import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_table/businessLogic/state/app_state.dart';
import 'package:todo_table/internal/dependencies/state_module.dart';
import 'package:todo_table/l10n/l10n.dart';
import 'package:todo_table/presentation/list_edit_page.dart';
import 'package:todo_table/presentation/login_page.dart';
import 'package:todo_table/presentation/todo_edit_page.dart';
import 'package:todo_table/presentation/todo_lists_page.dart';
import 'package:todo_table/presentation/todos_page.dart';

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
      home: Container(
        decoration: const BoxDecoration(image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            repeat: ImageRepeat.repeat
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Observer(
                  builder: (_) => switch (appState.currentPage) {
                    AppPage.login => const LoginPage(),
                    AppPage.todoLists => const TodoListsPage(),
                    AppPage.todos => const TodosPage(),
                    AppPage.listEdit => const ListEditPage(),
                    AppPage.todoEdit => const TodoEditPage(),
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}