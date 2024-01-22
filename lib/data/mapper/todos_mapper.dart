import 'package:todo_table/businessLogic/model/todo.dart';
import 'package:todo_table/data/api/dto/todo_dto.dart';

class TodosMapper {
  static List<Todo> fromDto(TodosDto todosDto) {
    List<Todo> todos = [];

    for(var todoDto in todosDto.todos) {
      todos.add(Todo(
        name: todoDto.name,
        important: todoDto.important,
        completed: todoDto.completed, ));
    }

    return todos;
  }
}