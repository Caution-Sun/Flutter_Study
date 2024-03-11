import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FixedExtentScrollController? firstController;
  double _value = 0.0;

  @override
  void initState() {
    super.initState();
    firstController = FixedExtentScrollController(initialItem: 0);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
            child: Icon(Icons.arrow_back_ios), onPressed: () {}),
        middle: Text('Cupertino Design'),
        trailing:
            CupertinoButton(child: Icon(Icons.exit_to_app), onPressed: () {}),
      ),
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                child: Text('PICKER'),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 400,
                          child: Column(
                            children: [
                              Expanded(
                                  child: CupertinoPicker(
                                itemExtent: 50,
                                backgroundColor: Colors.white,
                                scrollController: firstController,
                                onSelectedItemChanged: (index) {},
                                children: List<Widget>.generate(10, (index) {
                                  return Center(
                                    child: TextButton(
                                      child: Text((++index).toString()),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  );
                                }),
                              )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('취소'))
                            ],
                          ),
                        );
                      });
                },
              ),
              CupertinoSlider(
                  value: _value,
                  max: 100,
                  onChanged: (double value)  {
                    setState(() {
                      _value = value;
                    });
                  }),
              Text(_value.toString())
            ],
          ),
        ),
      ),
    );
  }
}
