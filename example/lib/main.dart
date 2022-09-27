import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dynamic_list_item/dynamic_list_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic List Items'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Text(
                "Within ListView", 
                style: Theme.of(context).textTheme.headline6,
              ),
              Container(
                child: SizedBox(
                  height: 150.0,
                  child: ListView(
                    children: [
                      DynamicListItem(
                        title: "Item 1",
                        position: ListItemPostition.Top,
                      ),
                      DynamicListItem(
                        title: "Item 2",
                        position: ListItemPostition.Bottom,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Text("Within Column", style: Theme.of(context).textTheme.headline6,),
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
    );
  }
}