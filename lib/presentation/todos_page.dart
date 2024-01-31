import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_table/internal/dependencies/state_module.dart';
import 'package:todo_table/l10n/l10n.dart';
import 'package:todo_table/presentation/components/error_handler.dart';

final appState = StateModule.appState();

const NAME_FLEX = 1;
const DESCR_FLEX = 3;

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});
  @override
  createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage>{

  @override
  void initState() {
    appState.getTodos(onFail: ()=>ErrorHandler.showError(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: appState.goToLists,
        ),
        title: Text(L10n.of(context).todos),
      ),
      body: Observer(builder: (_) {
        if (appState.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: DecoratedBox(
            decoration: const BoxDecoration(boxShadow: [BoxShadow(blurRadius: 7, color: Colors.grey)]),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      // Text(L10n.of(context).important),
                      Expanded(child: Row(
                        children: [
                          Expanded(
                            flex: NAME_FLEX,
                            child: Center(child: Text(L10n.of(context).name))),
                          Expanded(
                            flex: DESCR_FLEX,
                            child: Center(child: Text(L10n.of(context).description)))
                        ],
                      )),
                      Text(L10n.of(context).important),
                      Opacity(
                        opacity: 0, // hide icon but keep space
                        child: IconButton(icon: const Icon(Icons.delete), onPressed: (){},))
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: appState.todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        final todo = appState.todos.elementAt(index);
                        return InkWell(
                          onTap: () => print('mark todo completed'),
                          child: Container(
                            color: (index % 2 == 0) ? Colors.black12 : Colors.white,
                            child: Row(
                              children: [
                                Expanded(child: Row(
                                  children: [
                                    Expanded(
                                      flex: NAME_FLEX,
                                      child: Center(child: Text(todo.name))),
                                    Expanded(
                                      flex: DESCR_FLEX,
                                      child: Center(child: Text(todo.description ?? ''))),
                                  ],
                                )),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 0, // hide text but keep width
                                      child: Text(L10n.of(context).important)
                                    ),
                                    todo.important ? const Icon(Icons.check) : const Icon(Icons.remove),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      title: Text(L10n.of(context).deleteTodo),
                                      content: Text(L10n.of(context).deleteTodoMessage(todo.name)),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, 'Cancel'),
                                          child: Text(L10n.of(context).cancel),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, 'OK');
                                            appState.deleteTodo(todo.name);
                                          },
                                          child: Text(L10n.of(context).delete),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );}
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => appState.goToTodoEdit(),
        tooltip: L10n.of(context).addTodo,
        child: const Icon(Icons.add),
      ),
    );
  }
}