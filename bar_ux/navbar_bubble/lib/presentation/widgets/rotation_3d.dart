// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// A designer mod of GSkinner's Vignette Source which is
// under MIT License and copyright 2019. See,
// https://github.com/gskinnerTeam/flutter_vignettes


import 'dart:math';

import 'package:flutter/material.dart';

// Takes a x,y or z rotation, in degrees, and rotates. Good for spins & 3d flip effects.
class Rotation3d extends StatelessWidget {
  // Degrees to rads constant.
  static const double degrees2Radians = pi/180;

  final Widget child;
  final double rotationX;
  final double rotationY;
  final double rotationZ;

  const Rotation3d({super.key, required this.child, this.rotationX=0, this.rotationY=0, this.rotationZ=0,});

  @override
  Widget build(BuildContext context) {
    return Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001,)
          ..rotateX(rotationX * degrees2Radians)
          ..rotateY(rotationY * degrees2Radians)
          ..rotateZ(rotationZ * degrees2Radians),
        child: child,);
  }
}
