import 'package:flutter/material.dart';
import 'package:flutter_wechat/utils/style/white_jotter_style.dart';

class Finds extends StatefulWidget {
  @override
  _FindsState createState() => _FindsState();
}

class _FindsState extends State<Finds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "发现",
          style: WjStyle.appBarStyle,
        ),
        backgroundColor: WJColors.color_F5F6F7,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(),
    );
  }
}
