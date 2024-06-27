import 'package:flutter/material.dart';
import 'package:kyc_mobile_app/utils/size_config.dart';

class Styles {
  static Color primaryColor = const Color(0xFFEC642C);
  static Color secondary = const Color(0xFF21406E);
  static Color accentColor = const Color(0xFF030C10);
  static Color primaryWithOpacityColor = const Color(0xFFF4AC8B);
  static Color redColor = const Color(0xFFDA1E28);
  static Color greenColor = const Color(0xFF34C759);
  static Color greyColor = const Color(0xFFF1F4FF);
  static Color whiteColor = Colors.white;
  static Color buttonColor = const Color(0xFFEC642C);
  static Color blueColor = const Color(0xFF4BACF7);
  static Color black2 = const Color(0xFF001533);
  static Color greyColor2 = const Color(0xFF666666);
  static Color brownColor = const Color(0xFFE0BDB1);
  static Color orange2Color = const Color(0xFFF9EDDE);
  static Color orange3Color = const Color(0xFFF48B5F);

  static TextStyle textStyle =
      TextStyle(fontSize: getProportionateScreenWidth(15));
  static TextStyle titleStyle = TextStyle(
      fontFamily: 'DMSans',
      fontSize: getProportionateScreenWidth(19),
      fontWeight: FontWeight.w500);
}
