// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// A designer mod of GSkinner's Vignette Source which is
// under MIT License and copyright 2019. See,
// https://github.com/gskinnerTeam/flutter_vignettes


import 'package:flutter/material.dart';

// Hides the overflow of a child, preventing the Flutter framework from throwing errors.
class ClippedView extends StatelessWidget {
  final Widget? child;
  final Axis clipDirection;

  const ClippedView({super.key, this.child, this.clipDirection = Axis.horizontal,});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: clipDirection,
      child: child,
    );
  }
}
