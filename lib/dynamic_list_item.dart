import 'dart:io';

import 'package:flutter/material.dart';

import 'common/constants.dart';
import 'common/list_item_position.dart';
import 'common/ios_text_style.dart';

typedef CustomListItemCallback = void Function();

class DynamicListItem extends StatefulWidget {
  final String title;
  final Widget? trailing;
  final ListItemPostition? position;
  final CustomListItemCallback? callback;
  final Constants constants = new Constants();

  DynamicListItem({required this.title, this.trailing, this.position, this.callback});
  @override
  State<StatefulWidget> createState() => _DynamicListItemState();
}

class _DynamicListItemState extends State<DynamicListItem> {
  Color _backgroundColor = Colors.white;

  Widget buildOptionalDivider() {
    if (widget.position == ListItemPostition.Top || widget.position == ListItemPostition.Middle) {
      return Divider(
        height: 1, 
        indent: widget.constants.defaultHorizontalPadding,
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      BorderRadius _borderRadius = BorderRadius.zero;
      double _constantPadding = widget.constants.defaultHorizontalPadding;

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
            margin: EdgeInsets.symmetric(horizontal: widget.constants.defaultHorizontalPadding),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(widget.constants.defaultHorizontalPadding, 13.5, 20, 13.5),
                      child: Text(
                        widget.title,
                        style: iOSTextStyle(),
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
            setState(() {
              _backgroundColor = Colors.white;
            });
          },
        ),
        onPointerDown: (_) {
          if (widget.callback != null) {
            setState(() {
              _backgroundColor = widget.constants.iosListTileDownColor;
            });
          }
        },
        onPointerUp: (_) {
          if (widget.callback != null) {
            setState(() {
              _backgroundColor = Colors.white;
            });
          }
        },
      );
    } 
    // Android
    return Container(
      color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  widget.title,
                  style: widget.constants.androidPrimaryTextStyle,
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
    );
  }
}
