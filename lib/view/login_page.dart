import 'package:flutter/material.dart';
import 'package:flutter_wechat/utils/style/Box.dart';
import 'package:flutter_wechat/utils/style/white_jotter_style.dart';
import 'package:flutter_wechat/viewmodel/login_viewmodel.dart';
import 'package:flutter_wechat/viewmodel/service_locator.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static final String sName = "/login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginViewModel model = serviceLocator<LoginViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>.value(
      value: model,
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: WJColors.white,
            body: child,
          );
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Box.h25,
              Box.h25,
              Box.h25,
              Container(
                child: Center(
                  child: Text(
                    "WeChat",
                    style: WjStyle.loginStyle,
                  ),
                ),
              ),
              Box.h10,
              Center(
                child: Icon(
                  Icons.account_circle,
                  size: 150,
                ),
              ),
              Box.h5,
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: model.userName,
                ),
              ),
              Box.h10,
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: model.password,
                ),
              ),
              Box.h10,
              GestureDetector(
                onTap: (){
                  model.login(context);
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    color: WJColors.color_306BFF,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Center(
                    child: Text("登录/注册"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
