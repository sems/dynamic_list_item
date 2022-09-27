import 'package:flutter/painting.dart';

class DynamicListItemStyle {
  /// TextStyle which is used for the title on Android.
  /// 
  /// If not specified the default value is: `TextStyle(fontSize: 18)`
  final TextStyle? androidTextStyle;

  /// TextStyle which is used for the title on iOS.
  /// 
  /// If not specifiek the default value is: `TextStyle(double fontSize = 17, FontWeight fontWeight = FontWeight.w400, Color color = Colors.black,fontFamily: "SF Pro Text", double letterSpacing = -0.24)`. Which is the default for iOS' own list-items;
  final TextStyle? iOSTextStyle;

  /// The background color of the list item
  /// 
  /// If the background color is not set, it will default to the `Colors.white`
  final Color? tileBackgroundColor;

  /// The background of the list item when it is pressed down. (Only for iOS)
  /// 
  /// If not set, it will default to iOS's default color for iOS,.
  /// Android will always use the Theme defaults.
  final Color? tileBackgroundColorOnDown;
  
  const DynamicListItemStyle({
    this.androidTextStyle,
    this.iOSTextStyle,
    this.tileBackgroundColor,
    this.tileBackgroundColorOnDown,
  });
}