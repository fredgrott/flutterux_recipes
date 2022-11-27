// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modification of portion of Flutter samples project named context menu
// Under Apache License see
// https://github.com/flutter/samples/tree/main/experimental/context_menus


import 'package:context_menus/presentation/features/email_button/is_valid_emial.dart';
import 'package:context_menus/presentation/widgets/context_menu_region.dart';
import 'package:context_menus/presentation/widgets/platform_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FullPage extends StatelessWidget {
  FullPage({
    super.key,
    required this.onChangedPlatform,
  });

  static const String route = 'full';
  static const String title = 'Combined Example';
  static const String subtitle =
      'Combining several different types of custom menus.';
  

  final PlatformCallback onChangedPlatform;

  final TextEditingController _controller = TextEditingController(
    text: 'Custom menus everywhere. me@example.com',
  );

  DialogRoute _showDialog(BuildContext context, String message) {
    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(title: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(FullPage.title),
        actions: <Widget>[
          PlatformSelector(
            onChangedPlatform: onChangedPlatform,
          ),
          
        ],
      ),
      body: ContextMenuRegion(
        contextMenuBuilder: (BuildContext context, Offset offset) {
          return AdaptiveTextSelectionToolbar.buttonItems(
            anchors: TextSelectionToolbarAnchors(
              primaryAnchor: offset,
            ),
            buttonItems: <ContextMenuButtonItem>[
              ContextMenuButtonItem(
                onPressed: () {
                  ContextMenuController.removeAny();
                  Navigator.of(context).pop();
                },
                label: 'Back',
              ),
            ],
          );
        },
        child: Center(
          child: SizedBox(
            width: 400.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'This example simply shows how many of the previous examples can be combined in a single app.',
                ),
                const SizedBox(
                  height: 60.0,
                ),
                ContextMenuRegion(
                  contextMenuBuilder: (BuildContext context, Offset offset) {
                    return AdaptiveTextSelectionToolbar.buttonItems(
                      anchors: TextSelectionToolbarAnchors(
                        primaryAnchor: offset,
                      ),
                      buttonItems: <ContextMenuButtonItem>[
                        ContextMenuButtonItem(
                          onPressed: () {
                            ContextMenuController.removeAny();
                            Navigator.of(context).push(_showDialog(
                                context, 'Image saved! (not really though)'));
                          },
                          label: 'Save',
                        ),
                      ],
                    );
                  },
                  child: const SizedBox(
                    width: 200.0,
                    height: 200.0,
                    child: FlutterLogo(),
                  ),
                ),
                Container(height: 20.0),
                TextField(
                  controller: _controller,
                  contextMenuBuilder: (BuildContext context,
                      EditableTextState editableTextState,) {
                    final TextEditingValue value =
                        editableTextState.textEditingValue;
                    final List<ContextMenuButtonItem> buttonItems =
                        editableTextState.contextMenuButtonItems;
                    if (isValidEmail(value.selection.textInside(value.text))) {
                      buttonItems.insert(
                          0,
                          ContextMenuButtonItem(
                            label: 'Send email',
                            onPressed: () {
                              ContextMenuController.removeAny();
                              Navigator.of(context).push(_showDialog(
                                  context, 'You clicked send email',),);
                            },
                          ),);
                    }

                    return AdaptiveTextSelectionToolbar(
                      anchors: editableTextState.contextMenuAnchors,
                      // Build the default buttons, but make them look crazy.
                      // Note that in a real project you may want to build
                      // different buttons depending on the platform.
                      children:
                          buttonItems.map((ContextMenuButtonItem buttonItem) {
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
                              CupertinoTextSelectionToolbarButton
                                  .getButtonLabel(context, buttonItem),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
