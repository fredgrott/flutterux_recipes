// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modification of portion of Flutter samples project named context menu
// Under Apache License see
// https://github.com/flutter/samples/tree/main/experimental/context_menus


import 'package:context_menus/presentation/widgets/platform_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FieldTypesPage extends StatelessWidget {
  FieldTypesPage({
    super.key,
    required this.onChangedPlatform,
  });

  static const String route = 'field-types';
  static const String title = 'The Context Menu in Different Field Types';
  static const String subtitle =
      'How contextual menus work in TextField, CupertinoTextField, and EditableText';
  

  final PlatformCallback onChangedPlatform;

  final TextEditingController _controller = TextEditingController(
    text:
        "Material text field shows the menu for any platform by default. You'll see the correct menu for your platform here.",
  );

  final TextEditingController _cupertinoController = TextEditingController(
    text:
        "CupertinoTextField can't show Material menus by default. On non-Apple platforms, you'll still see a Cupertino menu here.",
  );

  final TextEditingController _cupertinoControllerFixed = TextEditingController(
    text:
        "But CupertinoTextField can be made to adaptively show any menu. You'll see the correct menu for your platform here.",
  );

  final TextEditingController _cupertinoControllerForced =
      TextEditingController(
    text: 'Or forced to always show a specific menu (Material desktop menu).',
  );

  final TextEditingController _editableController = TextEditingController(
    text:
        "EditableText doesn't show any selection menu by itself, even when contextMenuBuilder is passed.",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(FieldTypesPage.title),
        actions: <Widget>[
          PlatformSelector(
            onChangedPlatform: onChangedPlatform,
          ),
          
        ],
      ),
      body: Center(
        child: SizedBox(
          width: 400.0,
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 20.0),
              TextField(
                maxLines: 3,
                controller: _controller,
              ),
              const SizedBox(height: 60.0),
              CupertinoTextField(
                maxLines: 3,
                controller: _cupertinoController,
              ),
              const SizedBox(height: 20.0),
              CupertinoTextField(
                maxLines: 3,
                controller: _cupertinoControllerFixed,
                contextMenuBuilder: (BuildContext context,
                    EditableTextState editableTextState,) {
                  return AdaptiveTextSelectionToolbar.editableText(
                    editableTextState: editableTextState,
                  );
                },
              ),
              const SizedBox(height: 20.0),
              CupertinoTextField(
                maxLines: 3,
                controller: _cupertinoControllerForced,
                contextMenuBuilder: (BuildContext context,
                    EditableTextState editableTextState,) {
                  return DesktopTextSelectionToolbar(
                    anchor: editableTextState.contextMenuAnchors.primaryAnchor,
                    children: AdaptiveTextSelectionToolbar.getAdaptiveButtons(
                      context,
                      editableTextState.contextMenuButtonItems,
                    ).toList(),
                  );
                },
              ),
              const SizedBox(height: 60.0),
              Container(
                color: Colors.white,
                child: EditableText(
                  maxLines: 3,
                  controller: _editableController,
                  focusNode: FocusNode(),
                  style: Typography.material2021().black.displayMedium!,
                  cursorColor: Colors.blue,
                  backgroundCursorColor: Colors.white,
                  // contextMenuBuilder doesn't do anything here!
                  // EditableText has no built-in gesture detection for
                  // selection. A wrapper would have to implement
                  // TextSelectionGestureDetectorBuilderDelegate, etc.
                  contextMenuBuilder: (BuildContext context,
                      EditableTextState editableTextState) {
                    return AdaptiveTextSelectionToolbar.editableText(
                      editableTextState: editableTextState,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
