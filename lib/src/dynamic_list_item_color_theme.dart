import 'package:flutter/material.dart';

class DynamicListItemColorTheme {
  /// The background color of the list item for iOS
  ///
  /// If the background color is not set, it will default to the `Color.fromRGBO(239, 239, 244, 1.0)`.
  final Color? tileBackgroundColoriOS;

  /// The background of the list item when it is pressed down. (Only for iOS)
  ///
  /// If not set, it will default to iOS's default color for iOS.
  /// Which is: `Color.fromRGBO(224, 222, 230, 0.5)`.
  /// Android will always use the Theme defaults.
  final Color? tileBackgroundColorOnDowniOS;

  /// The background color of the list item for Android
  ///
  /// If the background color is not set, it will default to the `Colors.white`
  final Color? tileBackgroundColorAndroid;

  const DynamicListItemColorTheme({
    this.tileBackgroundColoriOS,
    this.tileBackgroundColorOnDowniOS,
    this.tileBackgroundColorAndroid,
  });
}