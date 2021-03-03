import 'package:flutter/material.dart';


class WJColors{
  static const int primaryIntValue = 0xFFF5F6F7;

  static const MaterialColor primarySwatch = const MaterialColor(
    primaryIntValue,
    const <int, Color>{
      50: const Color(primaryIntValue),
      100: const Color(primaryIntValue),
      200: const Color(primaryIntValue),
      300: const Color(primaryIntValue),
      400: const Color(primaryIntValue),
      500: const Color(primaryIntValue),
      600: const Color(primaryIntValue),
      700: const Color(primaryIntValue),
      800: const Color(primaryIntValue),
      900: const Color(primaryIntValue),
    },
  );
  static const int primarySelectDate = 0xFF316AFF;
  static const MaterialColor primarySelectDateSwatch = const MaterialColor(
    primarySelectDate,
    const <int, Color>{
      50: const Color(primarySelectDate),
      100: const Color(primarySelectDate),
      200: const Color(primarySelectDate),
      300: const Color(primarySelectDate),
      400: const Color(primarySelectDate),
      500: const Color(primarySelectDate),
      600: const Color(primarySelectDate),
      700: const Color(primarySelectDate),
      800: const Color(primarySelectDate),
      900: const Color(primarySelectDate),
    },
  );
  static const Color primaryValue = Color(0xFF267aff);
  static const Color unselectedItemColor = Color(0xFFB3B3B3);
  static const Color primaryLightValue = Color(0xFF42464b);
  static const Color primaryDarkValue = Color(0xFF121917);

  static const Color mainbg = Color(0xFFF5F6F7);
  static const Color playSelectedColor = Color(0xFFF5F6F7);
  static const Color playUnSelectedColor = Color(0xFFFFFFFF);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color sedWhiteTextColor = Color(0x7dFFFFFF);
  static const Color miWhite = Color(0xffececec);
  static const Color white = Color(0xFFFFFFFF);
  static const Color actionBlue = Color(0xff267aff);
  static const Color subTextColor = Color(0xff666666);
  static const Color sedTextColor = Color(0xffB3B3B3);
  static const Color editBgColor = Color(0xffF5F6F7);
  static const Color textCountDownColor = Color(0xffFFE433);
  static const Color greenColor = Color(0xff34C759);
  static const Color subLineColor = Color(0xffc4c4c4);
  static const Color skipbg = Color(0xA642464b);
  static const Color subLightTextColor = Color(0xffc4c4c4);
  static const Color maintext = Color(0xff333333);
  static const Color line_color = Color(0xffF0F0F0);
  static const Color color_dcd = Color(0xffdcdcdc);
  static const Color facebook_blue = Color(0xff3351a3);
  static const Color red = Color(0xffFD2B20);
  static const Color results_unselectedLabelColor = Color(0x7dFFFFFF);
  static const Color results_LabelColor = Color(0xFFFFFFFF);
  static const Color mainBackgroundColor = miWhite;

  static const Color mainTextColor = primaryDarkValue;
  static const Color textColorWhite = white;

  static const Color color_F5F6F7 = Color(0xFFF5F6F7);
  static const Color color_B3B3B3 = Color(0xFFB3B3B3);
  static const Color color_306BFF = Color(0xFF306BFF);
  static const Color color_F0F0F0 = Color(0xFFF0F0F0);
  static const Color color_34C759 = Color(0xFF34C759);
  static const Color color_CCCCCC = Color(0xFFCCCCCC);
  static const Color color_F2F2F2 = Color(0xFFF2F2F2);
  static const Color color_121917 = Color(0xFF121917);
  static const Color color_E6EDFF = Color(0xFFE6EDFF);
  static const Color color_FF5252 = Color(0xFFFF5252);
  static const Color color_F8F8F8 = Color(0xFFF8F8F8);
  static const Color color_7C7C7C = Color(0xFF7C7C7C);
  static const Color color_FF002E = Color(0xFFFF002E);
  static const Color color_6F6F6F = Color(0xFF6F6F6F);
  static const Color color_1D1D1D = Color(0xFF1D1D1D);
  static const Color color_C4C4C4 = Color(0xFFC4C4C4);
  static const Color color_FFFFFF = Color(0xFFFFFFFF);
  static const Color color_D8D8D8 = Color(0xFFD8D8D8);
  static const Color color_A2A2A2 = Color(0xFFA2A2A2);
  static const Color color_333333 = Color(0xFF333333);
  static const Color color_242625 = Color(0xFF242625);


  static const Color color_002E67 = Color(0xFF002E67);
  static const Color color_F8B400 = Color(0xFFF8B400);
  static const Color color_008DFF = Color(0xFF008DFF);
  static const Color color_FFC552 = Color(0xFFFFC552);
  static const Color color_FF4E00 = Color(0xFFFF4E00);
  static const Color color_0060D3 = Color(0xFF0060D3);
  static const Color color_00B8FF = Color(0xFF00B8FF);
  static const Color color_002E4D = Color(0xFF002E4D);
  static const Color color_FFAD00 = Color(0xFFFFAD00);
}

class WjStyle {
  static const lagerTextSize = 30.0;
  static const bigTextSize = 23.0;
  static const normalTextSize = 18.0;
  static const middleTextSize = 16.0;
  static const smallTextSize = 14.0;
  static const minTextSize = 11.0;
  static const bigText25 = 25.0;
  static const size12 = 12.0;
  static const size20 = 20.0;
  static const size9 = 9.0;
  static const size10 = 10.0;
  static const size21 = 21.0;
  static const size13 = 13.0;
  static const size14 = 14.0;
  static const size15 = 15.0;
  static const size16 = 16.0;
  static const size18 = 18.0;
  static const size24 = 24.0;
  static const size29 = 29.0;
  static const size8 = 8.0;


  static const appBarStyle = TextStyle(
    color: WJColors.mainTextColor,
    fontSize: size18,
    fontWeight: FontWeight.bold,
  );

  static const bookTitleStyle=TextStyle(
    color: WJColors.primaryDarkValue,
    fontSize: size12,
    fontWeight: FontWeight.bold,
  );

  static const bookAuthorStyle=TextStyle(
    color: WJColors.color_6F6F6F,
    fontSize: size8,
  );

  static const colorsTransformTextStyle=TextStyle(
    color: WJColors.white,
    fontSize: size16,
    fontWeight: FontWeight.bold,
  );

  static const colorsTransformTopTextStyle=TextStyle(
    color: WJColors.primaryDarkValue,
    fontSize: size16,
    fontWeight: FontWeight.bold,
  );
}