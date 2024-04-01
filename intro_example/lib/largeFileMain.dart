import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class LargeFileMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LargeFileMain();
  }
}

class _LargeFileMain extends State<LargeFileMain> {
  TextEditingController? _editingController;

  // 현재 내려받는 중인지 확인하는 변수
  bool downloading = false;

  // 현재 얼마나 내려받았는지 표시하는 변수
  var progressingString = "";

  // 내려받은 파일
  String file = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _editingController,
          style: TextStyle(color: Colors.black),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: 'url을 입력하세요'),
        ),
      ),
      body: Center(
          child: downloading
              ? Container(
                  height: 120.0,
                  width: 200.0,
                  child: Card(
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Text(
                          'Downloading File: $progressingString',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              : FutureBuilder(
                  future: downloadingWidget(file),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        print('none');
                        return Text('데이터 없음');
                      case ConnectionState.waiting:
                        print('waiting');
                        return CircularProgressIndicator();
                      case ConnectionState.active:
                        print('active');
                        return CircularProgressIndicator();
                      case ConnectionState.done:
                        print('done');
                        if (snapshot.hasData) {
                          return snapshot.data as Widget;
                        }
                    }
                    print('end process');
                    return Text('데이터 없음');
                  },
                )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          downloadFile();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<void> downloadFile() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();
      await dio.download(_editingController!.value.text, '${dir.path}/myimage.jpg',
          onReceiveProgress: (rec, total) {
        print('Rec : $rec , Total : $total');
        file = '${dir.path}/myimage.jpg';
        setState(() {
          downloading = true;
          progressingString = ((rec / total) * 100).toStringAsFixed(0) + '%';
        });
      });
    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressingString = 'Completed';
    });
    print('Download completed');
  }

  Future<Widget> downloadingWidget(String filePath) async {
    File file = File(filePath);
    bool exist = await file.exists();
    new FileImage(file).evict();

    if(exist){
      return Center(
        child: Column(
          children: <Widget>[Image.file(File(filePath))],
        ),
      );
    }else{
      return Text('No Data');
    }
  }

  @override
  void initState() {
    super.initState();

    _editingController = new TextEditingController(
      text: 'https://images.pexels.com/photos/240040/pexels-photo-240040.jpeg''?auto=compress'
    );
  }
}
