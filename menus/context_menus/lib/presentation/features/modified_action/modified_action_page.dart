// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modification of portion of Flutter samples project named context menu
// Under Apache License see
// https://github.com/flutter/samples/tree/main/experimental/context_menus


import 'package:context_menus/presentation/widgets/platform_selector.dart';
import 'package:flutter/material.dart';


class ModifiedActionPage extends StatelessWidget {
  ModifiedActionPage({
    super.key,
    required this.onChangedPlatform,
  });

  static const String route = 'modified-action';
  static const String title = 'Modified Action';
  static const String subtitle =
      'The copy button copies but also shows a menu.';
  

  final PlatformCallback onChangedPlatform;

  final TextEditingController _controller = TextEditingController(
    text: 'Try using the copy button.',
  );

  DialogRoute _showDialog(BuildContext context) {
    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) => const AlertDialog(
          title: Text('Copied, but also showed this dialog.'),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ModifiedActionPage.title),
        actions: <Widget>[
          PlatformSelector(
            onChangedPlatform: onChangedPlatform,
          ),
          
        ],
      ),
      body: Center(
        child: SizedBox(
          width: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'This example shows adding to the behavior of a default button.',
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                controller: _controller,
                contextMenuBuilder: (BuildContext context,
                    EditableTextState editableTextState) {
                  final List<ContextMenuButtonItem> buttonItems =
                      editableTextState.contextMenuButtonItems;
                  // Modify the copy buttonItem to show a dialog after copying.
                  final int copyButtonIndex = buttonItems.indexWhere(
                    (ContextMenuButtonItem buttonItem) {
                      return buttonItem.type == ContextMenuButtonType.copy;
                    },
                  );
                  if (copyButtonIndex >= 0) {
                    final ContextMenuButtonItem copyButtonItem =
                        buttonItems[copyButtonIndex];
                    buttonItems[copyButtonIndex] = copyButtonItem.copyWith(
                      onPressed: () {
                        copyButtonItem.onPressed();
                        Navigator.of(context).push(_showDialog(context));
                      },
                    );
                  }

                  return AdaptiveTextSelectionToolbar.buttonItems(
                    anchors: editableTextState.contextMenuAnchors,
                    buttonItems: buttonItems,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
