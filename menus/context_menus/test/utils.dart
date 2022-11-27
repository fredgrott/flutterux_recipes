// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modification of portion of Flutter samples project named context menu
// Under Apache License see
// https://github.com/flutter/samples/tree/main/e

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

// Returns the first RenderEditable.
RenderEditable findRenderEditable(WidgetTester tester) {
  final RenderObject root = tester.renderObject(find.byType(EditableText));
  expect(root, isNotNull);

  late RenderEditable renderEditable;
  void recursiveFinder(RenderObject child) {
    if (child is RenderEditable) {
      renderEditable = child;
      return;
    }
    child.visitChildren(recursiveFinder);
  }

  root.visitChildren(recursiveFinder);
  expect(renderEditable, isNotNull);
  return renderEditable;
}

Offset textOffsetToPosition(WidgetTester tester, int offset) {
  final RenderEditable renderEditable = findRenderEditable(tester);
  final List<TextSelectionPoint> endpoints = globalize(
    renderEditable.getEndpointsForSelection(
      TextSelection.collapsed(offset: offset),
    ),
    renderEditable,
  );
  expect(endpoints.length, 1);
  return endpoints[0].point + const Offset(kIsWeb ? 1.0 : 0.0, -2.0);
}

List<TextSelectionPoint> globalize(
    Iterable<TextSelectionPoint> points, RenderBox box) {
  return points.map<TextSelectionPoint>((TextSelectionPoint point) {
    return TextSelectionPoint(
      box.localToGlobal(point.point),
      point.direction,
    );
  }).toList();
}
