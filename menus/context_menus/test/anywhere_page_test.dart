// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modification of portion of Flutter samples project named context menu
// Under Apache License see
// https://github.com/flutter/samples/tree/main/e

import 'package:context_menus/presentation/features/anywhere/anywhere_page.dart';
import 'package:context_menus/presentation/features/app/my_app.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  testWidgets('Right click works outside of text', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Navigate to the AnywherePage example.
    await tester.dragUntilVisible(
      find.text(AnywherePage.title),
      find.byType(ListView),
      const Offset(0.0, -100.0),
    );
    await tester.tap(find.text(AnywherePage.title));
    await tester.pumpAndSettle();

    // Right click on the background of the app to show the context menu.
    final TestGesture gesture = await tester.startGesture(
      const Offset(100.0, 100.0),
      kind: PointerDeviceKind.mouse,
      buttons: kSecondaryMouseButton,
    );
    await tester.pump();
    await gesture.up();
    await gesture.removePointer();
    await tester.pumpAndSettle();

    // The context menu is shown, with a custom back button.
    expect(find.byType(AdaptiveTextSelectionToolbar), findsOneWidget);
    expect(find.text('Back'), findsOneWidget);
  });
}
