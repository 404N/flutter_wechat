import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:flutter_wechat/utils/dio/dio_util.dart';
import 'package:flutter_wechat/viewmodel/service_locator.dart';
import 'package:sp_util/sp_util.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  SpUtil.getInstance();
  DioUtil.initInstance();
  runZoned(() {
    // DoKit.runApp(
    //   app: DoKitApp(App()),
    //   useInRelease: false,
    // );
    runApp(
      ScreenUtilInit(
        designSize: Size(360, 690),
        allowFontScaling: false,
        builder: () => App(),
      ),
    );
    // 判断当前设备是否为安卓
    if (Platform.isAndroid) {
      // 这一步设置状态栏颜色为透明
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }, onError: (Object obj, StackTrace stack) {
    print(obj);
    print(stack);
  });
}
