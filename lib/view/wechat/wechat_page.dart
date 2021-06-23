import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_wechat/model/login_res_model_entity.dart';
import 'package:flutter_wechat/utils/style/white_jotter_style.dart';
import 'package:flutter_wechat/view/wechat/chat_page.dart';
import 'package:flutter_wechat/viewmodel/home/wechat_viewmodel.dart';
import 'package:flutter_wechat/viewmodel/service_locator.dart';
import 'package:flutter_wechat/widget/chat/single_msg_widget.dart';
import 'package:flutter_wechat/widget/util_widget/no_data_widget.dart';
import 'package:provider/provider.dart';

class WeChat extends StatefulWidget {
  final LoginResModelContactVO contactVO;

  const WeChat({Key key, this.contactVO}) : super(key: key);

  @override
  _WeChatState createState() => _WeChatState();
}

class _WeChatState extends State<WeChat> with AutomaticKeepAliveClientMixin {
  WechatViewModel model = serviceLocator<WechatViewModel>();

  @override
  void initState() {
    super.initState();
    if (widget.contactVO != null) {
      model.contactVO = widget.contactVO;
    }
    model.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WechatViewModel>.value(
      value: model,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "微信",
            style: WjStyle.appBarStyle,
          ),
          backgroundColor: WJColors.color_F5F6F7,
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: WJColors.color_F5F6F7,
        body: Consumer<WechatViewModel>(
          builder: (context, model, child) {
            if (model.contactVO == null) {
              return Container();
            }
            return EasyRefresh.custom(
              emptyWidget: model.contactVO.contactInfoList == null ||
                      model.contactVO.contactInfoList.length == 0
                  ? NoDataWidget()
                  : null,
              controller: model.controller,
              slivers: <Widget>[
                // 当列表项高度固定时，使用 SliverFixedExtendList 比 SliverList 具有更高的性能
                SliverFixedExtentList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Column(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                model.contactVO.contactInfoList[index]
                                    .convUnread = 0;
                                setState(() {});
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return ChatPage(
                                        ownerUid: model.contactVO.ownerUid,
                                        otherUid: model.contactVO
                                            .contactInfoList[index].otherUid,
                                        title: model.contactVO
                                            .contactInfoList[index].otherName,
                                        type: model
                                                    .contactVO
                                                    .contactInfoList[index]
                                                    .type >
                                                1
                                            ? 1
                                            : 0,
                                        mid: model.contactVO
                                            .contactInfoList[index].mid,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: SingleMsgWidget(
                                info: model.contactVO.contactInfoList[index],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: index !=
                                model.contactVO.contactInfoList.length - 1,
                            child: Divider(
                              height: 0.5,
                              thickness: 0.5,
                              color: WJColors.line_color,
                            ),
                          ),
                        ],
                      );
                    },
                    childCount: model.contactVO?.contactInfoList?.length??0,
                  ),
                  itemExtent: 80,
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 70,
                  ),
                ),
              ],
              onRefresh: () async {},
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
