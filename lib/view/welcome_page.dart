import 'package:flutter/material.dart';
import 'package:flutter_wechat/utils/style/white_jotter_style.dart';

import '../res.dart';
import 'home_page.dart';

class WelcomePage extends StatefulWidget {
  static final String sName = "/";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isJump=false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(const Duration(milliseconds: 3000), () {
        if(!isJump){
          Navigator.pushReplacementNamed(context, HomePage.sName);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Image(
                      image: AssetImage(Res.wj),
                      width: 300,
                      height: 300,
                    ),
                  ),
                ),
                skipWidget(),
                SizedBox(
                  height: 30,
                )
              ],
            ),
            Positioned(
              right: 30,
              bottom: 20,
              child: Image(
                image: AssetImage(Res.wj_cat),
                width: 100,
                height: 100,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget skipWidget() {
    return Container(
      height: 40,
      width: 250,
      decoration: BoxDecoration(
        color: WJColors.primaryValue,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
        child: FlatButton(
          child: Text(
            "立刻进入",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            isJump=true;
            Navigator.pushReplacementNamed(context, HomePage.sName);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }
}
