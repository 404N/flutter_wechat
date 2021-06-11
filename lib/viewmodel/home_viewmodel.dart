
import 'package:flutter/material.dart';
import 'package:flutter_wechat/model/login_res_model_entity.dart';
import 'package:flutter_wechat/model/user_entity.dart';

class HomeIndexViewModel extends ChangeNotifier{
  int _index = 0;

  int get index => _index;

  LoginResModelEntity loginResModelEntity;
  UserEntity userEntity;


  set index(int val) {
    _index = val;
    notifyListeners();
  }

  void switchIndex(int val){
    _index = val;
    notifyListeners();
  }
}