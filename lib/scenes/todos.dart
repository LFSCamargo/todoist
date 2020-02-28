import 'package:todos/stores/todos/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final Todo todoStore = Todo();

  final TextEditingController controller = TextEditingController();

  void removeItemFromList(String name) => todoStore.deleteTodo(name);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Todo List'),
        ),
        body: Container(
          child: Observer(
              builder: (_) => Column(
                    children: <Widget>[
                      Padding(
                          child: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                  hintText: "Enter a value for a new Todo"),
                              onSubmitted: (text) {
                                this.todoStore.addTodo(text);
                                controller.text = "";
                              }),
                          padding: EdgeInsets.all(20.0)),
                      Expanded(
                        child: ListView.builder(
                          itemCount: todoStore.todos.length,
                          itemBuilder: (context, int index) {
                            final todo = todoStore.todos[index];
                            return Slidable(
                              actionPane: SlidableDrawerActionPane(),
                              actionExtentRatio: 0.25,
                              child: Container(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: todo.done
                                        ? Colors.green
                                        : Colors.orange,
                                    child: Icon(
                                        todo.done ? Icons.check : Icons.alarm,
                                        color: Colors.white),
                                    foregroundColor: Colors.white,
                                  ),
                                  title: Text('${todo.name}'),
                                  subtitle: Text(
                                      'Status: ${todo.done ? 'Done' : 'Pending'}'),
                                ),
                              ),
                              actions: <Widget>[
                                IconSlideAction(
                                  caption: '${!todo.done ? 'Done' : 'Pending'}',
                                  color:
                                      !todo.done ? Colors.green : Colors.orange,
                                  icon: !todo.done ? Icons.check : Icons.alarm,
                                  onTap: () => this
                                      .todoStore
                                      .updateTodoStatus(todo.name, !todo.done),
                                ),
                              ],
                              secondaryActions: <Widget>[
                                IconSlideAction(
                                  caption: 'Delete',
                                  color: Colors.red,
                                  icon: Icons.delete,
                                  onTap: () =>
                                      this.removeItemFromList(todo.name),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  )),
        ));
  }
}
