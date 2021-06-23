import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wechat/generated/json/base/json_convert_content.dart';
import 'package:flutter_wechat/model/login_res_model_entity.dart';
import 'package:flutter_wechat/model/user_entity.dart';
import 'package:flutter_wechat/utils/common/storage_key.dart';
import 'package:flutter_wechat/utils/event_bus.dart';
import 'package:flutter_wechat/utils/websocket_util.dart';
import 'package:sp_util/sp_util.dart';

class HomeIndexViewModel extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  LoginResModelEntity loginResModelEntity;
  UserEntity userEntity;

  void init() {
    WebSocketUtility().initWebSocket(onOpen: () {
      WebSocketUtility().initHeartBeat(userEntity.uid);
      var bindJson = '{ "type": 1, "data": {"uid":' + userEntity.uid + ' }}';
      sendMsg(bindJson);
    }, onMessage: (message) {
      Map<String, dynamic> data = json.decode(message);
      print(data);
      if (data != null) {
        switch (data['type']) {
          case 1:
            if (data['status'] != "" && data['status'] == 'success') {
              print('上线成功');
              loginResModelEntity.contactVO = JsonConvert
                  .fromJsonAsT<LoginResModelEntity>(data['data'])
                  .contactVO;
              notifyListeners();
              SpUtil.putObject(StorageKey.HOME_DATA, data['data']);
            } else {
              print('上线失败');
            }
            break;
          case 2:
            //接收查询消息接口
            eventBus.fire(ApplicationExitEvent(data));
            break;
          case 3:
            //接收消息
            eventBus.fire(ApplicationExitEvent(data));
            break;
          case 4:
            eventBus.fire(ApplicationExitEvent(data));
            break;
          case 5:
            //轮询总未读
            break;
          case 10:
            //接收到好友请求
            eventBus.fire(ApplicationExitEvent(data));
            break;
          case 100:
            //接收群聊消息查询数据
            eventBus.fire(ApplicationExitEvent(data));
            break;
          case 101:
            eventBus.fire(ApplicationExitEvent(data));
            break;
          case 102:
            eventBus.fire(ApplicationExitEvent(data));
            break;
        }
      }
    }, onError: (e) {
      print(e.toString());
    });
  }

  void sendMsg(message) {
    WebSocketUtility().sendMessage(message);
  }

  set index(int val) {
    _index = val;
    notifyListeners();
  }

  void switchIndex(int val) {
    _index = val;
    notifyListeners();
  }
}