// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modification of portion of Flutter samples project named context menu
// Under Apache License see
// https://github.com/flutter/samples/tree/main/e

import 'package:context_menus/presentation/features/app/my_app.dart';
import 'package:context_menus/presentation/features/image/image_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  testWidgets(
    'Gives correct behavior for all values of contextMenuBuilder',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Navigate to the ImagePage example.
      await tester.dragUntilVisible(
        find.text(ImagePage.title),
        find.byType(ListView),
        const Offset(0.0, -100.0),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text(ImagePage.title));
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text(ImagePage.title),
        ),
        findsOneWidget,
      );

      // Right click on the FlutterLogo.
      TestGesture gesture = await tester.startGesture(
        tester.getCenter(find.byType(FlutterLogo)),
        kind: PointerDeviceKind.mouse,
        buttons: kSecondaryMouseButton,
      );
      await tester.pump();
      await gesture.up();
      await gesture.removePointer();
      await tester.pumpAndSettle();

      // The default context menu is shown with a custom button.
      expect(find.byType(AdaptiveTextSelectionToolbar), findsOneWidget);
      expect(find.text('Save'), findsOneWidget);
    },
    variant: TargetPlatformVariant.all(),
  );
}
