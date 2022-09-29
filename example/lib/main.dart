import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dynamic_list_item/dynamic_list_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var styling = DynamicListItemStyle(
      overridePlatformStyling: TargetPlatform.android,
      colorTheme: DynamicListItemColorTheme(
        // tileBackgroundColorAndroid: Colors.amber[600],
        tileBackgroundColoriOS: Colors.amber[600],
      ),
    );

    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        canvasColor: Colors.black,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic List Items'),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Text("Within ListView"),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: Text(
                      "The following list also uses the override for Android styling."),
                ),
                Container(
                  child: SizedBox(
                    height: 250.0,
                    child: ListView(
                      children: [
                        DynamicListItem(
                          title: "Item 1",
                          position: ListItemPostition.Top,
                          style: styling,
                        ),
                        DynamicListItem(
                          title: "Item 2",
                          position: ListItemPostition.Middle,
                          style: styling,
                        ),
                        DynamicListItem(
                          title: "Item 3 with callback",
                          position: ListItemPostition.Bottom,
                          style: styling,
                          callback: () {
                            // Do something
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text("Within Column"),
                    DynamicListItem(
                      title: "Title and position only",
                      position: ListItemPostition.Top,
                    ),
                    DynamicListItem(
                      title: "Without callback",
                      trailing: Icon(CupertinoIcons.arrow_right),
                      position: ListItemPostition.Middle,
                    ),
                    DynamicListItem(
                      title: "With callback",
                      trailing: Icon(CupertinoIcons.trash),
                      callback: () {
                        // Do something
                      },
                      position: ListItemPostition.Bottom,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: DynamicListItem(
                    title: "Standalone",
                    position: ListItemPostition.StandAlone,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
