import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_wechat/model/group_msg_vo.dart';
import 'package:flutter_wechat/model/massage_vo.dart';
import 'package:flutter_wechat/utils/dio/address.dart';
import 'package:flutter_wechat/utils/event_bus.dart';
import 'package:flutter_wechat/utils/style/Box.dart';
import 'package:flutter_wechat/utils/style/white_jotter_style.dart';
import 'package:flutter_wechat/utils/websocket_util.dart';

class ChatPage extends StatefulWidget {
  final String ownerUid;
  final String otherUid; //群号或者对方id
  final String title;
  final int type; //0表示私聊，1表示群聊
  final int mid;

  const ChatPage(
      {Key key, this.otherUid, this.ownerUid, this.title, this.type, this.mid})
      : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController controller;
  ScrollController _scrollController;
  List<MessageVo> msgList = [];
  List<GroupMsgVo> groupMsgList = [];
  var _eventBusOn;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _eventBusOn = eventBus.on<ApplicationExitEvent>().listen((event) {
        if (mounted && event.data != null) {
          switch (event.data['type']) {
            case 2:
              //接收查询的消息接口
              if (widget.type == 0) {
                if (event.data['data'] is List) {
                  getMsg(event.data['data']);
                }
                _scrollController.jumpTo(0);
                setState(() {});
              }
              break;
            case 3:
              //发消息
              MessageVo messageVo = MessageVo.fromJson(event.data['data']);
              messageVo.type = 0;
              setState(() {
                msgList.insert(0, messageVo);
              });
              _scrollController.jumpTo(0);
              break;
            case 4:
              MessageVo messageVo = MessageVo.fromJson(event.data['data']);
              messageVo.type = 1;
              messageVo.otherUidAvatar = messageVo.ownerUidAvatar;
              messageVo.otherName = messageVo.ownerName;
              setState(() {
                msgList.insert(0, messageVo);
              });
              _scrollController.jumpTo(0);
              break;
            case 100:
              if (widget.type == 1) {
                if (event.data['data'] is List) {
                  getGroupMsg(event.data['data']);
                }
                _scrollController.jumpTo(0);
                setState(() {});
              }
              break;
            case 101:
              GroupMsgVo groupMsgVo = GroupMsgVo.fromJson(event.data['data']);
              setState(() {
                groupMsgList.insert(0, groupMsgVo);
              });
              _scrollController.jumpTo(0);
              break;
            case 102:
              GroupMsgVo groupMsgVo = GroupMsgVo.fromJson(event.data['data']);
              setState(() {
                groupMsgList.insert(0, groupMsgVo);
              });
              _scrollController.jumpTo(0);
              break;
            default:
              break;
          }
        }
      });
    });
    var queryMsgJson;
    if (widget.type == 0) {
      queryMsgJson = '{ "type": 2, "data": {"ownerUid":' +
          widget.ownerUid.toString() +
          ',"otherUid":' +
          widget.otherUid.toString() +
          ' }}';
    } else {
      queryMsgJson = '{ "type": 100, "data": {"groupId":' +
          widget.otherUid.toString() +
          ',"type":0,' +
          "page:" +
          "0" +
          ',}}';
    }
    WebSocketUtility().sendMessage(queryMsgJson);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return NotificationListener(
                    onNotification: (dynamic _) {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      return false;
                    },
                    child: GestureDetector(
                      child: EasyRefresh.custom(
                        scrollController: _scrollController,
                        reverse: true,
                        slivers: <Widget>[
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                if (widget.type == 0) {
                                  return _buildMsg(msgList[index]);
                                } else {
                                  return _buildGroupMsg(groupMsgList[index]);
                                }
                              },
                              childCount: widget.type == 0
                                  ? msgList.length
                                  : groupMsgList.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.black38, width: 0.2),
                  ), // 边色与边宽度
                ),
                padding:
                    EdgeInsets.only(left: 15.0, top: 5.0, bottom: 0, right: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: WJColors.color_F5F6F7,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxHeight: 80,
                                      ),
                                      child: TextField(
                                        controller: controller,
                                        maxLength: 60,
                                        cursorColor: WJColors.color_306BFF,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          counterText: '',
                                          contentPadding: EdgeInsets.all(10),
                                        ),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(60),
                                        ],
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        // maxLines: 30,
                                      ),
                                    ),
                                  ),
                                  Box.w5,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Box.w15,
                        GestureDetector(
                          onTap: () {
                            sendMsg();
                            controller.text = '';
                          },
                          child: Container(
                            width: 65,
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: WJColors.color_306BFF,
                            ),
                            child: Center(
                              child: Text(
                                '发送',
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 构建消息视图
  Widget _buildMsg(MessageVo entity) {
    if (entity == null) {
      return Container();
    }
    if (entity.type == 0) {
      return Container(
          margin: EdgeInsets.only(left: 15, top: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${entity.ownerName}",
                      ),
                      Box.h5,
                      Text(
                        entity.content ?? '',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 15.0,
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: Address.host + "images/" + entity.ownerUidAvatar,
                    errorWidget: (context, url, error) =>
                        CircularProgressIndicator(),
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ));
    }
    return Container(
        margin: EdgeInsets.only(left: 15, top: 15, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                right: 15.0,
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: Address.host + "images/" + entity.otherUidAvatar,
                  errorWidget: (context, url, error) =>
                      CircularProgressIndicator(),
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${entity.otherName}",
                    ),
                    Box.h5,
                    Text(
                      entity.content ?? '',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  // 构建消息视图
  Widget _buildGroupMsg(GroupMsgVo entity) {
    if (entity == null) {
      return Container();
    }
    if (entity.ownerUid == widget.ownerUid) {
      return Container(
          margin: EdgeInsets.only(left: 15, top: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${entity.ownerName}",
                      ),
                      Box.h5,
                      Text(
                        entity.content ?? '',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 15.0,
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: Address.host + "images/" + entity.avatar,
                    errorWidget: (context, url, error) =>
                        CircularProgressIndicator(),
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ));
    }
    return Container(
        margin: EdgeInsets.only(left: 15, top: 15, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                right: 15.0,
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: Address.host + "images/" + entity.avatar,
                  errorWidget: (context, url, error) =>
                      CircularProgressIndicator(),
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${entity.ownerName}",
                    ),
                    Box.h5,
                    Text(
                      entity.content ?? '',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  double _calculateMsgHeight(
      BuildContext context, BoxConstraints constraints, MessageVo entity) {
    return 2 +
        max(
          _calculateTextHeight(
            context,
            constraints,
            textStyle: TextStyle(
              fontSize: 12,
            ),
          ),
          40,
        ) +
        _calculateTextHeight(
          context,
          constraints.copyWith(
            maxWidth: 200.0,
          ),
          text: entity.content ?? '',
          textStyle: TextStyle(
            fontSize: 15,
          ),
        );
  }

  /// 计算Text的高度
  double _calculateTextHeight(
    BuildContext context,
    BoxConstraints constraints, {
    String text = '',
    TextStyle textStyle,
    List<InlineSpan> children = const [],
  }) {
    final span = TextSpan(text: text, style: textStyle, children: children);

    final richTextWidget = Text.rich(span).build(context) as RichText;
    final renderObject = richTextWidget.createRenderObject(context);
    renderObject.layout(constraints);
    return renderObject.computeMinIntrinsicHeight(constraints.maxWidth);
  }

  void getMsg(List data) {
    for (var msg in data) {
      msgList.insert(0, MessageVo.fromJson(msg));
    }
    setState(() {});
  }

  void sendMsg() {
    var sendMsgJson;
    if (widget.type == 0) {
      sendMsgJson = '{ "type": 3, "data": {"senderUid":' +
          widget.ownerUid.toString() +
          ',"recipientUid":' +
          widget.otherUid.toString() +
          ', "content":"' +
          controller.text +
          '","msgType":1  }}';
    } else {
      sendMsgJson = '{ "type": 101, "data": {"senderUid":' +
          widget.ownerUid.toString() +
          ',"groupId":' +
          widget.otherUid.toString() +
          ', "content":"' +
          controller.text +
          '","msgType":1  }}';
    }
    WebSocketUtility().sendMessage(sendMsgJson);
  }

  void getGroupMsg(List data) {
    for (var msg in data) {
      groupMsgList.insert(0, GroupMsgVo.fromJson(msg));
    }
    setState(() {});
  }
}
