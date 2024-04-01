import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'main.dart';

class Intropage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IntroPage();
  }
}

class _IntroPage extends State<Intropage>{
  Widget logo = Icon(
    Icons.info,
    size: 50,
  );

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              logo,
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                      return MyHomePage();
                    }));
                  },
                  child: Text('다음으로 가기'))
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }

  void initData() async {
    var dir = await getApplicationDocumentsDirectory();
    bool fileExist = await File(dir.path + '/myimage.jpg').exists();

    if(fileExist){
      setState(() {
        logo = Image.file(
          File(dir.path + '/myimage.jpg'),
          height: 200,
          width: 200,
          fit: BoxFit.contain
        );
      });
    }
  }

}