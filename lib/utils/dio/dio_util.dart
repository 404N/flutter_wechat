import 'dart:async';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'address.dart';
import 'base_entity.dart';
import 'intercept.dart';

enum RequestMethod {
  POST,
  GET,
  PUT,
  DELETE,
}

class DioUtil {
// 请求实例
  static Dio instance;

  static void initInstance() {
    var options = BaseOptions(
      connectTimeout: 15000,
      receiveTimeout: 15000,
      responseType: ResponseType.plain,
      baseUrl: Address.host,
      validateStatus: (status) {
        // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
        return true;
      },
    );
    DioUtil.instance = new Dio(options);

    /// 统一添加身份验证请求头
    DioUtil.instance.interceptors.add(
      InterceptorsWrapper(onRequest: (options) async {
        // String accessToken = SpUtil.getString(StorageKey.TOKEN);
        // if (accessToken.isNotEmpty) {
        //   options.headers["Authorization"] = "Bearer " + accessToken;
        // }
        options.contentType = Headers.jsonContentType;
        options.responseType = ResponseType.json;
        // print(options.headers['Authorization']);
        return options;
      }, onResponse: (option) async {
        if (option.statusCode == HttpStatus.ok) {
          // option.data = BaseEntity.fromJson(option.data);
        } else {
          option.data = BaseEntity(
            "500",
            "网络链接缓慢",
            null,
          );
        }
        return option;
      }),
    );
    DioUtil.instance.interceptors.add(LoggingInterceptor());
  }

  /// 请求
  static Future<void> request<T>(
      String url,
      RequestMethod method, {
        dynamic data,

        /// 参数
        Map<String, dynamic> queryParameters,

        /// 是否展示Loading
        bool showLoading = false,

        /// 错误时弹出提示
        bool errorTips = false,

        /// 正确或错误时都弹出提示
        bool tips = false,

        /// 正确时弹出提示
        bool successTips = false,
        bool useHost = true,
        Function(T t) onSuccess,
        Function(String code, String msg) onError,
      }) async {
    // 展示Loading
    if (showLoading) {
      EasyLoading.show(status: "");
    }
    var response;
    switch (method) {
      case RequestMethod.GET:
        response = await DioUtil.instance.get(
          url,
          queryParameters: queryParameters,
        );
        break;
      case RequestMethod.DELETE:
        response = await DioUtil.instance
            .delete(url, queryParameters: queryParameters);
        break;
      case RequestMethod.PUT:
        response = await DioUtil.instance.put(url, data: data);
        break;
      case RequestMethod.POST:
        response = await DioUtil.instance.post(url, data: data);
        break;
    }
    Completer<Response<BaseEntity<dynamic>>> completer = Completer();
    try{
      if (showLoading) {
        EasyLoading.dismiss();
      }
      print(T);
      BaseEntity<T> result = BaseEntity<T>.fromJson(response.data);
      if (result.code == "200") {
        if (successTips || tips) {
          Fluttertoast.showToast(msg: result.msg, gravity: ToastGravity.CENTER);
        }
        onSuccess(result.data);
      } else {
        if (errorTips || tips) {
          Fluttertoast.showToast(msg: result.msg, gravity: ToastGravity.CENTER);
        }
        onError(result.code, result.msg);
      }
    }catch(e){
      EasyLoading.dismiss();
      completer.completeError(e);
    }
  }
}
