import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'todo.dart';

class AddTodoApp extends StatefulWidget {
  final Future<Database> db;
  AddTodoApp(this.db);

  @override
  State<StatefulWidget> createState() {
    return _AddTodoApp();
  }
}

class _AddTodoApp extends State<StatefulWidget>{

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo 추가'),),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }

}