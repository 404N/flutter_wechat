import 'package:flutter/material.dart';
import 'package:flutter_wechat/view/home_page.dart';
import 'package:flutter_wechat/view/login_page.dart';
import 'package:flutter_wechat/view/welcome_page.dart';


///配置路由
Map<String, WidgetBuilder> routes = {
  WelcomePage.sName: (context) {
    return WelcomePage();
  },
  //登录页
  LoginPage.sName: (context) {
    return LoginPage();
  },
  //首页
  HomePage.sName: (context) {
    return HomePage();
  },
};

RouteFactory onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments),
        settings: RouteSettings(name: settings.name),
      );
      return route;
    } else {
      Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(context),
        settings: RouteSettings(name: settings.name),
      );
      return route;
    }
  }
  return null;
};
