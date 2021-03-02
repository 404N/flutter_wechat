import 'dart:async';
import 'dart:io';
import 'package:dokit/dokit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wechat/utils/dio/dio_util.dart';
import 'package:flutter_wechat/viewmodel/service_locator.dart';

import 'app.dart';

void main() async {
  setupServiceLocator();
  DioUtil.initInstance();
  runZoned(() {
    // DoKit.runApp(
    //   app: DoKitApp(App()),
    //   useInRelease: false,
    // );
    runApp(App());
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