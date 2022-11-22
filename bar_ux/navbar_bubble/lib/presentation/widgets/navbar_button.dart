// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// A designer mod of GSkinner's Vignette Source which is
// under MIT License and copyright 2019. See,
// https://github.com/gskinnerTeam/flutter_vignettes


// ignore_for_file: avoid_positional_boolean_parameters, no_leading_underscores_for_local_identifiers, cast_nullable_to_non_nullable

import 'dart:core';

import 'package:flutter/material.dart';

import 'package:navbar_bubble/presentation/widgets/clipped_view.dart';

import 'package:navbar_bubble/presentation/widgets/navbar.dart';
import 'package:navbar_bubble/presentation/widgets/rotation_3d.dart';

// Handle the transition between selected and de-deselected, by animating it's own width,
// and modifying the color/visibility of some child widgets
class NavbarButton extends StatefulWidget {
  final NavBarItemData data;
  final bool isSelected;
  final VoidCallback onTap;

  const NavbarButton(
    this.data,
    this.isSelected, {
    required this.onTap,
  });

  @override
  _NavbarButtonState createState() => _NavbarButtonState();
}

class _NavbarButtonState extends State<NavbarButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _iconAnimController;
  bool? _wasSelected;
  final double _animScale = 1;

  @override
  Widget build(BuildContext context) {
    _startAnimIfSelectedChanged(widget.isSelected);

    final num _myNum = _iconAnimController?.value as num;

    //Create our main button, a Row, with an icon and some text
    //Inject the data from our widget.data property
    final content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Rotate the icon using the current animation value.
        Rotation3d(
          rotationY: _myNum * 180 as double,
          child: Icon(
            widget.data.icon,
            size: 24,
            color: widget.isSelected ? Colors.white : const Color(0xffcccccc),
          ),
        ),
        // Add some hz spacing.
        const SizedBox(width: 12),
        // Label.
        Text(
          widget.data.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );

    // Wrap btn in GestureDetector so we can listen to taps.
    return GestureDetector(
      onTap: () => widget.onTap(),
      // Wrap in a bit of extra padding to make it easier to tap.
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 16,
        ),
        // Wrap in an animated container, so changes to width & color automatically animate into place.
        child: AnimatedContainer(
          alignment: Alignment.center,
          // Determine target width, selected item is wider.
          width: widget.isSelected ? widget.data.width : 56,
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.all(12),
          duration: Duration(milliseconds: (700 / _animScale).round()),
          // Use BoxDecoration top create a rounded container.
          decoration: BoxDecoration(
            color: widget.isSelected ? widget.data.selectedColor : Colors.white,

            borderRadius: const BorderRadius.all(Radius.circular(24)),
          ),
          // Wrap the row in a ClippedView to suppress any overflow errors if we momentarily exceed the screen size.
          child: ClippedView(
            child: content,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // Create a tween + controller which will drive the icon rotation.
    final int duration = (350 / _animScale).round();
    _iconAnimController = AnimationController(
      duration: Duration(milliseconds: duration),
      vsync: this,
    );
    Tween<double>(begin: 0, end: 1,)
        .animate(_iconAnimController!)
        // Listen for tween updates, and rebuild the widget tree on each tick.
        .addListener(() {
      //
      // ignore: no-empty-block
      setState(() {});
    });
    super.initState();
  }

  void _startAnimIfSelectedChanged(bool isSelected) {
    if (_wasSelected != widget.isSelected) {
      // Go forward or reverse, depending on the isSelected state.
      widget.isSelected
          ? _iconAnimController?.forward()
          : _iconAnimController?.reverse();
    }
    _wasSelected = widget.isSelected;
  }
}
