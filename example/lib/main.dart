import 'package:dg_tools/packages.dart';
import 'package:dg_tools/static/enums.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey keyA = GlobalKey();
  GlobalKey keyB = GlobalKey();
  GlobalKey keyC = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 200,
            left: 0,
            child: RepaintBoundary(
              key: keyA,
              child: ClipOval(
                  child: Container(
                width: 100.0,
                height: 100.0,
                child: Image.network(
                  'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2393912978,721795803&fm=26&gp=0.jpg',
                  fit: BoxFit.cover,
                ),
              )),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: RepaintBoundary(
              key: keyB,
              child: ClipOval(
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 250,
            child: RepaintBoundary(
              key: keyC,
              child: ClipOval(
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DgTools.moveAnimation(
              metaKey: keyA,
              targetKeys: [keyB, keyC],
              endOpacity: 0.2,
              moveType: MoveType.linear,
              transientTime: Duration(seconds: 1),
              rotate: true);
        },
        tooltip: 'Increment',
        child: RepaintBoundary(
          child: Icon(Icons.add),
        ), //
      ),
    ));
  }
}
