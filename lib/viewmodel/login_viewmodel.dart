import 'package:flutter/material.dart';
import 'package:flutter_wechat/model/user_entity.dart';
import 'package:flutter_wechat/utils/common/storage_key.dart';
import 'package:flutter_wechat/utils/dio/address.dart';
import 'package:flutter_wechat/utils/dio/dio_util.dart';
import 'package:flutter_wechat/view/home_page.dart';
import 'package:dio/dio.dart';
import 'package:sp_util/sp_util.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  void login(BuildContext context) {
    DioUtil.request<UserEntity>(Address.login(), RequestMethod.POST,
        data: FormData.fromMap(
          {"email": userName.text, "password": password.text},
        ), onSuccess: (data) {
      SpUtil.putObject(StorageKey.USER_INFO, data);
      Navigator.pushReplacementNamed(context, HomePage.sName);
    }, onError: (code, msg) {
      print(msg);
    });
  }
}
