// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modification of portion of Flutter samples project named context menu
// Under Apache License see
// https://github.com/flutter/samples/tree/main/experimental/context_menus

// ignore_for_file: avoid_redundant_argument_values


import 'package:context_menus/presentation/features/email_button/is_valid_emial.dart';
import 'package:context_menus/presentation/widgets/platform_selector.dart';
import 'package:flutter/material.dart';


class EmailButtonPage extends StatelessWidget {
  EmailButtonPage({
    super.key,
    required this.onChangedPlatform,
  });

  static const String route = 'email-button';
  static const String title = 'Email Button';
  static const String subtitle = 'A selection-aware email button';
  

  final PlatformCallback onChangedPlatform;

  final TextEditingController _controller = TextEditingController(
    text: 'Select the email address and open the menu: me@example.com',
  );

  DialogRoute _showDialog(BuildContext context) {
    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) =>
          const AlertDialog(title: Text('You clicked send email!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(EmailButtonPage.title),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20.0),
              const Text(
                'This example shows how to add a special button to the context menu depending on the current selection.',
              ),
              const SizedBox(height: 40.0),
              TextField(
                maxLines: 2,
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
                            Navigator.of(context).push(_showDialog(context));
                          },
                        ),);
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
