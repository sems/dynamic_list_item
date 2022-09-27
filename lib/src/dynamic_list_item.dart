import 'dart:io';
import 'dart:ui' as ui;

import 'package:dynamic_list_item/src/dynamic_list_item_style.dart';
import 'package:flutter/material.dart';

import './common/constants.dart';
import './common/list_item_position.dart';
import './common/ios_text_style.dart';

typedef DynamicListItemCallback = void Function();

class DynamicListItem extends StatefulWidget {
  /// The title of the list item
  /// 
  /// The title is required and will be displayed on the left side of the list item.
  final String title;

  /// The trailing widget of the list item
  /// 
  /// This can be any widget, but it is recommended to use an Icon.
  final Widget? trailing;

  /// The position of the list item in the list.
  /// 
  /// This position is used to determine the border-radius of the list item on iOS.
  /// For Android is determines if a divider should be shown above or below the list item.
  final ListItemPostition? position;

  /// The callback method for the list item.
  /// 
  /// This method will be called in the `onTap` method of the list item.
  final DynamicListItemCallback? callback;

  /// Used for testing purposes of the package itself.
  final bool? testing;

  /// All the constants used in this package. Mostly related to styling.
  final Constants _constants = new Constants();

  /// Custom styling for the list items.
  /// 
  /// This can be used to change the styling of the list items. 
  /// This includes properties like background color, text color, text size, etc.
  final DynamicListItemStyle? style;

  /// To specifiy whether to always use the default Flutter/ThemeData for textStyles;
  /// 
  /// If this is set to `true`, the `androidTextStyle` and `iOSTextStyle` properties from [DynamicListItemStyle] will be ignored.
  /// This includes their default/fallback values.
  final bool alwaysUseFlutterTextStyle;

  DynamicListItem({
    required this.title, 
    this.trailing, 
    this.position, 
    this.callback, 
    this.style, 
    this.alwaysUseFlutterTextStyle = false,
    this.testing
  });

  @override
  State<StatefulWidget> createState() => _DynamicListItemState();
}

class _DynamicListItemState extends State<DynamicListItem> {
  late Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.style?.tileBackgroundColor ?? Colors.white;
  }

  Widget buildOptionalDivider() {
    if (widget.position == ListItemPostition.Top || widget.position == ListItemPostition.Middle) {
      return Divider(
        height: 1, 
        indent: widget._constants.defaultHorizontalPadding,
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      BorderRadius _borderRadius = BorderRadius.zero;
      double _constantPadding = widget._constants.defaultHorizontalPadding;

      // Will give the element the right border radius according to its position
      switch (widget.position) {
        case ListItemPostition.Top:
          _borderRadius = BorderRadius.only(
            topLeft: Radius.circular(_constantPadding),
            topRight: Radius.circular(_constantPadding),
          );
          break;
        case ListItemPostition.Bottom:
          _borderRadius = BorderRadius.only(
            bottomLeft: Radius.circular(_constantPadding),
            bottomRight: Radius.circular(_constantPadding),
          );
          break;
        case ListItemPostition.StandAlone:
          _borderRadius = BorderRadius.all(Radius.circular(_constantPadding));
          break;
        default:
          //When it is middle or nothing.
      }
      
      return Listener(
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: _backgroundColor,
              borderRadius: _borderRadius
            ),
            margin: EdgeInsets.symmetric(horizontal: widget._constants.defaultHorizontalPadding),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(widget._constants.defaultHorizontalPadding, 13.5, 20, 13.5),
                      child: Text(
                        widget.title,
                        style: widget.alwaysUseFlutterTextStyle 
                          ? widget.style?.iOSTextStyle ?? IOSTextStyle() 
                          : null,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(right: 15),
                        child: widget.trailing,
                      ),
                    ),      
                  ],
                ),
                buildOptionalDivider()
              ],
            ),
          ),
          onTap: widget.callback,
          onTapCancel: () {
            setState(() => _backgroundColor = widget.style?.tileBackgroundColor ?? Colors.white);
          },
        ),
        onPointerDown: (_) {
          if (widget.callback != null) {
            setState(() => _backgroundColor = widget.style?.tileBackgroundColorOnDown ?? widget._constants.iosListTileDownColor);
          }
        },
        onPointerUp: (_) {
          if (widget.callback != null) {
            setState(() => _backgroundColor = widget.style?.tileBackgroundColor ?? Colors.white);
          }
        },
      );
    } 

    Widget androidReturn = Container(
      color: widget.style?.tileBackgroundColor ?? Colors.white,
      child: Column(
        children: [
          widget.position == ListItemPostition.Top 
          || widget.position == ListItemPostition.StandAlone 
            ? Divider( height: 1) 
            : Container(),
          Material(
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      widget.title,
                      style: widget.alwaysUseFlutterTextStyle 
                        ? widget.style?.androidTextStyle ?? widget._constants.androidPrimaryTextStyle 
                        : null,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.only(right: 20),
                      child: widget.trailing,
                    ),
                  ),
                ],
              ),
              onTap: widget.callback,
            ),
          ),
          widget.position == ListItemPostition.Top || widget.position == ListItemPostition.Middle 
            ? Divider( height: 1, indent: 16.0 ) 
            : Container(),
          widget.position == ListItemPostition.Bottom || widget.position == ListItemPostition.StandAlone 
            ? Divider(height: 1) 
            : Container(),
        ],
      ),
    );
    
    return widget.testing == true && widget.testing != null 
      ? MediaQuery(
        data: MediaQueryData.fromWindow(ui.window), 
        child: Directionality(
          textDirection: TextDirection.ltr, 
          child: androidReturn 
      )) 
      : androidReturn;
  }
}
