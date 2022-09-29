import 'package:flutter/material.dart';

class DynamicListItemColorTheme {
  /// The background color of the list item for iOS
  ///
  /// If the background color is not set, it will default to iOS' default.
  final Color? tileBackgroundColoriOS;

  /// The background of the list item when it is pressed down. (iOS only)
  ///
  /// If not set, it will default to iOS's default color.
  /// Android will materialize the [tileBackgroundColorAndroid].
  final Color? tileBackgroundColorOnDowniOS;

  /// The background color of the list item for Android
  ///
  /// If the background color is not set, it will default to the `Theme.canvasColor`.
  final Color? tileBackgroundColorAndroid;

  /// Colors used for styling the list item.
  ///
  /// If using dark-mode and `DynamicListItemColorTheme`, it is adviced to use Colors from ThemeData.
  /// Since those will automatically be change when the Theme.brightness changes.
  const DynamicListItemColorTheme({
    this.tileBackgroundColoriOS,
    this.tileBackgroundColorOnDowniOS,
    this.tileBackgroundColorAndroid,
  });
}
