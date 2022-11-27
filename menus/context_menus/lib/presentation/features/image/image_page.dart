// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modification of portion of Flutter samples project named context menu
// Under Apache License see
// https://github.com/flutter/samples/tree/main/experimental/context_menus


import 'package:context_menus/presentation/widgets/context_menu_region.dart';
import 'package:context_menus/presentation/widgets/platform_selector.dart';
import 'package:flutter/material.dart';


class ImagePage extends StatelessWidget {
  const ImagePage({
    super.key,
    required this.onChangedPlatform,
  });

  static const String route = 'image';
  static const String title = 'ContextMenu on an Image';
  static const String subtitle =
      'A ContextMenu the displays on an Image widget';
  

  final PlatformCallback onChangedPlatform;

  DialogRoute _showDialog(BuildContext context) {
    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) =>
          const AlertDialog(title: Text('Image saved! (not really though)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ImagePage.title),
        actions: <Widget>[
          PlatformSelector(
            onChangedPlatform: onChangedPlatform,
          ),
          
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
                      Navigator.of(context).push(_showDialog(context));
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
          const Text(
            'Right click or long press on the image to see a special menu.',
          ),
        ],
      ),
    );
  }
}
