import 'package:dynamic_list_item/dynamic_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
/// Main class for testing the Dynamic List Item.
/// Make sure you set the 'testing' parameter to true.
void main() {
  group('Dynamic List Item can have a:', () {
    testWidgets("title", (WidgetTester tester) async {
      await tester.pumpWidget(DynamicListItem(title: "T", testing: true,));
      
      final titleFinder = find.text("T");
      
      expect(titleFinder, findsOneWidget);
    });
    testWidgets("title and trailing text", (WidgetTester tester) async {
      await tester.pumpWidget(DynamicListItem(title: "T", trailing: Text("Trail"), testing: true,));
      
      final titleFinder = find.text("T");
      final trailingFinder = find.text("Trail");
      
      expect(titleFinder, findsOneWidget);
      expect(trailingFinder, findsOneWidget);
    });
    testWidgets("title and trailing icon", (WidgetTester tester) async {
      await tester.pumpWidget(DynamicListItem(title: "T", trailing: Icon(Icons.arrow_forward), testing: true,));
      
      final titleFinder = find.text("T");
      final trailingIconFinder = find.widgetWithIcon(InkWell, Icons.arrow_forward);
      
      expect(titleFinder, findsOneWidget);
      expect(trailingIconFinder, findsOneWidget);
    });
  });
}
