import 'package:flutter/material.dart';

class SubDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SubDetail();
  }
}

class _SubDetail extends State<SubDetail> {
  List<String> todoList = new List.empty(growable: true);

  @override
  void initState() {
    super.initState();

    todoList.add(('Flutter 공부하기'));
    todoList.add(('코딩 테스트 풀기'));
    todoList.add(('면접 예상질문 추가하기'));
    todoList.add(('면접 예상질문 복습하기'));
    todoList.add(('앱 개발하기'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Detail Example'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              child: Text(
                todoList[index],
                style: TextStyle(fontSize: 30),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/third', arguments: todoList[index]);
              },
            ),
          );
        },
        itemCount: todoList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNavigation(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addNavigation(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed('/second');
    setState(() {
      todoList.add(result as String);
    });
  }
}
