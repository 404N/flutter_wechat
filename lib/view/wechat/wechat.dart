import 'package:flutter/material.dart';
import 'package:flutter_wechat/utils/style/white_jotter_style.dart';

class WeChat extends StatefulWidget {
  @override
  _WeChatState createState() => _WeChatState();
}

class _WeChatState extends State<WeChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "微信",
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
