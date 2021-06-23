import 'package:flutter/material.dart';
import 'package:flutter_wechat/utils/style/white_jotter_style.dart';

class SingleFriendWidget extends StatelessWidget {
  final String title;
  final Image image;

  const SingleFriendWidget({Key key, this.title, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Container(
            width: 40,
            child: Center(child: image),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(title),
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
    );
  }
}
