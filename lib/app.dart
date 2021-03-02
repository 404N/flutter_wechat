import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wechat/route.dart';


class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    ///easyload初始化
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true;

    return MaterialApp(
      ///根据路由文件自动生成的路由
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
        // primarySwatch: WJColors.primarySwatch,
        // bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //   selectedItemColor: WJColors.color_306BFF,
        //   unselectedItemColor: WJColors.color_333333,
        // ),
        appBarTheme: AppBarTheme(
          iconTheme:IconThemeData(color: Colors.black),
        ),
        platform: TargetPlatform.iOS,
      ),
      builder: (BuildContext context, Widget child) {
        return FlutterEasyLoading(
          child: GestureDetector(
            onTap: () {
              hideKeyboard(context);
            },
            child: child,
          ),
        );
      },
    );
  }

  void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus.unfocus();
    }
  }
}
