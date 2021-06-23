import 'package:flutter/material.dart';
import 'package:flutter_wechat/generated/json/base/json_convert_content.dart';
import 'package:flutter_wechat/model/user_entity.dart';
import 'package:flutter_wechat/utils/common/storage_key.dart';
import 'package:flutter_wechat/utils/dio/address.dart';
import 'package:flutter_wechat/utils/dio/dio_util.dart';
import 'package:flutter_wechat/utils/style/white_jotter_style.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sp_util/sp_util.dart';

class FriendInfoPage extends StatelessWidget {
  final UserEntity userEntity;

  const FriendInfoPage({Key key, this.userEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Icon(Icons.more_horiz),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Image.network(
                    Address.host + "images/" + userEntity.avatar,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userEntity.username,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(userEntity.email),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 10,
              color: Colors.black12,
            ),
            GestureDetector(
              onTap: () {
                addFriend(context);
              },
              child: Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.messenger),
                    SizedBox(
                      width: 10,
                    ),
                    Text("添加好友"),
                  ],
                ),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: WJColors.line_color,
            ),
          ],
        ),
      ),
    );
  }

  void addFriend(BuildContext context) {
    UserEntity user = JsonConvert.fromJsonAsT<UserEntity>(
      SpUtil.getObject(StorageKey.USER_INFO),
    );
    DioUtil.request<dynamic>(Address.addFriend(), RequestMethod.POST,
        data: FormData.fromMap(
          {"ownerUid": user.uid, "otherUid": userEntity.uid},
        ), onSuccess: (data) {
      Fluttertoast.showToast(msg: "发送成功");
      Navigator.pop(context);
    }, onError: (code, msg) {
      Fluttertoast.showToast(msg: msg);
      print(msg);
    });
  }
}
