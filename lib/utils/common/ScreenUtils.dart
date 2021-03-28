import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizeExtension on num {
  num get Sp => ScreenUtil().setSp(this.toDouble());

  num get W => ScreenUtil().setWidth(this.toDouble());

  num get H => ScreenUtil().setHeight(this.toDouble());
}
