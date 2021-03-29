import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/utils/common/wechat_Icons.dart';
import 'package:flutter_wechat/view/finds/finds.dart';
import 'package:flutter_wechat/view/friends/friends.dart';
import 'package:flutter_wechat/view/person/personal.dart';
import 'package:flutter_wechat/view/wechat/wechat.dart';
import 'package:flutter_wechat/viewmodel/home_viewmodel.dart';
import 'package:flutter_wechat/viewmodel/service_locator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static final String sName = "Home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(WeChatIcons.weChat),
      activeIcon: Icon(
        WeChatIcons.weChat,
      ),
      label: '微信',
    ),
    BottomNavigationBarItem(
      icon: Icon(WeChatIcons.phoneFriend),
      activeIcon: Icon(
        WeChatIcons.phoneFriend,
      ),
      label: '通讯录',
    ),
    BottomNavigationBarItem(
      icon: Icon(WeChatIcons.find),
      activeIcon: Icon(
        WeChatIcons.find,
      ),
      label: '发现',
    ),
    BottomNavigationBarItem(
      icon: Icon(WeChatIcons.my),
      activeIcon: Icon(
        WeChatIcons.my,
      ),
      label: '我',
    )
  ];

  List<Widget> tabBodies;
  PageController _pageController = PageController();
  HomeIndexViewModel model = serviceLocator<HomeIndexViewModel>();

  @override
  void initState() {
    super.initState();
    tabBodies = [
      WeChat(),
      Friends(),
      Finds(),
      Personal(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeIndexViewModel>(
      create: (context) => model,
      child: Consumer<HomeIndexViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: model.index,
              items: bottomTabs,
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.black,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              onTap: (index) {
                _pageController.jumpToPage(index);
                model.switchIndex(index);
              },
            ),
          );
        },
        child: PageView.builder(
          //要点1
          physics: NeverScrollableScrollPhysics(),
          //禁止页面左右滑动切换
          controller: _pageController,
          //回调函数
          itemCount: 4,
          itemBuilder: (context, index) => tabBodies[index],
        ),
      ),
    );
  }
}
