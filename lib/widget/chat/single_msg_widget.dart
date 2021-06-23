import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/model/login_res_model_entity.dart';
import 'package:flutter_wechat/utils/dio/address.dart';
import 'package:flutter_wechat/utils/style/Box.dart';
import 'package:flutter_wechat/utils/style/white_jotter_style.dart';

class SingleMsgWidget extends StatelessWidget {
  final LoginResModelContactVOContactInfoList info;

  const SingleMsgWidget({Key key, this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: WJColors.white,
      height: 70,
      child: Row(
        children: [
          Container(
            child: CachedNetworkImage(
              height: 70,
              width: 70,
              imageUrl: Address.host + "images/" + info.otherAvatar,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(info.otherName),
                    Text(
                      info.createTime.substring(0, 10),
                    ),
                  ],
                ),
                Box.h10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(info.content),
                    Visibility(
                      visible: info.convUnread > 0,
                      child: Container(
                        height: 15,
                        constraints: BoxConstraints(
                          minWidth: 15
                        ),
                        decoration: BoxDecoration(
                          color: WJColors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(info.convUnread.toString()),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
