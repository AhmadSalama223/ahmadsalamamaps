import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mapsapp/EditTaskPage.dart';
import 'package:mapsapp/Homescreen.dart';
import 'package:mapsapp/Widgets/todo_items.dart';
import 'package:mapsapp/addpage.dart';
import 'package:mapsapp/model/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todosList = ToDo.todoList();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do App',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: HomeScreen(todosList: todosList),
    );
  }
}
