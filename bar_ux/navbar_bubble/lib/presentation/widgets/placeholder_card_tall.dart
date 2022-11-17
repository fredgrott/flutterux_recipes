// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// A designer mod of GSkinner's Vignette Source which is
// under MIT License and copyright 2019. See,
// https://github.com/gskinnerTeam/flutter_vignettes


import 'dart:math';

import 'package:flutter/material.dart';

class PlaceholderCardTall extends StatelessWidget {

  final double width;
  final double? height;
  final double cornerRadius;
  final Color? color;
  final Color? backgroundColor;

  const PlaceholderCardTall({super.key, this.cornerRadius = 4, this.color, this.backgroundColor, this.width = 400, this.height,});

  @override
  Widget build(BuildContext context) {
    //
    // ignore: prefer-correct-identifier-length
    final r = Random();
    final fgColor = color ?? const Color(0xfff2f2f2);
    const double lineHeight = 14;

    return Container(
      width: width,
      height: height ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        color: backgroundColor ?? Colors.white,
      ),
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: <Widget>[
          // Circle image.
          Container(
            decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(999)), color: fgColor,),
            height: 45,
            width: 45,
          ),
          // Title.
          Container(margin: const EdgeInsets.only(left: 65, top: 10,), color: fgColor, height: lineHeight * 1.2, width: 100.0 + r.nextInt(100),),

          // Content Line.
          Container(margin: EdgeInsets.only(top: 60, right: 10.0 + r.nextInt(60),), color: fgColor, height: lineHeight,),

          // Content Line.
          Container(margin: EdgeInsets.only(top: 85, right: 10.0 + r.nextInt(60),), color: fgColor, height: lineHeight,),

          // Content Line.
          Container(margin: EdgeInsets.only(top: 110, right: 10.0 + r.nextInt(60),), color: fgColor, height: lineHeight,),

          // Content Line.
          Container(margin: EdgeInsets.only(top: 135, right: 60.0 + r.nextInt(60),), color: fgColor, height: lineHeight,),
        ],
      ),
    );
  }
}
