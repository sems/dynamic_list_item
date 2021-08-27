import 'package:flutter/material.dart';

class Constants {
  double get defaultHorizontalPadding => 16.0;

  // iOS global constants
  Color get iosBackgroundColor => Color.fromRGBO(239, 239, 244, 1.0);
  Color get iosListTileDownColor => Color.fromRGBO(224, 222, 230, 0.5);
  Color get iosListTileArrowColor => Color.fromRGBO(211, 211, 211, 1.0);

  // Android global constants
  TextStyle get androidPrimaryTextStyle => TextStyle(fontSize: 18);
}
