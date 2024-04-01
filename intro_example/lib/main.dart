import 'package:flutter/material.dart';
import 'largeFileMain.dart';
import 'introPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Intropage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로고 바꾸기'),
        actions: <Widget>[
          TextButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LargeFileMain()));
              },
              child: Text('로고 바꾸기', style: TextStyle(color: Colors.black),))
        ],
      ),
      body: Container(),
    );
  }
}
