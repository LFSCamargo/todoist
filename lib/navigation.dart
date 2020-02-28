import 'package:flutter/material.dart';
import 'scenes/todos.dart';

class Navigation {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => TodoList());
      default:
    }
  }
}
