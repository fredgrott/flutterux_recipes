// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modification of portion of Flutter samples project named context menu
// Under Apache License see
// https://github.com/flutter/samples/tree/main/experimental/context_menus

// This example is based on the MenuBar docs example:
// https://master-api.flutter.dev/flutter/material/MenuBar-class.html


import 'package:context_menus/presentation/widgets/context_menu_region.dart';
import 'package:context_menus/presentation/widgets/platform_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CascadingMenuPage extends StatelessWidget {
  const CascadingMenuPage({
    super.key,
    required this.onChangedPlatform,
  });

  static const String route = 'cascading';
  static const String title = 'Cascading Menu Example';
  static const String subtitle = 'A context menu with nested submenus.';

  final PlatformCallback onChangedPlatform;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(CascadingMenuPage.title),
        actions: <Widget>[
          PlatformSelector(
            onChangedPlatform: onChangedPlatform,
          ),
          
        ],
      ),
      body: const _MyContextMenuRegion(),
    );
  }
}

class _MyContextMenuRegion extends StatefulWidget {
  const _MyContextMenuRegion();

  @override
  State<_MyContextMenuRegion> createState() => _MyContextMenuRegionState();
}

class _MyContextMenuRegionState extends State<_MyContextMenuRegion> {
  String? _lastSelection;

  Color get backgroundColor => _backgroundColor;
  Color _backgroundColor = Colors.red;
  set backgroundColor(Color value) {
    if (_backgroundColor != value) {
      setState(() {
        _backgroundColor = value;
      });
    }
  }

  bool get showingMessage => _showMessage;
  bool _showMessage = true;
  set showingMessage(bool value) {
    if (_showMessage != value) {
      setState(() {
        _showMessage = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ContextMenuRegion(
      contextMenuBuilder: (BuildContext context, Offset primaryAnchor,
          [Offset? secondaryAnchor,]) {
        return _MyCascadingContextMenu(
          anchor: primaryAnchor,
          showingMessage: _showMessage,
          onToggleMessageVisibility: () {
            setState(() {
              _showMessage = !_showMessage;
            });
          },
          onChangeBackgroundColor: (Color color) {
            setState(() {
              _backgroundColor = color;
            });
          },
          onChangeSelection: (String selection) {
            setState(() {
              _lastSelection = selection;
            });
          },
        );
      },
      child: Container(
        alignment: Alignment.center,
        color: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                showingMessage
                    ? 'Right click or long press anywhere to show the cascading menu.'
                    : '',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Text(
                _lastSelection != null ? 'Last Selected: $_lastSelection' : ''),
          ],
        ),
      ),
    );
  }
}

/// A class for consolidating the definition of menu entries.
///
/// This sort of class is not required, but illustrates one way that defining
/// menus could be done.
class MenuEntry {
  const MenuEntry(
      {required this.label, this.shortcut, this.onPressed, this.menuChildren})
      : assert(menuChildren == null || onPressed == null,
            'onPressed is ignored if menuChildren are provided');
  final String label;

  final MenuSerializableShortcut? shortcut;
  final VoidCallback? onPressed;
  final List<MenuEntry>? menuChildren;

  static List<Widget> build(List<MenuEntry> selections) {
    Widget buildSelection(MenuEntry selection) {
      if (selection.menuChildren != null) {
        return SubmenuButton(
          menuChildren: MenuEntry.build(selection.menuChildren!),
          child: Text(selection.label),
        );
      }
      return MenuItemButton(
        shortcut: selection.shortcut,
        onPressed: selection.onPressed,
        child: Text(selection.label),
      );
    }

    return selections.map<Widget>(buildSelection).toList();
  }

