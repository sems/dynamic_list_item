import 'package:dynamic_list_item/src/dynamic_list_item_color_theme.dart';
import 'package:flutter/material.dart';

class DynamicListItemStyle {
  /// TextStyle which is used for the title on Android.
  ///
  /// If not specified the default value is: [DefaultTextStyle]
  final TextStyle? androidTextStyle;

  /// TextStyle which is used for the title on iOS.
  ///
  /// If not specifiek the default value is: `TextStyle(double fontSize = 17, FontWeight fontWeight = FontWeight.w400, Color color = Colors.black,fontFamily: "SF Pro Text", double letterSpacing = -0.24)`. Which is the default for iOS' own list-items;
  final TextStyle? iOSTextStyle;

  /// Will provide custom colors for the list item.
  ///
  /// If not specified, the default colors will be used.
  final DynamicListItemColorTheme colorTheme;

  /// An override which can be used to override styling for a specific platform.
  ///
  /// Currently two platforms are supported: `TargetPlatform.iOS` and `TargetPlatform.android`.
  /// For example when you want to use iOS styling on the Android platform, you can set this to `TargetPlatform.iOS`.
  final TargetPlatform? overridePlatformStyling;

  /// Default usage of dividers.
  ///
  /// Set this property to `false` if you want to hide divers.
  /// By default this property is set to `true`.
  final bool useDividers;

  const DynamicListItemStyle({
    this.androidTextStyle,
    this.iOSTextStyle,
    this.colorTheme = const DynamicListItemColorTheme(),
    this.overridePlatformStyling,
    this.useDividers = true,
  });
}
