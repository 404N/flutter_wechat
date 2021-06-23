import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_wechat/generated/json/base/json_convert_content.dart';
import 'package:flutter_wechat/model/login_res_model_entity.dart';
import 'package:flutter_wechat/res.dart';
import 'package:flutter_wechat/utils/dio/address.dart';
import 'package:flutter_wechat/utils/event_bus.dart';
import 'package:flutter_wechat/utils/style/white_jotter_style.dart';
import 'package:flutter_wechat/view/friends/search_user_page.dart';
import 'package:flutter_wechat/widget/chat/single_firend_widget.dart';
import 'package:flutter_wechat/widget/util_widget/no_data_widget.dart';

import 'new_friend_page.dart';

class Friends extends StatefulWidget {
  final List<LoginResModelOtherUsers> userList;
  final List<AddFriendRequest> newFriends;

  const Friends({Key key, this.userList, this.newFriends}) : super(key: key);

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  var _eventBusOn;
  List<AddFriendRequest> newRequest;

  @override
  void initState() {
    super.initState();
    newRequest = widget.newFriends;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _eventBusOn = eventBus.on<ApplicationExitEvent>().listen((event) {
        if (mounted && event.data != null) {
          switch (event.data['type']) {
            case 10:
              //接收到好友请求
              newRequest.add(JsonConvert.fromJsonAsT<AddFriendRequest>(
                event.data['data'],
              ));
              break;
            default:
              break;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "通讯录",
          style: WjStyle.appBarStyle,
        ),
        backgroundColor: WJColors.color_F5F6F7,
        centerTitle: true,
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: PopupMenuButton<String>(
              offset: Offset(0, 11),
              child: Center(
                child: Icon(Icons.add_circle_outline),
              ),
              color: Colors.black26,
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 0.toString(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.messenger),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "查找群聊",
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 1.toString(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.person_add),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "添加朋友",
                        ),
                      ],
                    ),
                  ),
                ];
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onSelected: (String action) {
                // 点击选项的时候
                if (action == "0") {
                  print("查找群聊");
                } else {
                  print('查找朋友');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return SearchUserPage();
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      backgroundColor: WJColors.white,
      body: Column(
        children: [
          Container(
            height: 60,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 40,
                  child: Center(
                    child: Image.asset(Res.newfriend),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) {
                                  return NewFriendPage(
                                    friends: newRequest,
                                  );
                                },
                              ),
                            );
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Text("新的朋友"),
                                SizedBox(
                                  width: 10,
                                ),
                                Visibility(
                                  visible: newRequest.length > 1,
                                  child: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        newRequest.length.toString(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        height: 1,
                        color: WJColors.line_color,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SingleFriendWidget(
            title: "群聊",
            image: Image.asset(Res.group),
          ),
          Divider(
            thickness: 3,
            height: 3,
            color: WJColors.line_color,
          ),
          Expanded(
            child: Container(
              child: EasyRefresh.custom(
                emptyWidget: widget.userList == null ? NoDataWidget() : null,
                slivers: <Widget>[
                  // 当列表项高度固定时，使用 SliverFixedExtendList 比 SliverList 具有更高的性能
                  SliverFixedExtentList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Column(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: SingleFriendWidget(
                                  title: widget.userList[index].username,
                                  image: Image.network(
                                    Address.host +
                                        "images/" +
                                        widget.userList[index].avatar,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      childCount: widget.userList.length,
                    ),
                    itemExtent: 60,
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 60,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
