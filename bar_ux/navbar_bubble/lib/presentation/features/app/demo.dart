// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// A designer mod of GSkinner's Vignette Source which is
// under MIT License and copyright 2019. See,
// https://github.com/gskinnerTeam/flutter_vignettes

// ignore_for_file: sized_box_for_whitespace, cast_nullable_to_non_nullable, avoid_dynamic_calls

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navbar_bubble/presentation/features/camera/camera_page.dart';
import 'package:navbar_bubble/presentation/features/gallery/gallery_page.dart';
import 'package:navbar_bubble/presentation/features/home/home_page.dart';
import 'package:navbar_bubble/presentation/features/likes/likes_page.dart';
import 'package:navbar_bubble/presentation/features/save/save_page.dart';
import 'package:navbar_bubble/presentation/themes/semantic_colors.dart';

import 'package:navbar_bubble/presentation/widgets/navbar.dart';

class BubbleTabBarDemo extends StatefulWidget {
  @override
  _BubbleTabBarDemoState createState() => _BubbleTabBarDemoState();
}

class _BubbleTabBarDemoState extends State<BubbleTabBarDemo> {
  
  int _selectedNavIndex = 0;

  List<Widget>? _viewsByIndex;

  @override
  Widget build(BuildContext context) {
    final ExtraSemanticColors? mySemantic = Theme.of(context).extension<ExtraSemanticColors>();

    
    // Display the correct child view for the current index.
    final contentView =
        _viewsByIndex?[min(_selectedNavIndex, (_viewsByIndex?.length)! - 1)];
    // Wrap our custom navbar + contentView with the app Scaffold.

    return Scaffold(
      backgroundColor: const Color(0xffE6E6E6),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          // Wrap the current page in an AnimatedSwitcher for an easy cross-fade effect.
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            // Pass the current accent color down as a theme, so our overscroll indicator matches the btn color.
            child: contentView,
          ),
        ),
      ),
      bottomNavigationBar: NavBar(
        items: [
          NavBarItemData(
            "Home",
            Icons.home,
            110,
            mySemantic?.appExtraSemanticOne as Color,
          ),
          NavBarItemData(
            "Gallery",
            Icons.image,
            110,
            mySemantic?.appExtraSemanticTwo as Color,
          ),
          NavBarItemData(
            "Camera",
            Icons.camera,
            115,
            mySemantic?.appExtraSemanticThree as Color,
          ),
          NavBarItemData(
            "Likes",
            Icons.favorite,
            100,
            mySemantic?.appExtraSemanticFour as Color,
          ),
          NavBarItemData(
            "Saved",
            Icons.save,
            105,
            mySemantic?.appExtraSemanticFive as Color,
          ),

        ],
        itemTapped: _handleNavBtnTapped,
        currentIndex: _selectedNavIndex,
      ), // Pass our custom navBar into the scaffold.
    );
  }

  @override
  void initState() {
    

    // Create the views which will be mapped to the indices for our nav btns.
    _viewsByIndex = <Widget>[
      HomePage(),
      GalleryPage(),
      CameraPage(),
      LikesPage(),
      SavePage(),
    ];
    super.initState();
  }

  void _handleNavBtnTapped(int index) {
    // Save the new index and trigger a rebuild.
    setState(() {
      // This will be passed into the NavBar and change it's selected state, also controls the active content page.
      _selectedNavIndex = index;
    });
  }
}
