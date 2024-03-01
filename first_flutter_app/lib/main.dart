import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  //var switchValue = false;
  String test = 'hello';
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        darkTheme: ThemeData.light(),
        home: Scaffold(
          body: Center(
              child: ElevatedButton(
                  child: Text('$test'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(_color)),
                  onPressed: () {
                    if(_color == Colors.blue){
                      setState(() {
                        test = 'flutter';
                        _color = Colors.amber;
                      });
                    }else{
                      setState((){
                        test = 'hello';
                        _color = Colors.blue;
                      });
                    }
                  })),
        ));
  }
}
