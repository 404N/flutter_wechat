import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wechat/utils/style/Box.dart';
import '../../res.dart';

class NoDataWidget extends StatelessWidget {
  String notice;

  NoDataWidget({this.notice = ""});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Box.h25,
            Box.h25,
            Image(
              image: AssetImage(Res.ic_no_data),
              width: 100.w,
              height: 100.w,
            ),
            Box.h15,
            Text("No data"),
            Box.h25,
            Box.h25,
          ],
        ),
      ],
    );
  }
}
