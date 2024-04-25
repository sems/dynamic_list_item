import 'package:flutter/material.dart';

class Constants {
  double get defaultHorizontalPadding => 16.0;

  Color get iosBackgroundColorLight => Color.fromRGBO(255, 255, 255, 1.0);
  Color get iosListTileDownColorLight => Color.fromRGBO(229, 229, 234, 1.0);
  Color get iosDividerColorLight => Color.fromRGBO(237, 237, 235, 1.0);
  Color get iosListTileArrowColor => Color.fromRGBO(197, 197, 199, 1.0);

  Color get iosBackgroundColorDark => Color.fromRGBO(28, 28, 30, 1.0);
  Color get iosDividerColorDark => Color.fromRGBO(58, 58, 60, 1.0);
  Color get iosListTileDownColorDark => Color.fromRGBO(58, 58, 60, 1.0);

  Color get iosBackgroundColor =>
    WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark
      ? iosBackgroundColorDark
      : iosBackgroundColorLight;

  Color get iosListTileDownColor =>
    WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark
      ? iosListTileDownColorDark
      : iosListTileDownColorLight;

  Color get iosListTileDividerColor =>
    WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark
      ? iosListTileDownColorDark
      : iosListTileDownColorLight;
}
