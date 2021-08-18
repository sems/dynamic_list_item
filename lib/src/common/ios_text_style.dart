import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Textstyle class for [Text] on iOS.
///
/// This class has been made to force the SF Pro Text font within a [Material] widget.
/// Otherwise it could happen that Flutter creates the [Text] widget with the Roboto font.
/// This class can be build dynamically with optional named parameters. Said so, the
/// default values are as follows:
/// - fontSize = 17.0
/// - fontWeight = FontWeight.w400
/// - color = Colors.black
/// - letterSpacing = -0.24
///
/// Each of the above parameters can be changed if you want to. Note: please change the
/// letterSpacing at/as last, be ULTRA sure that the letterSpacing is different then the
/// default and you want to change it to something else.
// ignore: camel_case_types
class iOSTextStyle extends TextStyle {
  iOSTextStyle({
    double fontSize = 17.0,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
    double letterSpacing = -0.24,
  }) : super(
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontFamily: "SF Pro Text",
          letterSpacing: letterSpacing,
          color: color,
        );
}
