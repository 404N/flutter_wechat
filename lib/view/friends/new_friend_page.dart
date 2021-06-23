import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_wechat/model/login_res_model_entity.dart';
import 'package:flutter_wechat/utils/dio/address.dart';
import 'package:flutter_wechat/utils/style/white_jotter_style.dart';
import 'package:flutter_wechat/widget/util_widget/no_data_widget.dart';

class NewFriendPage extends StatefulWidget {
  final List<AddFriendRequest> friends;
  const NewFriendPage({Key key, this.friends}) : super(key: key);

  @override
  _NewFriendPageState createState() => _NewFriendPageState();
}

class _NewFriendPageState extends State<NewFriendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新的朋友"),
        elevation: 0,
        backgroundColor: WJColors.color_F5F6F7,
      ),
      body: Container(
        child: EasyRefresh.custom(
          emptyWidget: widget.friends == null ? NoDataWidget() : null,
          slivers: <Widget>[
            // 当列表项高度固定时，使用 SliverFixedExtendList 比 SliverList 具有更高的性能
            SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Column(
                    children: [
                      Expanded(
                        child: singleFriendWidget(
                          widget.friends[index],
                        ),
                      ),
                    ],
                  );
                },
                childCount: widget.friends.length,
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

  Widget singleFriendWidget(AddFriendRequest addFriendRequest) {
    return Container(
      height: 60,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Container(
            width: 40,
            child: Center(
              child: Image.network(
                Address.host + "images/" + addFriendRequest.ownerAvatar,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(addFriendRequest.ownerName),
                ),
              ),
              Divider(
                thickness: 1,
                height: 1,
                color: WJColors.line_color,
              ),
            ],
          ),
          Spacer(),
          Container(
            width: 120,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Center(
              child: Icon(Icons.assignment_turned_in_sharp),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 120,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Center(
              child: Icon(Icons.clear),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
