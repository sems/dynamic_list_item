# Dynamic List Item

[![Flutter Analyze & Test](https://github.com/sems/dynamic_list_item/actions/workflows/flutter-test.yml/badge.svg?branch=master)](https://github.com/sems/dynamic_list_item/actions/workflows/flutter-test.yml)
![Pub Version](https://img.shields.io/pub/v/dynamic_list_item)

A dynamic list item for who wants default platform styling within Flutter apps.

## Getting Started

Simply start using the `DynamicListItem` widget in your lists. This can be done in a `ListView` but also `Column`.

The `DynamicListItem` widget has the following parameters:

- `@required title`: Used for the primary label in the list item.
- `trailing`: Trailing content within the list item. For example, an icon or a switch widget.
- `callback`: Function which is called if the list item is pressed. Can also be read as an `onTap`.
- `position`: Specified position within the given list (overall). This applies the right styling according to the platforms default (currently only iOS 15). 

### Examples

#### Simple implementation
```dart
Column(
  children: <Widget>[
    DynamicListItem(title: "Title"),
  ];
)
```

#### Implementation with trailing and positional styling
_Note: The positional styling is only applied on iOS as the time of writing._
```dart
ListView(
  padding: const EdgeInsets.all(8),
  children: <Widget>[
    DynamicListItem(
      title: "Item 1", 
      position: ListItemPostition.Top,
    ),
    DynamicListItem(
      title: "Item 2", 
      trailing: Icon(CupertinoIcons.paperplane_fill),
      position: ListItemPostition.Middle,
    ),
    DynamicListItem(
      title: "Item 3",
      trailing: Icon(CupertinoIcons.arrow_right),
      position: ListItemPostition.Bottom,
    ),
  ],
)
```
