import 'package:todo_table/businessLogic/model/todo_list.dart';
import 'package:todo_table/data/api/dto/todo_list_dto.dart';

class TodoListsMapper {
  static List<TodoList> fromDto(TodoListsDto todoListsDto) {
    List<TodoList> lists = [];

    for(var todoListDto in todoListsDto.lists) {
      lists.add(TodoList(
        name: todoListDto.name, 
        private: todoListDto.private, ));
    }

    return lists;
  }
}