import 'package:mobx/mobx.dart';

part 'todo.g.dart';

class Todo = _Todo with _$Todo;

class TodoType {
  String name;
  bool done;

  TodoType({
    this.name,
    this.done,
  });
}

abstract class _Todo with Store {
  @observable
  ObservableList<TodoType> todos = [
    TodoType(
      name: 'Learn how to do flutter components',
      done: false,
    ),
    TodoType(
      name: 'Learn how to code mobx and flutter',
      done: false,
    ),
    TodoType(
      name: 'Code a todos app with flutter and mobx',
      done: false,
    ),
  ].asObservable();

  @action
  void addTodo(String name) {
    todos = [
      ...todos,
      new TodoType(
        name: name,
        done: false,
      )
    ].asObservable();
  }

  @action
  void deleteTodo(String name) {
    todos.removeWhere((item) => item.name == name);
  }

  @action
  void updateTodoStatus(String name, bool done) {
    todos = todos
        .map((todo) => todo.name == name
            ? TodoType(done: done, name: todo.name)
            : TodoType(done: todo.done, name: todo.name))
        .toList()
        .asObservable();
  }
}
