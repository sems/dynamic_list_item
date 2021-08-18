import 'package:flutter/material.dart';

class Constants {
  double get defaultHorizontalPadding => 16.0;
  int get minScreenSize => 800;

  // iOS global constants
  Color get iosBackgroundColor => Color.fromRGBO(239, 239, 244, 1.0);
  Color get iosListTileDownColor => Color.fromRGBO(224, 222, 230, 0.5);
  Color get iosListTileArrowColor => Color.fromRGBO(211, 211, 211, 1.0);
  Color get iosSubTestColor => Color.fromRGBO(123, 123, 128, 1.0);

  // Android global constants
  Color get androidSecundaryTextColor => Color.fromRGBO(123, 123, 128, 1);
  TextStyle get androidPrimaryTextStyle => TextStyle(fontSize: 18);
  TextStyle get androidSecundaryTextStyle =>
      TextStyle(fontSize: 18, color: androidSecundaryTextColor);
}
