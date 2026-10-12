import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:obbian_assessment/main.dart';
import 'package:obbian_assessment/screens/mobile_screen.dart';
import 'package:obbian_assessment/screens/web_screen.dart';

void main() {
  testWidgets('App loads Mobile view on small viewports and Web view on large viewports',
      (WidgetTester tester) async {
    // 1. Mobile viewport test (375x812)
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    await tester.pumpWidget(const ObbianAssessmentApp());
    await tester.pumpAndSettle();

    expect(find.byType(AssessmentShell), findsOneWidget);
    expect(find.byType(MobileScreen), findsOneWidget);

    // 2. Desktop viewport test (1920x1080)
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    await tester.pumpWidget(const ObbianAssessmentApp());
    await tester.pumpAndSettle();

    expect(find.byType(AssessmentShell), findsOneWidget);
    expect(find.byType(WebScreen), findsOneWidget);

    addTearDown(tester.view.resetPhysicalSize);
  });

  testWidgets('Toolbar switcher toggles between modes', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1440, 900);
    tester.view.devicePixelRatio = 1.0;
    await tester.pumpWidget(const ObbianAssessmentApp());
    await tester.pumpAndSettle();

    // Default on 1440 width in Auto mode should show WebScreen
    expect(find.byType(WebScreen), findsOneWidget);

    // Tap 'Mobile' button in toolbar
    final mobileBtn = find.byIcon(Icons.smartphone_rounded);
    expect(mobileBtn, findsOneWidget);
    await tester.tap(mobileBtn);
    await tester.pumpAndSettle();

    // Should now display MobileScreen framed
    expect(find.byType(MobileScreen), findsOneWidget);

    // Tap 'Desktop' button
    final desktopBtn = find.byIcon(Icons.laptop_mac_rounded);
    expect(desktopBtn, findsOneWidget);
    await tester.tap(desktopBtn);
    await tester.pumpAndSettle();

    expect(find.byType(WebScreen), findsOneWidget);

    // Tap 'Split' button
    final splitBtn = find.byIcon(Icons.view_sidebar_rounded);
    expect(splitBtn, findsOneWidget);
    await tester.tap(splitBtn);
    await tester.pumpAndSettle();

    // Both should be in the tree
    expect(find.byType(WebScreen), findsOneWidget);
    expect(find.byType(MobileScreen), findsOneWidget);

    addTearDown(tester.view.resetPhysicalSize);
  });

  testWidgets('Renders clean without overflow on standard device viewports',
      (WidgetTester tester) async {
    final viewports = [
      const Size(360, 740),
      const Size(375, 812),
      const Size(390, 844),
      const Size(414, 896),
      const Size(768, 1024),
      const Size(1280, 800),
      const Size(1440, 900),
      const Size(1920, 1080),
    ];

    for (final size in viewports) {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(const ObbianAssessmentApp());
      await tester.pumpAndSettle();
      expect(find.byType(AssessmentShell), findsOneWidget);
    }

    addTearDown(tester.view.resetPhysicalSize);
  });
}
