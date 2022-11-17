// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// A designer mod of GSkinner's Vignette Source which is
// under MIT License and copyright 2019. See,
// https://github.com/gskinnerTeam/flutter_vignettes


import 'package:flutter/material.dart';

class PlaceholderImageWithText extends StatelessWidget {
  final double width;
  final double height;
  final double cornerRadius;
  final Color? color;
  final Color? backgroundColor;

  const PlaceholderImageWithText({super.key, this.cornerRadius = 0, this.color, this.backgroundColor, this.width = 100, this.height = 100,});

  @override
  Widget build(BuildContext context) {
    final fgColor = color ?? const Color(0xfff2f2f2);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        color: backgroundColor ?? Colors.white,
      ),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Expanded(child: Container(color: fgColor)),
          Stack(
            children: <Widget>[
              Container(color: fgColor, height: 16, margin: const EdgeInsets.only(top: 12, left: 10, right: 70,),),
              Container(color: fgColor, height: 10, margin: const EdgeInsets.only(top: 40, left: 10, right: 30,),),
              Container(color: fgColor, height: 10, margin: const EdgeInsets.only(top: 56, left: 10, right: 10,),),
              Container(color: fgColor, height: 10, margin: const EdgeInsets.only(top: 72, left: 10, right: 60, bottom: 12,),),
            ],
          ),

        ],
      ),
    );
  }
}
