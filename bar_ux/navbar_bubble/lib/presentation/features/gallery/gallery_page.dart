// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// A designer mod of GSkinner's Vignette Source which is
// under MIT License and copyright 2019. See,
// https://github.com/gskinnerTeam/flutter_vignettes

// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:navbar_bubble/presentation/widgets/placeholder_image.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isLandscape = MediaQuery.of(context).size.aspectRatio > 1;
    final columnCount = isLandscape ? 4 : 2;

    return Container(
      child: GridView.count(
        crossAxisCount: columnCount,
        children: List.generate(
          20,
          //
          // ignore: prefer-extracting-callbacks
          (index) {
            return const PlaceholderImage(
              
            );
          },
        ),
      ),
    );
  }
}
