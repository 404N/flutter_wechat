import 'package:flutter_wechat/generated/json/base/json_convert_content.dart';

class BaseEntity<T> {

  String code;
  String msg;
  T data;

  BaseEntity(this.code, this.msg, this.data);

  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'] ?? json['Code'];
    msg = json['msg'] ?? json['Msg'];
    if (json.containsKey("data")) {
      if (json['data'] == null || json['data'] == "") {
        data = null;
      } else if (T.toString() == "String") {
        data = json["data"].toString() as T;
      } else if (T.toString() == "Map<dynamic, dynamic>") {
        data = json["data"] as T;
      } else {
        data = JsonConvert.fromJsonAsT(json["data"]);
      }
    }
  }
}