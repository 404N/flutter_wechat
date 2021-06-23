import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_wechat/generated/json/base/json_convert_content.dart';
import 'package:flutter_wechat/model/group_msg_vo.dart';
import 'package:flutter_wechat/model/login_res_model_entity.dart';
import 'package:flutter_wechat/model/massage_vo.dart';
import 'package:flutter_wechat/utils/common/storage_key.dart';
import 'package:flutter_wechat/utils/event_bus.dart';
import 'package:flutter_wechat/utils/websocket_util.dart';
import 'package:sp_util/sp_util.dart';

class WechatViewModel extends ChangeNotifier {
  LoginResModelContactVO contactVO;
  WebSocketUtility webSocketUtility;
  EasyRefreshController controller = EasyRefreshController();
  var _eventBusOn;

  void init() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _eventBusOn = eventBus.on<ApplicationExitEvent>().listen((event) {
        if (event.data != null) {
          switch (event.data['type']) {
            case 1:
              if (event.data['status'] != "" &&
                  event.data['status'] == 'success') {
                print('上线成功');
                contactVO = JsonConvert.fromJsonAsT<LoginResModelEntity>(
                  event.data['data'],
                ).contactVO;
                notifyListeners();
                SpUtil.putObject(StorageKey.HOME_DATA, event.data['data']);
              } else {
                print('上线失败');
              }
              break;
            case 2:
              //接收查询消息接口
              break;
            case 3:
              //接收消息
              MessageVo messageVo = MessageVo.fromJson(event.data['data']);
              for (LoginResModelContactVOContactInfoList item
                  in contactVO.contactInfoList) {
                if (item.otherUid == messageVo.otherUid) {
                  item.content = messageVo.content;
                  notifyListeners();
                }
              }
              break;
            case 4:
              //处理接收到消息,主要是最近联系人界面和聊天界面的展示
              if (event.data['tid'] != null) {
                var ackJson = '{ "type": 6, "data": {"tid":' +
                    event.data['tid'].toString() +
                    ' }}';
                sendMsg(ackJson);
                for (LoginResModelContactVOContactInfoList item
                    in contactVO.contactInfoList) {
                  if (item.otherUid == event.data['data']['ownerUid']) {
                    item.convUnread++;
                    item.content = event.data['data']['content'];
                    notifyListeners();
                  }
                }
              }
              break;
            case 5:
              //轮询总未读
              break;
            case 10:
              //接收到好友请求
              break;
            case 100:
              //接收群聊消息查询数据
              break;
            case 101:
              //更新消息列表
              GroupMsgVo groupMsgVo = GroupMsgVo.fromJson(event.data['data']);
              for (LoginResModelContactVOContactInfoList item
                  in contactVO.contactInfoList) {
                if (item.otherUid == groupMsgVo.groupId) {
                  item.content = groupMsgVo.content;
                  notifyListeners();
                }
              }
              break;
            case 102:
              GroupMsgVo groupMsgVo = GroupMsgVo.fromJson(event.data['data']);
              //处理接收到消息,主要是最近联系人界面和聊天界面的展示
              if (event.data['tid'] != null) {
                var ackJson = '{ "type": 6, "data": {"tid":' +
                    event.data['tid'].toString() +
                    ' }}';
                sendMsg(ackJson);
                for (LoginResModelContactVOContactInfoList item
                    in contactVO.contactInfoList) {
                  if (item.otherUid == groupMsgVo.groupId) {
                    item.convUnread++;
                    item.content = groupMsgVo.content;
                    notifyListeners();
                  }
                }
              }
              break;
          }
        }
      });
    });
  }

  void sendMsg(message) {
    WebSocketUtility().sendMessage(message);
  }
}
