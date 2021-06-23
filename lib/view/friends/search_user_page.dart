import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_wechat/model/login_res_model_entity.dart';
import 'package:flutter_wechat/model/user_entity.dart';
import 'package:flutter_wechat/utils/dio/address.dart';
import 'package:flutter_wechat/utils/dio/dio_util.dart';
import 'package:flutter_wechat/utils/style/white_jotter_style.dart';
import 'package:flutter_wechat/widget/chat/single_firend_widget.dart';
import 'package:flutter_wechat/widget/util_widget/no_data_widget.dart';
import 'package:dio/dio.dart';

import 'friend_info_page.dart';

class SearchUserPage extends StatefulWidget {
  const SearchUserPage({Key key}) : super(key: key);

  @override
  _SearchUserPageState createState() => _SearchUserPageState();
}

class _SearchUserPageState extends State<SearchUserPage> {
  TextEditingController _controller = TextEditingController();
  List<UserEntity> res = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        //清除title左右padding，默认情况下会有一定的padding距离
        toolbarHeight: 44,
        //将高度定到44，设计稿的高度。为了方便适配，
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          child: Row(
            children: [
              Expanded(
                child: CupertinoSearchTextField(
                  backgroundColor: WJColors.line_color,
                  controller: _controller,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  queryUser();
                },
                child: Icon(Icons.search),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: EasyRefresh.custom(
          emptyWidget: res == null ? NoDataWidget() : null,
          slivers: <Widget>[
            // 当列表项高度固定时，使用 SliverFixedExtendList 比 SliverList 具有更高的性能
            SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) {
                                  return FriendInfoPage(
                                    userEntity: res[index],
                                  );
                                },
                              ),
                            );
                          },
                          child: SingleFriendWidget(
                            title: res[index].username,
                            image: Image.network(
                              Address.host + "images/" + res[index].avatar,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                childCount: res.length,
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
    );
  }

  void queryUser() {
    DioUtil.request<List<UserEntity>>(Address.queryUser(), RequestMethod.POST,
        data: FormData.fromMap(
          {"userName": _controller.text},
        ), onSuccess: (data) {
      setState(() {
        res=data;
      });
    }, onError: (code, msg) {
      print(msg);
    });
  }
}
