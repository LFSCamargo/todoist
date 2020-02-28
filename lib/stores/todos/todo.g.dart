// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Todo on _Todo, Store {
  final _$todosAtom = Atom(name: '_Todo.todos');

  @override
  ObservableList<TodoType> get todos {
    _$todosAtom.context.enforceReadPolicy(_$todosAtom);
    _$todosAtom.reportObserved();
    return super.todos;
  }

  @override
  set todos(ObservableList<TodoType> value) {
    _$todosAtom.context.conditionallyRunInAction(() {
      super.todos = value;
      _$todosAtom.reportChanged();
    }, _$todosAtom, name: '${_$todosAtom.name}_set');
  }

  final _$_TodoActionController = ActionController(name: '_Todo');

  @override
  void addTodo(String name) {
    final _$actionInfo = _$_TodoActionController.startAction();
    try {
      return super.addTodo(name);
    } finally {
      _$_TodoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTodo(String name) {
    final _$actionInfo = _$_TodoActionController.startAction();
    try {
      return super.deleteTodo(name);
    } finally {
      _$_TodoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTodoStatus(String name, bool done) {
    final _$actionInfo = _$_TodoActionController.startAction();
    try {
      return super.updateTodoStatus(name, done);
    } finally {
      _$_TodoActionController.endAction(_$actionInfo);
    }
  }
}
