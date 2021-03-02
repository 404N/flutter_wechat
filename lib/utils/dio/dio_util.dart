import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'address.dart';
import 'base_entity.dart';

enum RequestMethod {
  POST,
  GET,
  PUT,
  DELETE,
}

class DioUtil {
// 请求实例
  static Dio instance;

  // 初始化请求实例
  static void initInstance() {
    DioUtil.instance = new Dio();
    DioUtil.instance.interceptors.add(
      InterceptorsWrapper(onRequest: (options) async {
        options.contentType = Headers.formUrlEncodedContentType;
        options.responseType = ResponseType.json;
        return options;
      }, onResponse: (option) async {
        if (option.statusCode == HttpStatus.ok) {
          option.data = BaseEntity.fromJson(option.data);
        } else {
          option.data = BaseEntity(
            500,
            "网络链接缓慢",
            null,
          );
        }
        return option;
      }),
    );
  }

  /// 请求
  static Future<Response<BaseEntity>> request(String url, RequestMethod method,
      {

      /// 参数
      Map<String, dynamic> data,

      /// 是否展示Loading
      bool showLoading = false,

      /// 错误时弹出提示
      bool errorTips = false,

      /// 正确或错误时都弹出提示
      bool tips = false,

      /// 正确时弹出提示
      bool successTips = false,
      bool useHost=true,
      }) {
    // 展示Loading
    if (showLoading) {
      EasyLoading.show(status: "");
    }
    Future<Response<BaseEntity>> response;
    if(useHost){
      url=Address.host+url;
    }
    switch (method) {
      case RequestMethod.GET:
        response = DioUtil.instance.get(url, queryParameters: data);
        break;
      case RequestMethod.DELETE:
        response = DioUtil.instance.delete(url, queryParameters: data);
        break;
      case RequestMethod.PUT:
        response = DioUtil.instance.put(url, data: data);
        break;
      case RequestMethod.POST:
        response = DioUtil.instance.post(url, data: data);
        break;
    }
    Completer<Response<BaseEntity<dynamic>>> completer = Completer();
    response.then((value) {
      if (showLoading) {
        EasyLoading.dismiss();
      }
      if (value.data.code == 0) {
        // 请求成功
        if (successTips || tips) {
          EasyLoading.showInfo(value.data.message);
        }
      } else {
        if (errorTips || tips) {
          EasyLoading.showError(value.data.message);
        }
      }
      completer.complete(value);
      return value;
    }).catchError((e) {
      EasyLoading.dismiss();
      EasyLoading.showInfo("网络链接缓慢");
      completer.completeError(e);
    });
    return completer.future;
  }
}
