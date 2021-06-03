import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sp_util/sp_util.dart';

class AuthInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) {
    // String accessToken = SpUtil.getString(StorageKey.TOKEN);
    // if (accessToken.isNotEmpty) {
    //   options.headers["Authorization"] = "Bearer " + accessToken;
    // }
    return super.onRequest(options);
  }
}

class LoggingInterceptor extends Interceptor {
  DateTime startTime;
  DateTime endTime;

  @override
  onRequest(RequestOptions options) {
    startTime = DateTime.now();
    print("----------Start----------");
    if (options.queryParameters.isEmpty) {
      print("RequestUrl: " + options.baseUrl + options.path);
    } else {
      print("RequestUrl: " +
          options.baseUrl +
          options.path +
          "?" +
          Transformer.urlEncodeMap(options.queryParameters));
    }
    FormData formData = options.data;
    String logData =
    formData?.fields == null ? "null" : formData.fields.toString();

    print("RequestMethod: " + options.method);
    print("RequestHeaders:" + options.headers.toString());
    print("RequestContentType: ${options.contentType}");
    print("RequestData: $logData");
    return super.onRequest(options);
  }

  @override
  onResponse(Response response) {
    endTime = DateTime.now();
    int duration = endTime.difference(startTime).inMilliseconds;
    if (response.statusCode == 200) {
      print("ResponseCode: ${response.statusCode}");
    } else {
      print("ResponseCode: ${response.statusCode}");
    }
    // 输出结果
    print(response.data.toString());
    print("----------End: $duration 毫秒----------");
    return super.onResponse(response);
  }

  @override
  onError(DioError err) {
    print("----------Error-----------");
    return super.onError(err);
  }
}
