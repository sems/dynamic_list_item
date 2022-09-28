import 'package:flutter/material.dart';

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
  final Color tileBackgroundColor;

  /// The background of the list item when it is pressed down. (Only for iOS)
  /// 
  /// If not set, it will default to iOS's default color for iOS,.
  /// Android will always use the Theme defaults.
  final Color? tileBackgroundColorOnDown;

  /// To specifiy whether to always use the default Flutter/ThemeData for textStyles;
  /// 
  /// If this is set to `true`, the `androidTextStyle` and `iOSTextStyle` properties from [DynamicListItemStyle] will be ignored.
  /// This includes their default/fallback values.
  /// Also the `tileBackgroundColor` for Android will be ignored.
  final bool alwaysUseFlutterTextStyle;

  /// An override which can be used to override styling for a specific platform.
  /// 
  /// Currently two platforms are supported: `TargetPlatform.iOS` and `TargetPlatform.android`.
  /// For example when you want to use iOS styling on the Android platform, you can set this to `TargetPlatform.iOS`.
  final TargetPlatform? overridePlatformStyling;
  
  const DynamicListItemStyle({
    this.androidTextStyle,
    this.iOSTextStyle,
    this.tileBackgroundColor = Colors.white,
    this.tileBackgroundColorOnDown,
    this.alwaysUseFlutterTextStyle = false,
    this.overridePlatformStyling,
  });
}