  static Map<MenuSerializableShortcut, Intent> shortcuts(
      List<MenuEntry> selections) {
    final Map<MenuSerializableShortcut, Intent> result =
        <MenuSerializableShortcut, Intent>{};
    for (final MenuEntry selection in selections) {
      if (selection.menuChildren != null) {
        result.addAll(MenuEntry.shortcuts(selection.menuChildren!));
      } else {
        if (selection.shortcut != null && selection.onPressed != null) {
          result[selection.shortcut!] =
              VoidCallbackIntent(selection.onPressed!);
        }
      }
    }
    return result;
  }
}

typedef _StringCallback = void Function(String string);
typedef _ColorCallback = void Function(Color color);

class _MyCascadingContextMenu extends StatefulWidget {
  const _MyCascadingContextMenu({
    required this.anchor,
    required this.onToggleMessageVisibility,
    required this.onChangeBackgroundColor,
    required this.onChangeSelection,
    required this.showingMessage,
  });

  final Offset anchor;
  final VoidCallback onToggleMessageVisibility;
  final _ColorCallback onChangeBackgroundColor;
  final _StringCallback onChangeSelection;
  final bool showingMessage;

  @override
  State<_MyCascadingContextMenu> createState() =>
      _MyCascadingContextMenuState();
}

class _MyCascadingContextMenuState extends State<_MyCascadingContextMenu> {
  ShortcutRegistryEntry? _shortcutsEntry;

  List<MenuEntry> get _menus {
    final List<MenuEntry> result = <MenuEntry>[
      MenuEntry(
      
        
        label: 'About',
        onPressed: () {
          ContextMenuController.removeAny();
          showAboutDialog(
            context: context,
            applicationName: 'MenuBar Sample',
            applicationVersion: '1.0.0',
          );
          widget.onChangeSelection('About');
        },
      ),
      MenuEntry(
        label: widget.showingMessage ? 'Hide' : 'Show',
        onPressed: () {
          ContextMenuController.removeAny();
          widget.onChangeSelection(
              widget.showingMessage ? 'Hide Message' : 'Show Message',);
          widget.onToggleMessageVisibility();
        },
        shortcut: const SingleActivator(LogicalKeyboardKey.keyS, control: true,),
      ),
      // Hides the message, but is only enabled if the message isn't
      // already hidden.
      MenuEntry(
        label: 'Reset',
        onPressed: widget.showingMessage
            ? () {
                ContextMenuController.removeAny();
                widget.onChangeSelection('Reset');
                widget.onToggleMessageVisibility();
              }
            : null,
        shortcut: const SingleActivator(LogicalKeyboardKey.escape),
      ),
      MenuEntry(
        label: 'Color',
        menuChildren: <MenuEntry>[
          MenuEntry(
            label: 'Red',
            onPressed: () {
              ContextMenuController.removeAny();
              widget.onChangeSelection('Red Background');
              widget.onChangeBackgroundColor(Colors.red);
            },
            shortcut:
                const SingleActivator(LogicalKeyboardKey.keyR, control: true,),
          ),
          MenuEntry(
            label: 'Green',
            onPressed: () {
              ContextMenuController.removeAny();
              widget.onChangeSelection('Green Background');
              widget.onChangeBackgroundColor(Colors.green);
            },
            shortcut:
                const SingleActivator(LogicalKeyboardKey.keyG, control: true,),
          ),
          MenuEntry(
            label: 'Blue',
            onPressed: () {
              ContextMenuController.removeAny();
              widget.onChangeSelection('Blue Background');
              widget.onChangeBackgroundColor(Colors.blue);
            },
            shortcut:
                const SingleActivator(LogicalKeyboardKey.keyB, control: true,),
          ),
        ],
      ),
    ];
    // (Re-)register the shortcuts with the ShortcutRegistry so that they are
    // available to the entire application, and update them if they've changed.
    _shortcutsEntry?.dispose();
    _shortcutsEntry =
        ShortcutRegistry.of(context).addAll(MenuEntry.shortcuts(result));

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return DesktopTextSelectionToolbar(
      anchor: widget.anchor,
      children: MenuEntry.build(_menus),
    );
  }

  @override
  void dispose() {
    _shortcutsEntry?.dispose();
    super.dispose();
  }

  
}
