import 'package:custom_sidebar/sidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomSidebar Tests', () {
    testWidgets('Verify the Drawer opens in mobile view',
            (WidgetTester tester) async {
          final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

          await tester.pumpWidget(
            MaterialApp(
              home: CustomSidebar(
                scaffoldKey: scaffoldKey,
                width: 300,
                collapsedWidth: 80,
                sideBarItems: const [
                  ListTile(title: Text('Item 1')),
                  ListTile(title: Text('Item 2')),
                ],
                child: Scaffold(
                  appBar: AppBar(title: const Text('Test App')),
                ),
              ),
            ),
          );
          scaffoldKey.currentState?.openDrawer();
          await tester.pumpAndSettle();

          expect(scaffoldKey.currentState!.isDrawerOpen, isTrue);

          scaffoldKey.currentState?.closeDrawer();
          await tester.pumpAndSettle();

          expect(scaffoldKey.currentState!.isDrawerOpen, isFalse);

          await tester.tapAt(Offset.zero);
          await tester.pumpAndSettle();

          expect(scaffoldKey.currentState!.isDrawerOpen, isFalse);
        });

    testWidgets('Verify the sidebar toggles expanded and collapsed states',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: CustomSidebar(
                scaffoldKey: GlobalKey<ScaffoldState>(),
                width: 300,
                collapsedWidth: 80,
                sideBarItems: const [
                  ListTile(title: Text('Item 1')),
                  ListTile(title: Text('Item 2')),
                ],
                child: Scaffold(
                  appBar: AppBar(title: const Text('Test App')),
                ),
              ),
            ),
          );

          expect(find.byIcon(Icons.arrow_back_ios), findsOneWidget);

          await tester.tap(find.byIcon(Icons.arrow_back_ios));
          await tester.pumpAndSettle();

          expect(find.byIcon(Icons.arrow_forward_ios), findsOneWidget);

          await tester.tap(find.byIcon(Icons.arrow_forward_ios));
          await tester.pumpAndSettle();

          expect(find.byIcon(Icons.arrow_back_ios), findsOneWidget);
        });
  });
}
