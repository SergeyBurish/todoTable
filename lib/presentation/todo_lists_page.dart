import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_table/internal/dependencies/state_module.dart';
import 'package:todo_table/l10n/l10n.dart';
import 'package:todo_table/presentation/components/error_handler.dart';

final appState = StateModule.appState();

class TodoListsPage extends StatefulWidget {
  const TodoListsPage({super.key});
  @override
  createState() => _TodoListsPageState();
}

class _TodoListsPageState extends State<TodoListsPage>{

  @override
  void initState() {
    appState.getLists(onFail: ()=>ErrorHandler.showError(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).todoLists),
        actions: [MenuAnchor(
          builder: (BuildContext context, MenuController controller, Widget? child) {
            return ElevatedButton(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 120),
                child: Text(appState.userName, overflow: TextOverflow.ellipsis,)), 
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
            );
          },
          menuChildren: [
            MenuItemButton(
              onPressed: appState.logOut,
              child: Row(
                children: [
                  const Icon(Icons.logout),
                  Text(L10n.of(context).logOut),
                ],
              ),
            )
          ],)
        ],
      ),
      body: Observer(builder: (_){ 
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
                      Expanded(child: Center(child: Text(L10n.of(context).name))),
                      Text(L10n.of(context).private),
                      Opacity(
                        opacity: 0, // hide icon but keep space
                        child: IconButton(icon: const Icon(Icons.delete), onPressed: (){},))
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: appState.todoLists.length,
                      itemBuilder: (BuildContext context, int index) {
                        final todoList = appState.todoLists.elementAt(index);
                        return InkWell(
                          onTap: () => appState.goToTodos(todoList.name),
                          child: Container(
                            color: (index % 2 == 0) ? Colors.black12 : Colors.white,
                            child: Row(
                              children: [
                                Expanded(child: Center(child: Text(todoList.name))),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 0, // hide text but keep width
                                      child: Text(L10n.of(context).private)
                                    ),
                                    todoList.private ? const Icon(Icons.check) : const Icon(Icons.remove),
                                  ],
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete), 
                                  onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      title: Text(L10n.of(context).deleteList),
                                      content: Text(L10n.of(context).deleteListMessage(todoList.name)),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, 'Cancel'),
                                          child: Text(L10n.of(context).cancel),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, 'OK');
                                            appState.deleteList(todoList.name);
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
        onPressed: () => appState.goToListEdit(),
        tooltip: L10n.of(context).addTodoList,
        child: const Icon(Icons.add),
      ),
    );
  }
}