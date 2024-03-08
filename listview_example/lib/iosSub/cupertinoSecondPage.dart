import 'package:flutter/cupertino.dart';
import '../animalItem.dart';

class CupertinoSecondPage extends StatefulWidget {
  final List<Animal>? animalList;

  const CupertinoSecondPage({Key? key, required this.animalList})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CupertinoSecondPage();
  }
}

class _CupertinoSecondPage extends State<CupertinoSecondPage> {
  TextEditingController? _textController;
  int _kindChoice = 0;
  bool _flyExist = false;
  String? _imaghPath;

  Map<int, Widget> segmentWidgets = {
    0: SizedBox(
      child: Text('양서류', textAlign: TextAlign.center),
      width: 80,
    ),
    1: SizedBox(
      child: Text('포유류', textAlign: TextAlign.center),
      width: 80,
    ),
    2: SizedBox(
      child: Text('파충류', textAlign: TextAlign.center),
      width: 80,
    ),
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('동물 추가'),
        ),
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: CupertinoTextField(
                    controller: _textController,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                  ),
                ),
                CupertinoSegmentedControl(
                    padding: EdgeInsets.only(bottom: 20, top: 20),
                    groupValue: _kindChoice,
                    children: segmentWidgets,
                    onValueChanged: (int value) {
                      setState(() {
                        _kindChoice = value;
                      });
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('날 수 있습니까?'),
                    CupertinoSwitch(
                        value: _flyExist,
                        onChanged: (value) {
                          setState(() {
                            _flyExist = value;
                          });
                        })
                  ],
                ),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      GestureDetector(
                        child: Image.asset('repo/images/cow.png', width: 80,),
                        onTap: (){
                          _imaghPath = 'repo/images/cow.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset('repo/images/fox.png', width: 80,),
                        onTap: (){
                          _imaghPath = 'repo/images/fox.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset('repo/images/bee.png', width: 80,),
                        onTap: (){
                          _imaghPath = 'repo/images/bee.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset('repo/images/cat.png', width: 80,),
                        onTap: (){
                          _imaghPath = 'repo/images/cat.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset('repo/images/pig.png', width: 80,),
                        onTap: (){
                          _imaghPath = 'repo/images/pig.png';
                        },
                      ),
                      GestureDetector(
                        child: Image.asset('repo/images/wolf.png', width: 80,),
                        onTap: (){
                          _imaghPath = 'repo/images/wolf.png';
                        },
                      ),
                    ],
                  ),
                ),
                CupertinoButton(child: Text('동물 추가하기'), onPressed: (){
                  widget.animalList?.add(Animal(animalName: _textController?.value.text, kind: getKind(_kindChoice), imagePath: _imaghPath, flyExist: _flyExist));
                })
              ],
            ),
          ),
        ));
  }

  getKind(int radioValue) {
    switch(radioValue){
      case 0:
        return "양서류";
      case 1:
        return "포유류";
      case 2:
        return "파충류";
    }
  }

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }
}

