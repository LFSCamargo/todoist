import 'package:flutter/material.dart';
import './navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String _appName = 'Todoist';

  @override
  Widget build(BuildContext context) {
    var initialRoute = 'home';
    return MaterialApp(
      title: _appName,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Montserrat',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: '/$initialRoute',
      onGenerateRoute: Navigation.routes,
    );
  }
}
