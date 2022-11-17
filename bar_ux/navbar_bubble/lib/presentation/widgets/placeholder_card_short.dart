// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// A designer mod of GSkinner's Vignette Source which is
// under MIT License and copyright 2019. See,
// https://github.com/gskinnerTeam/flutter_vignettes


import 'dart:math';

import 'package:flutter/material.dart';

class PlaceholderCardShort extends StatelessWidget {
  final double width;
  final double height;
  final double cornerRadius;
  final Color? color;
  final Color? backgroundColor;

  const PlaceholderCardShort({super.key, this.cornerRadius = 4, this.color, this.backgroundColor, this.width = 400, this.height = 90, });

  @override
  Widget build(BuildContext context) {
    //
    // ignore: prefer-correct-identifier-length
    final r = Random();
    final fgColor = color ?? const Color(0xfff2f2f2);
    const double lineHeight = 16;

    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        color: backgroundColor ?? Colors.white,
      ),
      padding: const EdgeInsets.all(26),
      child: Stack(
        children: <Widget>[
          // Circle image.
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(4)), color: fgColor,),
              height: 32,
              width: 32,
            ),
          ),

          // Content Line.
          Container(margin: EdgeInsets.only(right: 60.0 + r.nextInt(60)), color: fgColor, height: lineHeight, ),

          // Content Line.
          Container(margin: EdgeInsets.only(right: 80.0 + r.nextInt(120), top: lineHeight + 6,), color: fgColor, height: lineHeight, ),

        ],
      ),
    );
  }
}
