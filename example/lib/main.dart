import 'package:dg_tools/packages.dart';
import 'package:dg_tools/static/enums.dart';
import 'package:dg_tools_example/page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plugin example app',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey keyA = GlobalKey();
  GlobalKey keyB = GlobalKey();
  GlobalKey keyC = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1380, allowFontScaling: true);
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
              child: Container(
                  width: 100.0,
                  height: 100.0,
                  child: Image.network(
                    'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2393912978,721795803&fm=26&gp=0.jpg',
                    fit: BoxFit.cover,
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
          Positioned(
            bottom: 200,
            left: 200,
            child: InkWell(
              onTap: () {
                // DgAnimations.moveAnimation(
                //     metaKey: keyA,
                //     targetKeys: [keyB, keyC],
                //     endOpacity: 0.2,
                //     moveType: MoveType.linear,
                //     transientTime: Duration(seconds: 1),
                //     rotate: true,
                //     oval: true);
                DgTools.showLoadingDialog(context,
                    ballColor: Colors.green,
                    backgroundColor: Colors.yellow,
                    pathColor: Colors.black,
                    widthAndHeight: ScreenUtil().setWidth(200));

                // Navigator.push(context, PageRouteBuilder(
                //     // transitionDuration: Duration(seconds: 1),
                //     pageBuilder: (BuildContext context, Animation animation,
                //         Animation secondaryAnimation) {
                //   return Stack(
                //     alignment: Alignment.center,
                //     children: <Widget>[
                //       Positioned(
                //         top: 1000 - 50.0 * animation.value,
                //         left: 1000 - 50.0 * animation.value,
                //         child: SizedBox(
                //           height: 50 * 2 * animation.value,
                //           width: 50 * 2 * animation.value,
                //           child: ClipOval(
                //             child: Align(
                //               alignment: Alignment.center,
                //               child: Container(
                //                 color: Colors.red,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   );
                // }));
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    ));
  }
}
