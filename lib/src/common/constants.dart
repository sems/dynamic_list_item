import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Constants {
  double get defaultHorizontalPadding => 16.0;

  Color get iosBackgroundColorLight => Color.fromRGBO(255, 255, 255, 1.0);
  Color get iosListTileDownColorLight => Color.fromRGBO(245, 245, 247, 1.0);
  Color get iosListTileArrowColor => Color.fromRGBO(197, 197, 199, 1.0);

  Color get iosBackgroundColorDark => Color.fromRGBO(29, 28, 30, 1.0);
  Color get iosListTileDownColorDark => Color.fromRGBO(44, 44, 46, 1.0);

  Color get iosBackgroundColor =>
      SchedulerBinding.instance.window.platformBrightness == Brightness.dark
          ? iosBackgroundColorDark
          : iosBackgroundColorLight;

  Color get iosListTileDownColor =>
      SchedulerBinding.instance.window.platformBrightness == Brightness.dark
          ? iosListTileDownColorDark
          : iosListTileDownColorLight;
}
