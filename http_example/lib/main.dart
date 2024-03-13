import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  @override
  State<HttpApp> createState() => _HttpApp();
}

class _HttpApp extends State<HttpApp> {
  String result = '';
  List? data;

  @override
  void initState(){
    super.initState();
    data = new List.empty(growable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Example'),
      ),
      body: Container(
        child: Center(
          child: data!.length == 0
              ? Text('데이터가 없습니다', style: TextStyle(fontSize: 20), textAlign: TextAlign.center,)
              : ListView.builder(itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Text(data![index]['title'].toString()),
                        Text(data![index]['authors'].toString()),
                        Text(data![index]['sale_price'].toString()),
                        Text(data![index]['status'].toString()),
                        Image.network(
                          data![index]['thumbnail'],
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        )
                      ],
                    )
                  )
                );
          },
          itemCount: data!.length
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getJSONData();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = 'https://dapi.kakao.com/v3/search/book?target=title&query=doit';
    var response = await http.get(Uri.parse(url), headers: {"Authorization": "KakaoAK ##REST API KEY 입력 부분##"});

    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON['documents'];
      data!.addAll(result);
    });

    return response.body;
  }
}
