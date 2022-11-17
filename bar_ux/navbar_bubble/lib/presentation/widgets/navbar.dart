// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// A designer mod of GSkinner's Vignette Source which is
// under MIT License and copyright 2019. See,
// https://github.com/gskinnerTeam/flutter_vignettes


// ignore_for_file: cast_nullable_to_non_nullable

import 'package:flutter/material.dart';

import 'package:navbar_bubble/presentation/widgets/clipped_view.dart';
import 'package:navbar_bubble/presentation/widgets/navbar_button.dart';

class NavBar extends StatelessWidget {
  final ValueChanged<int>? itemTapped;
  final int currentIndex;
  final List<NavBarItemData>? items;

  const NavBar({this.items, this.itemTapped, this.currentIndex = 0,});

  NavBarItemData? get selectedItem => currentIndex >= 0 && currentIndex < items!.length ? items![currentIndex] : null;

  @override
  Widget build(BuildContext context) {
    // For each item in our list of data, create a NavBtn widget.
    final List<NavbarButton>? buttonWidgets = items?.map((data) {
      // Create a button, and add the onTap listener.
      return NavbarButton(data, data == selectedItem, onTap: () {
        // Get the index for the clicked data.
        final index = items?.indexOf(data);
        // Notify any listeners that we've been tapped, we rely on a parent widget to change our selectedIndex and redraw.
        itemTapped!(index!);
      },);
    }).toList();

    // Create a container with a row, and add our btn widgets into the row.
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        // Add some drop-shadow to our navbar, use 2 for a slightly nicer effect.
        boxShadow: [
          BoxShadow(blurRadius: 16, color: Colors.black12,),
          BoxShadow(blurRadius: 24, color: Colors.black12,),
        ],
      ),
      alignment: Alignment.center,
      height: 80,
      // Clip the row of widgets, to suppress any overflow errors that might occur during animation.
      child: ClippedView(
        child: Row(
          // Center buttons horizontally.
          mainAxisAlignment: MainAxisAlignment.center,
          // Inject a bunch of btn instances into our row.
          children: buttonWidgets as List<NavbarButton>,
        ),
      ),
    );
  }
}

class NavBarItemData {
  final String title;
  final IconData icon;
  final Color selectedColor;
  final double width;

  NavBarItemData(this.title, this.icon, this.width, this.selectedColor,);
}
