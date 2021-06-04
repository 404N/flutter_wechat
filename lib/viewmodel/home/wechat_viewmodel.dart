import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_wechat/model/login_res_model_entity.dart';
import 'package:flutter_wechat/model/massage_vo.dart';
import 'package:flutter_wechat/utils/event_bus.dart';
import 'package:flutter_wechat/utils/websocket_util.dart';

class WechatViewModel extends ChangeNotifier {
  LoginResModelContactVO contactVO;
  WebSocketUtility webSocketUtility;
  EasyRefreshController controller = EasyRefreshController();

  void init() {
    WebSocketUtility().initWebSocket(onOpen: () {
      WebSocketUtility().initHeartBeat(contactVO.ownerUid);
      var bindJson = '{ "type": 1, "data": {"uid":' +
          contactVO.ownerUid.toString() +
          ' }}';
      sendMsg(bindJson);
    }, onMessage: (message) {
      Map<String, dynamic> data = json.decode(message);
      print(data.toString());
      if (data != null) {
        switch (data['type']) {
          case 1:
            if (data['status'] != "" && data['status'] == 'success') {
              print('上线成功');
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
            MessageVo messageVo = MessageVo.fromJson(data['data']);
            for(LoginResModelContactVOContactInfoList item in contactVO.contactInfoList){
              if(item.otherUid==data['data']['otherUid']){
                item.content=data['data']['content'];
                notifyListeners();
              }
            }
            eventBus.fire(ApplicationExitEvent(data));
            break;
          case 4:
            //处理接收到消息,主要是最近联系人界面和聊天界面的展示
            if (data['tid'] != null) {
              var ackJson =
                  '{ "type": 6, "data": {"tid":' + data['tid'].toString() + ' }}';
              sendMsg(ackJson);
              eventBus.fire(ApplicationExitEvent(data));
              for(LoginResModelContactVOContactInfoList item in contactVO.contactInfoList){
                if(item.otherUid==data['data']['ownerUid']){
                  item.convUnread++;
                  item.content=data['data']['content'];
                  notifyListeners();
                }
              }
            }
            break;
          case 5:
            //轮询总未读
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
}
