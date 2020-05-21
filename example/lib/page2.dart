import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  String tag;
  SecondPage(this.tag);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('data'),),
      body: Hero(
        tag: tag,
        child: Container(
        color: Colors.pink,
      ),
      )
    );
  }
}