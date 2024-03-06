import 'package:flutter/material.dart';
import 'package:listview_example/sub/firstPage.dart';
import 'package:listview_example/sub/secondPage.dart';
import 'animalItem.dart';

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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController? tabController;
  List<Animal> animalList = new List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);

    animalList.add(Animal(animalName: "벌", kind: "곤충", imagePath: "repo/images/bee.png", flyExist: true));
    animalList.add(Animal(animalName: "고양이", kind: "포유류", imagePath: "repo/images/cat.png"));
    animalList.add(Animal(animalName: "소", kind: "포유류", imagePath: "repo/images/cow.png"));
    animalList.add(Animal(animalName: "개", kind: "포유류", imagePath: "repo/images/dog.png"));
    animalList.add(Animal(animalName: "여우", kind: "포유류", imagePath: "repo/images/fox.png"));
    animalList.add(Animal(animalName: "원숭이", kind: "포유류", imagePath: "repo/images/monkey.png"));
    animalList.add(Animal(animalName: "돼지", kind: "포유류", imagePath: "repo/images/pig.png"));
    animalList.add(Animal(animalName: "늑대", kind: "포유류", imagePath: "repo/images/wolf.png"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview Example'),
      ),
      body: TabBarView(
        children: <Widget>[FirstApp(list: animalList), SecondApp(list: animalList)],
        controller: tabController,
      ),
      bottomNavigationBar: TabBar(tabs: <Tab>[
        Tab(icon: Icon(Icons.looks_one, color: Colors.blue,),),
        Tab(icon: Icon(Icons.looks_two, color: Colors.blue,),)
      ], controller: tabController,),
    );
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }
}
