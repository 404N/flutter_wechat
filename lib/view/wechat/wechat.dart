import 'package:flutter/material.dart';
import 'package:flutter_wechat/model/login_res_model_entity.dart';
import 'package:flutter_wechat/utils/style/white_jotter_style.dart';

class WeChat extends StatefulWidget {
  final LoginResModelContactVO contactVO;

  const WeChat({Key key, this.contactVO}) : super(key: key);
  @override
  _WeChatState createState() => _WeChatState();
}

class _WeChatState extends State<WeChat> {
  @override
  void initState() {
    super.initState();
  }
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
