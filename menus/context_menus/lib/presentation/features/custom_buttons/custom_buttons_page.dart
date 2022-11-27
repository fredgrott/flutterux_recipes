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


class CustomButtonsPage extends StatelessWidget {
  CustomButtonsPage({
    super.key,
    required this.onChangedPlatform,
  });

  static const String route = 'custom-buttons';
  static const String title = 'Custom Buttons';
  static const String subtitle =
      'The usual buttons, but with a custom appearance.';

  final PlatformCallback onChangedPlatform;

  final TextEditingController _controller = TextEditingController(
    text:
        'Show the menu to see the usual default buttons, but with a custom appearance.',
  );

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(CustomButtonsPage.title),
        actions: <Widget>[
          PlatformSelector(
            onChangedPlatform: onChangedPlatform,
          ),
          
        ],
      ),
      body: Center(
        child: SizedBox(
          width: 300.0,
          child: TextField(
            controller: _controller,
            maxLines: 4,
            minLines: 2,
            contextMenuBuilder:
                (BuildContext context, EditableTextState editableTextState,) {
              return AdaptiveTextSelectionToolbar(
                anchors: editableTextState.contextMenuAnchors,
                // Build the default buttons, but make them look custom.
                // Note that in a real project you may want to build
                // different buttons depending on the platform.
                children: editableTextState.contextMenuButtonItems
                    .map((ContextMenuButtonItem buttonItem) {
                  return CupertinoButton(
                    borderRadius: null,
                    color: const Color(0xffaaaa00),
                    disabledColor: const Color(0xffaaaaff),
                    onPressed: buttonItem.onPressed,
                    padding: const EdgeInsets.all(10.0),
                    pressedOpacity: 0.7,
                    child: SizedBox(
                      width: 200.0,
                      child: Text(
                        CupertinoTextSelectionToolbarButton.getButtonLabel(
                            context, buttonItem,),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
